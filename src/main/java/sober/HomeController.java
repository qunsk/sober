package sober;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.Setter;
import sober.model.PagingCriteria;
import sober.model.PagingMaker;
import sober.model.VisitCountVO;
import sober.service.HomeService;
import sober.service.VisitServiceImpl;

@Controller
public class HomeController {

	@Setter(onMethod_ = @Autowired)
	private HomeService service;
	
	@Setter(onMethod_ = @Autowired)
	private VisitServiceImpl visitService;
	
    // 여기는 main 페이지로 이동하는 컨트롤러 입니다. ( 테스트 용 ) 
	@RequestMapping("/")
	public String main(Model model, HttpServletRequest req, VisitCountVO vo) {
		
		vo.setVisit_ip(req.getRemoteAddr());
		vo.setVisit_info(req.getHeader("User-Agent"));// 브라우저 정보
		if(req.getHeader("referer") != null)
			vo.setVisit_ref(req.getHeader("referer"));// 접속 전 사이트 정보
		visitService.insert(vo);
		
		model.addAttribute("cocktailList", service.getPopularCocktail());
		model.addAttribute("partyList", service.getPopularParty());
		model.addAttribute("foodList", service.getPopularFood());
		model.addAttribute("noticeList", service.getRecentNotice());
		
		return "public/main_page";
	}
	
	@GetMapping("search")
	public String searchList(Model model, PagingCriteria cri) {
		
		model.addAttribute("list", service.entireSearch(cri));
		model.addAttribute("pageMaker", new PagingMaker(cri, service.entireSearchTotal(cri)));
		
		return "public/search";
	}
	
	@RequestMapping(value = "/favicon.ico", method = RequestMethod.GET)
	public void favicon( HttpServletRequest request, HttpServletResponse reponse ) {
		try {
		  reponse.sendRedirect("/resources/favicon.ico");
		} catch (IOException e) {
		  e.printStackTrace();
		}
	}
	
}
