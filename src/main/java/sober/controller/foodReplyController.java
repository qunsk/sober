package sober.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import sober.model.AlarmDTO;
import sober.model.foodReplyModel;
import sober.service.foodReplyService;
import sober.service.foodService;

@Controller
public class foodReplyController {

	@Autowired
	foodReplyService frr;
	
	@Autowired
	foodService fs;
	
	/* 댓글 목록 구하기 */
	@RequestMapping("foodReplyList")
	public String foodReply(String receiver_nickname, int f_num, Model model, HttpSession session) {
		
		if(session.getAttribute("receiver_nickname") != null) {
			receiver_nickname = (String)session.getAttribute("receiver_nickname");
		}
		
		List<foodReplyModel> relist = frr.relist(f_num);
		
		ObjectMapper objectMapper = new ObjectMapper(); String jsonList = null; try {
		jsonList = objectMapper.writeValueAsString(relist); } catch
		(JsonProcessingException e) { e.printStackTrace(); }
		
		if(receiver_nickname != "" && receiver_nickname != null) {
	         model.addAttribute("receiver_nickname", receiver_nickname);
	      }
		String user = (String)session.getAttribute("nickname");
	      
		if(user == null) {
	         user="";
	     }
	      
	     if (session.getAttribute("nickname") != null) {
			String profile = fs.getMemberProfile((String) session.getAttribute("nickname"));
			model.addAttribute("userProfile", profile);
		}
	     
		model.addAttribute("relistJSON", jsonList);
		model.addAttribute("relist", relist);
		model.addAttribute("f_num", f_num);
		
		return "food/foodReplyList";
	}
	
	/* 댓글 작성 */
	@RequestMapping("foodreplyInsert")
	public String replyInsert(String receiver_nickname, AlarmDTO alarm, foodReplyModel reply, Model model, HttpSession session, RedirectAttributes attr) {
		
		String user = (String)session.getAttribute("nickname");
	      if(user == null) {
	         user="";
	      }
		
//		System.out.println("댓글 insert 함수 도달");
		int result = frr.replyInsert(reply);
		
		if(result == 1) {
//			System.out.println("댓글 insert 성공");
//			System.out.println("receiver_nickname"+receiver_nickname);
			
			if(!receiver_nickname.equals(reply.getNickname())) {
	            alarm.setBoard_pk(reply.getF_num());
	            alarm.setSender_nickname(reply.getNickname());
	            frr.reply_alarm(alarm);
//	            System.out.println("alarm f_num:"+alarm.getBoard_pk());
//	            System.out.println("알람 받는 사람"+alarm.getSender_nickname());
			}
		}
//		String receiverNick = URLEncoder.encode(alarm.getReceiver_nickname());
		attr.addFlashAttribute("receiver_nickname", receiver_nickname);
		return "redirect:foodReplyList?f_num="+reply.getF_num();
	}
	
	/* 대댓글 작성 */
	@RequestMapping("foodre_replyInsert")
	public String reInsertRe(String receiver_nickname, AlarmDTO alarm, foodReplyModel reply,Model model, HttpSession session) {
		
		/*if(reply.getContent().equals("")||reply.getContent()==null) {
			reply.setContent(re_content);
		}*/
		String user = (String)session.getAttribute("nickname");
	      if(user == null) {
	         user="";
	      }
		
//		System.out.println("대댓글 insert하는 reInsertRe() 함수 도달");
		
		
//		System.out.println("f_num: "+reply.getF_num());
//		System.out.println("content: "+reply.getContent());
//		System.out.println("nickname: "+reply.getNickname());
//		System.out.println("step: "+reply.getRe_step());
//		System.out.println("ref: "+reply.getRe_ref());
		
		int result = frr.reLevelUp(reply.getRe_ref());
		if( result > 0){
//			System.out.println("이전 대댓들은 step값 올렸음. re_step이 0 인 board는 제외");
		}
		
		result = frr.replyInsert(reply);
		/* result = rrs.re_replyInsert(reply); */
		
		String nickname = frr.getNick(reply.getRe_ref());   // 원댓글 작성자
		
		if(result == 1) {
//			System.out.println("대댓글 원문 insert 성공");
			if(!user.equals(nickname)) {
	            alarm.setBoard_pk(reply.getF_num());
	            alarm.setReceiver_nickname(nickname);
	            alarm.setSender_nickname(user);
	            frr.re_reply_alarm(alarm); 
	         }
		}
		
		String receiverNick = URLEncoder.encode(alarm.getReceiver_nickname());
		return "redirect:foodReplyList?f_num="+reply.getF_num()+"&receiver_nickname="+receiverNick;
	}
	
	/* 댓글 수정 */
	@RequestMapping("foodreplyUp")
	@ResponseBody
    public String replyUp(foodReplyModel reply) {
    
//    	System.out.println("댓글 수정할 때 re_num :"+reply.getRe_num());
//      System.out.println("댓글 수정할 때 content :"+reply.getContent());
    	
    	int result = frr.reUpCont(reply);
    	
    	if(result==1) {
//    		System.out.println("댓글 내용 수정 성공");
    	}
    	
    	return "success";
    }
	
	/* 댓글 삭제 */
	@RequestMapping("foodreplyDel")
	public String replyDel(String receiver_nickname, AlarmDTO alarm, foodReplyModel reply, HttpSession session) {
		
		String user = (String)session.getAttribute("nickname");
	      if(user == null) {
	         user="";
	      }
		
		int result = 0;
		
		// 게시물 작성자
	      String bo_writer = receiver_nickname;
	      // 댓글 작성자
	      String re_writer = frr.getNick(reply.getRe_ref());   // 원댓글 작성자
		
		if(reply.getRe_step() == 0) {
			result = frr.getReReplyNum(reply.getRe_ref());
			if(!bo_writer.equals(user)) {
	            alarm.setComment_num(15);
	            alarm.setBoard_pk(reply.getF_num());
	            alarm.setReceiver_nickname(bo_writer);
	            alarm.setSender_nickname(user);
	            frr.reply_alarm_del(alarm); 
	         }
			
			
			if(result > 0) {	// 대댓글이 있는 경우 (del_yn='Y'로 update)
				frr.replyDelUp(reply.getRe_num());
			}else {
				result = frr.replyDel(reply.getRe_num());
			}
		}else {
			result = frr.replyDel(reply.getRe_num());
			if(!bo_writer.equals(user)) {
//	            System.out.println("대댓 삭제 알림");
	            alarm.setComment_num(16);
	            alarm.setBoard_pk(reply.getF_num());
	            alarm.setReceiver_nickname(re_writer);
	            alarm.setSender_nickname(user);
	            frr.reply_alarm_del(alarm); 
//	            System.out.println("re_writer:"+re_writer);
//	            System.out.println("user:"+user);
	         }
		}
		
		String receiverNick = URLEncoder.encode(alarm.getReceiver_nickname());
		return "redirect:foodReplyList?f_num="+reply.getF_num()+"&receiver_nickname="+receiverNick;
	}
	
	
}
