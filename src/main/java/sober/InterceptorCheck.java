package sober;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import sober.service.MypageService;

public class InterceptorCheck implements HandlerInterceptor{

	@Autowired
	private MypageService service;	
	
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      
      HttpSession session = request.getSession();
      String nickname = (String)session.getAttribute("nickname");
      
		/*
		 * if(nickname == null || nickname.equals("")) { // WEB-INF - views - member -
		 * loginform.jsp 로 보내버립니당. response.sendRedirect("member/loginform"); return
		 * false; }
		 */
      
      if(nickname != null) {
    	  request.setAttribute("alarmCount", service.getUnreadAlarmCount(nickname));
      }
      
      return true;
   }
   
   
   
   
}