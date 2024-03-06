<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="/resources/member/css/findpwd.css" />
<link rel="stylesheet" type="text/css" href="/resources/public/css/paging_page.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/member/js/findpasswd.js"></script>

</head>
<body>
<%@ include file="etc/miniheader.jsp"%>
	<c:if test="${empty pwdOk}">
	 <div class="main">
		<form method="post" action="find_passwd_ok" onsubmit="return check()">
			<div align="center">
					<input id="name" name="name" placeholder="이름" class="form-control input_name"/>
			</div><br>
	
			<div align="center">
					<input id="id" name="id" placeholder="ID" class="form-control input_name"/>
			</div><br>		
	
			<div align=center>
						<input id="phone" name="phone" placeholder="휴대폰 번호" class="form-control input"> 
						<input type="button" id="phoneChk" class="button" value="인증번호 전송"/><br><br>
						<input id="phone_certify" name="phone_certify" class="form-control input3"> 
						<input type="button" id="phoneChk2" class="button" value="인증하기"> <br>
						<span class="point successPhoneChk">휴대폰 번호는 '-' 없이 번호만 입력하세요.</span> 
						<input type="hidden" id="phoneDoubleChk" />
			</div>
			<br>
			<div align = center>
				<input type="button" value="닫기" onclick="self.close();" class="closeBtn">
				<input type="submit" value="찾기" class="submitBtn">
			</div>				
		</form>
	</div>
	</c:if>
	<c:if test="${!empty pwdOk}"> 
		<form method="post" action="newPasswd" onsubmit="return check2()">
			<div class="main2" align="center">
				<span><b style="font-size:20px;">비밀번호 수정</b></span><br><br>
				<input type="password" id="passwd" placeholder="새 비밀번호" name="passwd" class="form-control newpwd"/>
				<br><br>
				<input type="password" id="passwd2" placeholder="새 비밀번호 확인" name="passwd2" class="form-control newpwd"/>
			<br><br><br>
			<div align="center">
				<input type="button" value="닫기" onClick="self.close();" class="closeBtn" />
				<input type="submit" value="확인" class="submitBtn">
			</div>
			</div>
		</form>
	</c:if>
	
</body>
</html>