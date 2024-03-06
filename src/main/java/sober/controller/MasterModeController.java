package sober.controller;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import sober.model.MasterAsk;
import sober.model.memberModel;
import sober.service.MasterModeServiceImpl;
import sober.service.PagingMem;

@Controller
public class MasterModeController {
	@Autowired
	private MasterModeServiceImpl service;
	
	@RequestMapping("dashboard")
	public String graph(Model model, MasterAsk ask) {
		//3개월 그래프
		List<Map<String, Integer>> graphlist = service.graphlist();
		JSONArray array = new JSONArray();
		for(Map<String, Integer> map : graphlist) {
			JSONObject obj = new JSONObject(map);
			array.add(obj);
		}
		//오늘 할일
		//읽지 않은 문의
		int unread = service.unread();
		//공지글 업데이트 일 수
		int noticeupdate = service.noticeupdate();;
		//최근 등록된 글 수
		int recent = service.recent();
		
		//문의 글 가져오기
		List<MasterAsk> asklist = service.asklist();
		
		//게시판 글 수
		int recipe = service.recipe();
		//게시판 글 수
		int party = service.party();
		//게시판 글 수
		int food = service.food();
		
		model.addAttribute("graphlist", array.toString());
		model.addAttribute("unread",unread);
		model.addAttribute("noticeupdate",noticeupdate);
		model.addAttribute("recent",recent);
		model.addAttribute("asklist", asklist);
		model.addAttribute("recipe",recipe);
		model.addAttribute("party",party);
		model.addAttribute("food",food);
		return "/master/dashboard";
	}

	@RequestMapping("management")
	public String management(String pageNum, Model model, memberModel member) {
		final int row = 10;
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * row + 1;
		int endRow = startRow + row - 1;

		int totalData = service.getTotal(member);

		PagingMem p = new PagingMem(totalData, row, currentPage);
		member.setStartRow(startRow);
		member.setEndRow(endRow);
		
		List<memberModel> memberlist = service.memberlist(member);
		
		model.addAttribute("memberlist", memberlist);
		model.addAttribute("p", p);
		model.addAttribute("state",member.getState());
		model.addAttribute("search", member.getSearch());
		model.addAttribute("keyword", member.getKeyword());

		return "/master/management";
	}
	
	@RequestMapping("deleteaccount")
	public String managmentdelete(@RequestBody Map<String, Object> param) {
		String id = (String)param.get("id");
		service.update(id);
		
		return "/master/management";
	}

}
