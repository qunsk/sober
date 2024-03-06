package sober.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import sober.model.AlarmDTO;
import sober.model.PartyRe;
import sober.service.PartyReService;

@Controller
public class PartyReController {

   
   @Autowired
   private PartyReService pr;
   
   /* json으로 바꾸기 전에는 이 코드로 댓글을 비동기로 불러와 처리했습니다. */
   @RequestMapping("party_re_list")
   public String partylist(@RequestParam("bo_num") int bo_num,Model model) {
      
      
      List<PartyRe> relist = pr.getPartyList(bo_num);
      
      // 댓글 수정시 사용하는 코드 
       ObjectMapper objectMapper = new ObjectMapper();
           String jsonList = null;
           try {
               jsonList = objectMapper.writeValueAsString(relist);
           } catch (JsonProcessingException e) {
               e.printStackTrace();
           }

           model.addAttribute("relistJSON", jsonList) ;
      
      
      
      model.addAttribute("relist",relist);
      model.addAttribute("bo_num",bo_num);
      
      return "party/party_re_list";
   }
   
   
   //원문 댓글  insert
   @RequestMapping("re_insert")
   public String reInsert(PartyRe reply,
         String receiver,
         Model model) {
      

      int result = pr.re_insert(reply);
      
      if(result == 1) {
         
         
         if(!reply.getNickname().equals(receiver)) {
            // 원문 댓글이 insert 되면 답글이 달렸다는 알림을 insert 한다. ( bo_num / receiver )
            AlarmDTO alarm = new AlarmDTO();
            alarm.setReceiver_nickname(receiver);
            alarm.setBoard_pk(reply.getBo_num());
            alarm.setSender_nickname(reply.getNickname());

            result = pr.replyinsertAlarm(alarm);
            
            if(result == 1) {
            }
         }
      }
      
      return "redirect:party_re_list?bo_num="+reply.getBo_num();
   }

   
   @RequestMapping("re_insert_re")
   public String reInsertRe(PartyRe reply,Model model) {
      
      int result = pr.re_step_update(reply.getRe_ref());
      if( result > 0){
      }
      
      result = pr.re_insert_re(reply);
      
      if(result == 1) {
         
         // 답글에 답글이 달리면 답글 작성자에게 알림을 보낸다. 
         AlarmDTO alarm = new AlarmDTO();
         String receiver = pr.getNickname(reply.getRe_ref());
         
         if(!reply.getNickname().equals(receiver)) {
            alarm.setReceiver_nickname(receiver);
            alarm.setBoard_pk(reply.getBo_num());
            alarm.setSender_nickname(reply.getNickname());
            result = pr.reReplyinsertAlarm(alarm);
            
            if(result == 1) {
            }
         }
         
      }
      
      return "redirect:party_re_list?bo_num="+reply.getBo_num();
   }
   
   
   //댓글 내용 수정
    @RequestMapping("party_re_update")
    @ResponseBody
    public String party_re_update(PartyRe reply) {
       
       pr.re_update_con(reply);
       
       return "success";
    }
   
    
    //댓글 삭제
    @RequestMapping("party_re_delete")
    public String party_re_delete(PartyRe reply,String sender_nickname) {
       // bo_num 과 re_num이 넘어옴 
    // 우선 ref값으로 같은 ref중에서 step이 0 이상인 애들이 있다면 update를 해야한다. 
       
       int result = 0;
       AlarmDTO alarm = new AlarmDTO();
       
       alarm.setBoard_pk(reply.getBo_num());
       
       if(reply.getRe_step()==0) { //원문댓글이면 하위 댓글이 있는지 구한다. 
          
          alarm.setSender_nickname(sender_nickname);
          alarm.setComment_num(2);
          // 여기서 댓글이 달렸다는 알림이 read_NY 가 N이면 알림을 삭제한다. 
          pr.deleteReplyAlarm(alarm);
          
          
           result = pr.getReReplyNum(reply.getRe_ref());
           
           
           if(result > 0 ) {
              pr.deleteUpdateRe(reply.getRe_num());
           }else {
              result = pr.deleteReply(reply.getRe_num());
           }
           
       }else {  // 하위 댓글이면 바로 삭제.
          
          String replyWriter = pr.getNickname(reply.getRe_ref());
          alarm.setSender_nickname(replyWriter);
          alarm.setComment_num(3);
          pr.deleteReplyAlarm(alarm);
          
           result = pr.deleteReply(reply.getRe_num());
           
           // 하위 댓글의 상위 댓글이 삭제된 원문댓글이면 그 친구도 삭제.
           result = pr.deleteReplyParent(reply);
       }
       return "redirect:party_re_list?bo_num="+reply.getBo_num(); 
    }
   
   
   
}