package sober.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sober.model.VisitCountVO;
import sober.service.VisitServiceImpl;

@Controller
public class VisitController {

	@Autowired
	private VisitServiceImpl service;

	@RequestMapping("visitcount")
	public String sessionCreated(HttpServletRequest req, VisitCountVO vo) {

		vo.setVisit_ip(req.getRemoteAddr());
		vo.setVisit_info(req.getHeader("User-Agent"));// 브라우저 정보
		vo.setVisit_ref(req.getHeader("referer"));// 접속 전 사이트 정보
		service.insert(vo);

		return "redirect:/visitlist";
	}

	@RequestMapping("visitlist")
	public String visitresult(Model model, VisitCountVO vo) {
		// 그래프 구현
		List<Map<String, String>> month = service.mcount();
		// List<Map<String, String>> 변수인 month를 JSONArray로 변환합니다.
		JSONArray jsonArray = new JSONArray();
		for (Map<String, String> map : month) {
			JSONObject jsonObject = new JSONObject(map);
			jsonArray.add(jsonObject);
		}
		// 변환된 JSONArray를 사용합니다.
//		System.out.println(jsonArray.toString());
//		System.out.println("month:" + month);

		List<VisitCountVO> iplist = service.iplist();
		
		int host = service.host();
		int naver = service.naver();
		int google = service.google();

		model.addAttribute("month", jsonArray.toString());
		model.addAttribute("iplist", iplist);
		model.addAttribute("naver", naver);
		model.addAttribute("google", google);
		model.addAttribute("host", host);

		return "/master/visitlist";
	}

}
