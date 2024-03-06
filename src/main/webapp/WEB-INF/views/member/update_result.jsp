<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
 <c:if test="${result==1 }">
	<script>
		alert("회원 정보 수정이 완료되었습니다.");
		location="/mypage/";
	</script>
 </c:if> 
 
 <c:if test="${result == 2 }">
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>
 </c:if>
 
 <c:if test="${result==3 }">
	<script>
		alert("비밀번호 변경이 완료되었습니다.");
		location="/mypage/";
	</script>
 </c:if>    