<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   /* String[] title={"데낄라","럼","리큐르","보드카","브랜디","와인","위스키","진","기타","과일","유제품","음료"};
   request.setAttribute("title",title); */
   
   String[] flavor={"달콤한","달지않은","상큼한","톡쏘는","트로피칼","개성있는"};
   request.setAttribute("flavor",flavor);
   
   String[] abv_result={"무알콜","5도 이하","5~10도","10~20도","20~30도","30도 이상"};
   request.setAttribute("abv_result",abv_result);
   
%>