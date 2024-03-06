package sober.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sober.model.Notice;
import sober.service.Noticeservice;
import sober.service.PagingMem;

@Controller
public class NoticeController {
	@Autowired
	private Noticeservice service;

	@RequestMapping("noticewrite")
	public String noticewrite() {
		return "/master/noticewrite";
	}

	@RequestMapping("noticewrite_check")
	public String noticewrite_check(Notice notice, 
			@RequestParam Map<String, Object> map) {
		//값 확인: dto에 바로 입력
		service.insert(notice);
		return "/master/noticewrite_check";
	}

	@RequestMapping("noticelist")
	public String noticelist(Model model, String pageNum, Notice notice,
			String result, String notice_type, String search, String keyword) {
		final int row = 10;
		if(pageNum == null || pageNum.equals("")) 
			pageNum = "1";
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*row +1;
		int endRow = startRow + row -1;
		
		int totalData = service.getNotice(notice);
		
		int no = totalData - startRow +1;
		PagingMem p = new PagingMem(totalData, row, currentPage);
		notice.setStartRow(startRow);
		notice.setEndRow(endRow);
		
		List<Notice> noticelist = service.noticelist(notice);
		
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("p",p);
		model.addAttribute("no",no);
		model.addAttribute("search",search);
		model.addAttribute("keyword",keyword);
		model.addAttribute("notice_type",notice_type);
		model.addAttribute("result",result);
		
		return "master/noticelist";
	}
	
//	@RequestMapping("noticedetail")
//	public String noticedetail(Model model, String pageNum, int notice_no, String search, String keyword) {
//		service.read(notice_no);
//		Notice notice = service.select(notice_no);
//		
//		model.addAttribute("search", search);
//		model.addAttribute("keyword", keyword);
//		model.addAttribute("notice", notice);
//		model.addAttribute("pageNum", pageNum);
//		return "master/noticedetail";
//	}
	
	@RequestMapping("noticedetail")
	public String noticedetail(Model model, String pageNum, int notice_no, String search, String keyword, Notice bnotice) {
		model.addAttribute("bnotice_type",bnotice.getNotice_type());
		System.out.println("이전거:"+bnotice.getNotice_type());
		service.read(notice_no);
		Notice notice = service.select(notice_no);
		
		model.addAttribute("search", search);
		model.addAttribute("keyword", keyword);
		model.addAttribute("notice", notice);
		model.addAttribute("pageNum", pageNum);
		return "master/noticedetail";
	}
	
	@RequestMapping("noticeupdate")
	public String noticeupdate(String pageNum, int notice_no, Model model) {
		System.out.println(":");
		Notice notice = service.select(notice_no);
		
		model.addAttribute("notice", notice);
		model.addAttribute("pageNum", pageNum);
		
		return "master/noticeupdate";
	}
	
	@RequestMapping("noticeupdate_check")
	public String noticeupdate_check(String pageNum, Notice notice, Model model) {
		service.update(notice);
		return "redirect:noticelist?pageNum="+pageNum;
	}
	
	
	@RequestMapping("noticedelete")
	public String noticedelete(int notice_no) {
		
		int result = service.delete(notice_no);
		
		return "redirect:noticelist?result="+String.valueOf(result);
	}
	
}
