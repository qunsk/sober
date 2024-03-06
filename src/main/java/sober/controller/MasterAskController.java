package sober.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sober.model.MasterAsk;
import sober.model.ReAsk;
import sober.service.MasterAskServiceImpl;
import sober.service.PagingMem;

@Controller
public class MasterAskController {
	@Autowired
	private MasterAskServiceImpl service;

	@RequestMapping("asklist")
	public String asklist(String pageNum, Model model, MasterAsk ask) {
		final int row = 10;
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * row + 1;
		int endRow = startRow + row - 1;

		int totalData = service.getTotal(ask);

		PagingMem p = new PagingMem(totalData, row, currentPage);
		int no = totalData - startRow + 1;
		ask.setStartRow(startRow);
		ask.setEndRow(endRow);

		List<MasterAsk> list = service.list(ask);

		model.addAttribute("list", list);
		model.addAttribute("p", p);
		model.addAttribute("no", no);
		model.addAttribute("pageNum", pageNum);

		return "master/asklist";
	}

	@RequestMapping("askdetail")
	public String askdetail(Model model, int ask_no, String pageNum, HttpSession session) {
		service.see(ask_no);
		MasterAsk ask = service.select(ask_no);
		ReAsk re = service.reselect(ask_no);
		// 프로필 사진 처리
		String profile = service.getMemberProfile((String) session.getAttribute("nickname"));
		model.addAttribute("userProfile", profile);

		model.addAttribute("ask", ask);
		model.addAttribute("re", re);
		model.addAttribute("pageNum", pageNum);
		return "master/askdetail";
	}

	@RequestMapping("reInsert")
	public String reInsert(@RequestParam("ask_re_content") String ask_re_content, @RequestParam("ask_no") int ask_no,
			@RequestParam("nickname") String nickname, ReAsk reask, MasterAsk ask) {
		service.insert(reask);
		service.check(ask_no);

		service.alert(ask);

		return "master/askdetail";
	}
}
