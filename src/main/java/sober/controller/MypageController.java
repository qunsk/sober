package sober.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import sober.model.ActiveDTO;
import sober.model.MessageDTO;
import sober.model.PagingCriteria;
import sober.model.PagingMaker;
import sober.model.PartyScheduleDTO;
import sober.model.ProfileDTO;
import sober.model.ProfileMaker;
import sober.service.MypageService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Setter(onMethod_ = @Autowired)
	private MypageService service;
	
//	마이페이지 눌렀을 때 마이페이지 메인 페이지
	@GetMapping("/")
	public String mypageMain(HttpSession session, Model model) {
		String nickname = (String)session.getAttribute("nickname");
		ProfileDTO profile = service.getProfile(nickname);
		
		if(profile.getKeyword() != null) {
			String[] keywords = profile.getKeyword().split(",");
			model.addAttribute("keywords", keywords);
		}	
		ProfileMaker profileMaker = new ProfileMaker(profile);
		
		//프로필 카드 만드는 정보
		model.addAttribute("profileMaker", profileMaker);
		model.addAttribute("profile", profile);
		
		//안읽은 알람 개수 출력
		model.addAttribute("alarmCount", service.getUnreadAlarmCount(nickname));
		//안읽은 메세지 개수 출력
		model.addAttribute("messageCount", service.getUnreadTotal(nickname));
		
		//나중에 활동내역 게시판에서 페이징 처리하고 검색할 거 까지 생각하고 메서드 세개로 나누기
		PagingCriteria cri = new PagingCriteria(1, 10);
		cri.setNickname(nickname);
		model.addAttribute("MyPostList", service.getMyPostList(cri));
		model.addAttribute("MyLikePostList", service.getMyLikePostList(cri));
		model.addAttribute("MyReplyList", service.getMyReplyList(cri));
		
		return "/mypage/mypage_main";
	}
	
	@GetMapping("/chekSchedule")
	@ResponseBody
	public List<PartyScheduleDTO> getSchedules(HttpSession session, String year, Integer month){
		List<PartyScheduleDTO> list = service.getSchedules((String)session.getAttribute("nickname"), year, String.valueOf(month+1));
		return list;
	}
	
//	활동내역 눌렀을 때 활동내역 전체 내용 보여주는 메서드
	@GetMapping("/activeList")
	public String getActiveList(HttpSession session, PagingCriteria cri, Model model, String whichActive){
		// wichActive -> myPost, myLike, myReply
		
		String nickname = (String)session.getAttribute("nickname");
		cri.setNickname(nickname);

		model.addAttribute("alarmCount", service.getUnreadAlarmCount(nickname));
		//안읽은 메세지 개수 출력
		model.addAttribute("messageCount", service.getUnreadTotal(nickname));
				
		if(whichActive == null) whichActive = "myPost";
		switch(whichActive) {
		case "myPost" :
			model.addAttribute("list", service.getMyPostList(cri));
			model.addAttribute("pageMaker", new PagingMaker(cri, service.getMyPostTotal(nickname)));
			model.addAttribute("whichActive", whichActive);
			break;
		case "myLike" :
			model.addAttribute("list", service.getMyLikePostList(cri));
			model.addAttribute("pageMaker", new PagingMaker(cri, service.getMyLikePostTotal(nickname)));
			model.addAttribute("whichActive", whichActive);
			break;
		case "myReply" :
			model.addAttribute("list", service.getMyReplyList(cri));
			model.addAttribute("pageMaker", new PagingMaker(cri, service.getMyReplyTotal(nickname)));
			model.addAttribute("whichActive", whichActive);
			break;
		}
		
		
		return "/mypage/mypage_active_page";
	}
	
//	참가중인 모임 리스트 보여주는 메서드
	@GetMapping("/attendingPartyList")
	public String getAttendingPartyList(HttpSession session, PagingCriteria cri, Model model) {
		String nickname = (String)session.getAttribute("nickname");
		cri.setNickname(nickname);
		model.addAttribute("list", service.getAttendingPartyList(cri));
		model.addAttribute("pageMaker", new PagingMaker(cri, service.getAttendingPartyTotal(nickname)));
		
		//안읽은 알람 개수 출력
		model.addAttribute("alarmCount", service.getUnreadAlarmCount(nickname));
		//안읽은 메세지 개수 출력
		model.addAttribute("messageCount", service.getUnreadTotal(nickname));
		
		return "/mypage/attending_party_list";
	}

//************************쪽지관련 컨트롤러 메서드*********************************************************************************
	
//	받은 쪽지함 보기	
	@GetMapping("/receiveMessageList")
	public String receivedMessageList(HttpSession session, PagingCriteria cri, Model model) {
		
		cri.setNickname((String)session.getAttribute("nickname"));
		cri.setAmount(5);
		model.addAttribute("messageList", service.getReceiveList(cri));
		model.addAttribute("pageMaker", new PagingMaker(cri, service.getReceiveTotal(cri)));
		
		return "/mypage/receive_message_list";
	}
	
//	보낸 쪽지함 보기
	@GetMapping("/sendMessageList")
	public String sendedMessageList(HttpSession session, PagingCriteria cri, Model model) {
		
		cri.setNickname((String)session.getAttribute("nickname"));
		cri.setAmount(5);
		model.addAttribute("messageList", service.getSendList(cri));
		model.addAttribute("pageMaker", new PagingMaker(cri, service.getSendTotal(cri)));
		
		return "/mypage/send_message_list";
	}
	
//	쪽지 답장 보내기 양식 요청
	@GetMapping("/replyMessage")
	public String replyMessageForm(HttpSession session, PagingCriteria cri, Model model, Integer message_num, RedirectAttributes attr) {

		cri.setNickname((String)session.getAttribute("nickname"));
		cri.setAmount(5);
		model.addAttribute("cri", cri);
		MessageDTO message = service.getMessage(message_num);
		if(message_num == null || message == null) {
			attr.addFlashAttribute("result", "noMessage");
			return "redirect:/mypage/receiveMessageList";
		}

		model.addAttribute("sendTo", message.getSender_nickname());
		model.addAttribute("message_num", message_num);
		
		return "/mypage/message_form";
	}
	
//	쪽지 답장 보내기
	@PostMapping("/replyMessage")
	@ResponseBody
	public String replyMessage(MessageDTO message, PagingCriteria cri, int old_message_num) {
		
		if(service.replyMessage(message, old_message_num)) {
			return "success";
		}else {
			return "fail";
		}
	}

//	받은 쪽지 읽기(상세페이지) : 상세내용 출력, 읽음표시 Y로 변경
	@GetMapping("/readReceiveMessage")
	public String readReceiveMessage(Integer message_num, PagingCriteria cri, Model model, RedirectAttributes attr) {
		MessageDTO message = service.getMessage(message_num);
		if(message_num == null || message == null) {
			attr.addFlashAttribute("result", "noMessage");
			return "redirect:/mypage/receiveMessageList";
		}
		cri.setAmount(5);
		model.addAttribute("message", service.readMessage(message_num));
		model.addAttribute("cri", cri);
		
		return "/mypage/read_receive_message";
	}
	
//	보낸 쪽지 읽기(상세페이지) : 상세내용 출력
	@GetMapping("/readSendMessage")
	public String readSendMessage(Integer message_num, PagingCriteria cri, Model model, RedirectAttributes attr) {
		MessageDTO message = service.getMessage(message_num);
		if(message_num == null || message == null) {
			attr.addFlashAttribute("result", "noMessage");
			return "redirect:/mypage/receiveMessageList";
		}
		cri.setAmount(5);
		model.addAttribute("message", service.getMessage(message_num));
		model.addAttribute("cri", cri);
		
		return "/mypage/read_send_message";
	}

//	쪽지 삭제
	@PostMapping("/deleteReceiveMessage")
	@ResponseBody
	public String deleteReceiveMessage(Integer message_num) {
		if(service.deleteReceiveMessage(message_num)) {
			return "success";
		}else {
			return "fail";
		}
	}
	
//	보낸쪽지함에서 보낸 쪽지 삭제
	@PostMapping("/deleteSendMessage")
	@ResponseBody
	public String deleteSendMessage(Integer message_num, PagingCriteria cri, HttpSession session) {
		
		if(service.deleteSendMessage(message_num)) {
			return "success";
		}else {
			return "fail";
		}
	}
	
//	프로필에서  그 사람한테 쪽지 보내기 폼 요청
	@GetMapping("/sendMessage")
	public String sendMessageForm(HttpSession session, String sendTo, Model model) {
		model.addAttribute("sendTo", sendTo);
		model.addAttribute("sendFrom", session.getAttribute("nickname"));
		return "/mypage/sendMessage_form";
	}
	
//	프로필에서 쪽지 보내기 처리
	@PostMapping("/sendMessage")
	@ResponseBody
	public String sendMessage(MessageDTO message) {
		if(service.sendMessage(message))
			return "success";
		else
			return "fail";
	}


//************************쪽지관련 컨트롤러 메서드 END *************************************************************************
	
	
	
	
//************************프로필 컨트롤러 메서드 *************************************************************************	
	
//	마이페이지에서 프로필 수정 폼 요청
	@GetMapping("/modifyProfile")
	public String modifyProfileForm(HttpSession session, Model model) {
		String nickname = (String)session.getAttribute("nickname");
		ProfileDTO profile = service.getProfile(nickname);
		if(profile.getKeyword() != null) {
			String[] keywords = profile.getKeyword().split(",");
			model.addAttribute("keywords", keywords);
		}
		model.addAttribute("alarmCount", service.getUnreadAlarmCount(nickname));
		//안읽은 메세지 개수 출력
		model.addAttribute("messageCount", service.getUnreadTotal(nickname));
		model.addAttribute("profile", profile);
		return "/mypage/mypage_modifyProfile";
	}
	
//	프로필 수정 요청
	@PostMapping("/modifyProfile")
	public String modifyProfile(@RequestParam("upload_img") MultipartFile file, ProfileDTO profile, String[] keywords, HttpSession session) {
		
		service.modifyProfile(file, profile, keywords, session);
		
		return "redirect:/mypage/";
	}

//	다른 곳에서 다른 사람 프로필 요청
	@GetMapping("/getProfile")
	public String getProfile(String nickname, Model model) {
		
		if(service.checkUnsigned(nickname)) {
			model.addAttribute("checkUnsigned", "checkUnsigned");
		}
		
		ProfileDTO profile = service.getProfile(nickname);
		if(profile.getKeyword() != null) {
			String[] keywords = profile.getKeyword().split(",");
			model.addAttribute("keywords", keywords);
		}
		model.addAttribute("profile", profile);
		model.addAttribute("profileMaker", new ProfileMaker(profile));
		
		return "mypage/profile";
	}

//************************프로필 컨트롤러 메서드 END *************************************************************************

//************************알람 컨트롤러 메서드 END *************************************************************************
	@GetMapping("/alarmList")
	public String getAlarmList(HttpSession session, PagingCriteria cri, Model model) {
		String nickname = (String)session.getAttribute("nickname");
		cri.setNickname(nickname);
		model.addAttribute("alarmList", service.getAlarmList(cri));
		model.addAttribute("alarmCount", service.getUnreadAlarmCount(nickname));
		//안읽은 메세지 개수 출력
		model.addAttribute("messageCount", service.getUnreadTotal(nickname));	
		model.addAttribute("pageMaker", new PagingMaker(cri, service.getAlarmTotal(nickname)));
		
		return "/mypage/mypage_alarm_page";
	}
	
	@PostMapping("/readAlarm")
	@ResponseBody
	public String readAlarm(Integer alarm_num) {
		service.readAlarm(alarm_num);
		return "read";
	}
	
	@PostMapping("/deleteAlarm")
	public String deleteAlarm(Integer alarm_num, PagingCriteria cri) {
		service.deleteAlarm(alarm_num);
		return "redirect:/mypage/alarmList?pageNum="+cri.getPageNum();
	}
//************************알람 컨트롤러 메서드 END *************************************************************************



}

















































































































