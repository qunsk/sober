package sober.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import sober.model.AskDTO;
import sober.service.AskService;
import sober.service.MypageService;

@Controller
@RequestMapping("/mypage/*")
public class AskController {
	
	@Setter(onMethod_ = @Autowired)
	private AskService service;
	
	@Setter(onMethod_ = @Autowired)
	private MypageService mypageService;
	
	//pageNum : 사용자가 현재 보고싶어하는 페이지
	@GetMapping("/askList")							
	public String getList(Model model, Integer pageNum, HttpSession session) {
		if(pageNum == null) {
			pageNum = 1;
		}
		
		String nickname = (String)session.getAttribute("nickname");
		
		List<AskDTO> list = service.getList(pageNum, nickname);
		int total = service.getTotal(nickname);
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("pageNum", pageNum);
		//안읽은 알람 개수 출력
		model.addAttribute("alarmCount", mypageService.getUnreadAlarmCount(nickname));
		//안읽은 메세지 개수 출력
		model.addAttribute("messageCount", mypageService.getUnreadTotal(nickname));
		
		return "ask/list";
	}

	//pageNum : 사용자가 현재 보고싶어하는 페이지
	@GetMapping("/askList2")							
	public String getList2(Model model, Integer pageNum, String orderBy, HttpSession session) {
		if(pageNum == null) {
			pageNum = 1;
		}
		
		String nickname = (String)session.getAttribute("nickname");
		
		List<AskDTO> list = service.getListOrder(pageNum, nickname);
		int total = service.getTotal(nickname);
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("sort", orderBy);
		
		//안읽은 알람 개수 출력
		model.addAttribute("alarmCount", mypageService.getUnreadAlarmCount(nickname));
		//안읽은 메세지 개수 출력
		model.addAttribute("messageCount", mypageService.getUnreadTotal(nickname));
		
		return "ask/list";
	}
	
	@GetMapping("/askGet")
	public String getDetail(Integer ask_no, String pageNum, Model model, HttpSession session) {
		
		String nickname = (String)session.getAttribute("nickname");
		
		AskDTO dto = service.get(ask_no);
		model.addAttribute("ask", dto);
		model.addAttribute("pageNum", pageNum);
		
		//안읽은 알람 개수 출력
		model.addAttribute("alarmCount", mypageService.getUnreadAlarmCount(nickname));
		//안읽은 메세지 개수 출력
		model.addAttribute("messageCount", mypageService.getUnreadTotal(nickname));
		
		return "ask/get";
	}
	
	@PostMapping("/askRegister")
	public String register(AskDTO dto, HttpSession session) {
		String nickname = (String)session.getAttribute("nickname");
		dto.setNickname(nickname);
		service.post(dto);
		
		return "redirect:askList";
	}

	// 사용자가 입력 폼을 달라고하는 요청을 처리하는 메서드
	@GetMapping("/askRegister")
	public String register(HttpSession session, Model model) {
		
		String nickname = (String)session.getAttribute("nickname");
		
		//안읽은 알람 개수 출력
		model.addAttribute("alarmCount", mypageService.getUnreadAlarmCount(nickname));
		//안읽은 메세지 개수 출력
		model.addAttribute("messageCount", mypageService.getUnreadTotal(nickname));
		return "ask/register";
	}
	
	
	@PostMapping("/askDelete")
	public String delete(Integer ask_no) {
		service.delete(ask_no);
		return "redirect:askList";
	}
	
	@GetMapping("/askModify")
	public String modify(Integer ask_no, Model model, HttpSession session) {
		
		String nickname = (String)session.getAttribute("nickname");
		
		AskDTO dto = service.get(ask_no);
		model.addAttribute("modify", dto);
		
		//안읽은 알람 개수 출력
		model.addAttribute("alarmCount", mypageService.getUnreadAlarmCount(nickname));
		//안읽은 메세지 개수 출력
		model.addAttribute("messageCount", mypageService.getUnreadTotal(nickname));
		
		return "ask/modify";
	}
	
	@PostMapping("/askModify")
	public String modify(AskDTO dto) {
		service.modify(dto);
		return "redirect:askList";
	}
	
	@PostMapping(value="/get_ask_reply",produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String get_ask_reply(Integer ask_no) {
		String msg = null;
		
		msg = service.getReply(ask_no);
		if(msg==null || msg.equals("")) {
			msg="답변 대기중입니다.";
		}
		
		return msg;
	}
		
}
