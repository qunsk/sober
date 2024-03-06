package sober.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.protocol.HTTP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import sober.model.AlarmDTO;
import sober.model.RecipeReply;
import sober.service.RecipeReplyService;
import sober.service.RecipeService;

@Controller
public class RecipeReplyController {

	@Autowired
	RecipeReplyService rrs;
	
	@Autowired
	RecipeService rs;
	
	/* 댓글 목록 구하기 */
	@RequestMapping("recipeReplyList")
	public String recipeReply(String receiver_nickname, int r_num, HttpSession session, Model model) {
		if(session.getAttribute("receiver_nickname") != null) {
			receiver_nickname = (String)session.getAttribute("receiver_nickname");
		}
		List<RecipeReply> relist = rrs.relist(r_num);
		
		ObjectMapper objectMapper = new ObjectMapper(); String jsonList = null; 
		
		try {
		jsonList = objectMapper.writeValueAsString(relist); 
		} catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		if(receiver_nickname != "" && receiver_nickname != null) {
			model.addAttribute("receiver_nickname", receiver_nickname);
		}
		
		// 프로필 사진 처리
		if (session.getAttribute("nickname") != null) {
			String profile = rs.getMemberProfile((String) session.getAttribute("nickname"));
			model.addAttribute("userProfile", profile);
		}
				
		model.addAttribute("relistJSON", jsonList);
		model.addAttribute("relist", relist);
		model.addAttribute("r_num", r_num);
		
		return "recipe/recipeReplyList";
	}
	
	/* 댓글 작성 */
	@RequestMapping("replyInsert")
	public String replyInsert(String receiver_nickname, AlarmDTO alarm, RecipeReply reply, HttpSession session, Model model, RedirectAttributes attr) {
		
		String user = (String)session.getAttribute("nickname");
		if(user == null) {
			user="";
		}
		
		int result = rrs.replyInsert(reply);
		
		if(result == 1) {
			if(!receiver_nickname.equals(reply.getNickname())) {
				alarm.setBoard_pk(reply.getR_num());
				alarm.setSender_nickname(reply.getNickname());
				rrs.reply_alarm(alarm);
			}
		}
		
//		String receiverNick = URLEncoder.encode(alarm.getReceiver_nickname());
		attr.addFlashAttribute("receiver_nickname", receiver_nickname);
		
		return "redirect:recipeReplyList?r_num="+reply.getR_num();
	}
	
	/* 대댓글 작성 */
	@RequestMapping("re_replyInsert")
	public String reInsertRe(@RequestParam("receiver_nickname") String receiver_nickname, AlarmDTO alarm, RecipeReply reply, HttpSession session, Model model) {
		
		/*
		 * if(receiver_nickname != "" && receiver_nickname != null) {
		 * model.addAttribute("receiver_nickname", receiver_nickname); }
		 */

		
		String user = (String)session.getAttribute("nickname");
		if(user == null) {
			user="";
		}
		
		
		int result = rrs.reLevelUp(reply.getRe_ref());
		
		result = rrs.replyInsert(reply);
		/* result = rrs.re_replyInsert(reply); */
		String nickname = rrs.getNick(reply.getRe_ref());	// 원댓글 작성자
		
		if(result == 1) {
			if(!user.equals(nickname)) {
				alarm.setBoard_pk(reply.getR_num());
				alarm.setReceiver_nickname(nickname);
				alarm.setSender_nickname(user);
				 rrs.re_reply_alarm(alarm); 
			}
			  
		}
		String receiverNick = URLEncoder.encode(alarm.getReceiver_nickname());
		return "redirect:recipeReplyList?r_num="+reply.getR_num()+"&receiver_nickname="+receiverNick;
	}
	
	/* 댓글 수정 */
	@RequestMapping("replyUp")
	@ResponseBody
    public String replyUp(RecipeReply reply) {
    	
    	int result = rrs.reUpCont(reply);
    	
    	return "success";
    }
	
	/* 댓글 삭제 */
	@RequestMapping("replyDel")
	public String replyDel(String receiver_nickname, AlarmDTO alarm, RecipeReply reply, HttpSession session) {
		
		int result = 0;
		
		String user = (String)session.getAttribute("nickname");
		if(user == null) {
			user="";
		}
		
		// 게시물 작성자
		String bo_writer = receiver_nickname;
		// 댓글 작성자
		String re_writer = rrs.getNick(reply.getRe_ref());	// 원댓글 작성자
		
		if(reply.getRe_level() == 0) {	// 댓글인 경우, 대댓글이 있는지 없는지 확인
			result = rrs.getReReplyNum(reply.getRe_ref());
			if(!bo_writer.equals(user)) {
				alarm.setComment_num(11);
				alarm.setBoard_pk(reply.getR_num());
				alarm.setReceiver_nickname(bo_writer);
				alarm.setSender_nickname(user);
				rrs.reply_alarm_del(alarm); 
			}
		
			if(result > 0) {	// 대댓글이 있는 경우 (del_yn='Y'로 update)
				rrs.replyDelUp(reply.getRe_num());
			}else {				// 대댓글이 없는 경우 (delete)
				result = rrs.replyDel(reply.getRe_num());
			}
		}else { // 대댓글이 없는 댓글인 경우 (delete)
			result = rrs.replyDel(reply.getRe_num());
			if(!bo_writer.equals(user)) {
				alarm.setComment_num(12);
				alarm.setBoard_pk(reply.getR_num());
				alarm.setReceiver_nickname(re_writer);
				alarm.setSender_nickname(user);
				rrs.reply_alarm_del(alarm); 
			}
		}
		
		String receiverNick = URLEncoder.encode(alarm.getReceiver_nickname());
		return "redirect:recipeReplyList?r_num="+reply.getR_num()+"&receiver_nickname="+receiverNick;
	}
}
