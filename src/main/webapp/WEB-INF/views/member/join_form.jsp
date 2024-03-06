<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="/resources/member/css/join.css" />
<link rel="stylesheet" type="text/css" href="/resources/public/css/paging_page.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/member/js/joinform.js?ver=5"></script>
</head>
<body>
	<%@ include file="../public/header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2 container">
				<div align="right" class="minimi board_category">Home > 회원가입</div>
			</div>
			<!-- 좌측 빈 여백  -->

			<div class="col-lg-8 container">

				<div class="main">
					<h2 align="center">회원가입</h2>
					<form method="post" action="join_ok"
						onsubmit="return check()">
						<br>
						<br> <b>회원정보입력</b>
						<hr>
						<div class="join_form">
							<label for="id" class="category">* ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
							<input id="id" name="id" class="form-control input" maxlength=10 oninput="checkID()">
							<input type="button" value="중복확인" class="button" onclick="id_check()"> <span id="idcheck"></span>
						</div>
						
						<div class="join_form">
							<label for=passwd class="category">* 비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>  
							<input type=password id="passwd" name="passwd" class="form-control input">
							<span id="alert_ruleS" style="color: green;">사용 가능한 비밀번호 입니다.</span> 
							<span id="alert_ruleF" style="color: red;">영문자, 숫자, 특수문자(~!@#$%\^&*()+=) 포함 8~16자로 설정</span> 
						</div>
						
						<div class="join_form">
							<label for="passwd2" class="category">* 비밀번호 확인 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
							<input type=password id="passwd2" name="passwd2" class="form-control input"> 
							<span id="alert_success" style="color: green;">비밀번호가 일치합니다.</span>
							<span id="alert_fail" style="color: red;">비밀번호가 일치하지 않습니다.</span>
						</div>
						
						<div class="join_form">
							<label for="nickname" class="category">* 닉네임 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
							<input id="nickname" name="nickname" class="form-control input"> 
							<input type="button" value="중복확인" class="button" onclick="nick_check()"> 
							<span id="nickcheck"></span>
						</div>
						
						<div class="join_form">
							<label for="name" class="category">* 이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
							<input id="name" name="name" class="form-control input">
						</div>
						
						<div class="join_form">
							<label for="jumin" class="category">* 주민번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
							<input id="jumin1" name="jumin1" maxlength=6 class="form-control input2"> - 
							<input id="jumin2" name="jumin2" maxlength=1 size=1 class="form-control input4"> ●●●●●●
						</div>
						
						<div class="join_form">
							<label for="phone" class="category">* 휴대폰 번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
							<input id="phone" name="phone" class="form-control input"> 
							<input type="button" id="phoneChk" class="button" value="인증번호 전송"/><br><br>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
							<input id="phone_certify" name="phone_certify" class="form-control input3"> 
							<input type="button" id="phoneChk2" class="button" value="인증하기"> 
							<span class="point successPhoneChk">휴대폰 번호는 '-' 없이 번호만 입력하세요.</span> 
							<input type="hidden" id="phoneDoubleChk" />
						</div>
						
						<div class="join_form">
							<label for="mail" class="category">* 이메일 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
							<input id="mailid" name="mailid" maxlength=12 class="form-control input2"/> @ 
							<input id="domain" name="domain" maxlength=12 class="form-control input2"/> 
								<select id="mail_list" name="mail_list" class="form-control mail">
								<option value="1">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="daum.net">daum.net</option>
								<option value="nate.com">nate.com</option>
								<option value="hotmail.com">hotmail.com</option>
							</select>
						</div>
						
						<div class="join_form">
							<span class="category">* 지역 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<label for="region" class="category"></label>&nbsp; 
							<select id="region_sel" name="region" class="form-control region">
								<option value="">시·도 선택</option>
								<c:forEach var="re" items="${region}">
									<option value="${re}">${re}</option>
								</c:forEach>
							</select>&nbsp;&nbsp; <span id="rerere"></span>
						</div>
						
						<div class="join_form">
							<span class="category">* 성별 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> 
								<label for="female">여&nbsp;</label> <input type=radio value="female" id="female" name="gender" class="partyradio" onclick="return false;">&nbsp;&nbsp;&nbsp;&nbsp;
								<label for="male">남&nbsp;</label> <input type=radio value="male" id="male" name="gender" class="partyradio" onclick="return false;">&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<br><br><br>
						<div align="center">
							<span> <input type="reset" id="join_submit" value="취소" class="resetBtn"/>
							<span> <input type="submit" id="join_submit" value="회원가입" class="submitBtn" />
							</span>
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-2 container"></div>
			<!-- 우측 빈 여백 -->
		</div>
	</div>

	<%@ include file="../public/footer.jsp"%>
</body>
</html>