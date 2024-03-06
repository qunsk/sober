<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" type="text/css" href="/resources/member/css/join.css" />
<link rel="stylesheet" type="text/css" href="/resources/public/css/paging_page.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/member/js/updateform.js"></script>
<script>
	function cancel(){
		location.href='/mypage/';
	}
</script>
</head>
<body>
	<%@ include file="../public/header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2 container">
				<div align="right" class="minimi board_category">Home > 회원정보 수정</div>
			</div>
			<!-- 좌측 빈 여백  -->

			<div class="col-lg-8 container">

				<div class="main">
					<h2 align="center">회원정보 수정</h2>
					<form method="post" action="update_ok"	onsubmit="return check()">
					<input type="hidden" name=id value="${member.id }">
						<br>
						<br> <b>회원정보수정</b>
						<hr>
						<div class="join_form">
							<label for="id" class="category">* ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
							<span>${member.id}</span>
						</div>
						
						<div class="join_form">
							<label for=passwd class="category">* 비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>  
							<input type=password id="passwd" name="passwd" class="form-control input">
						</div>
						
						<div class="join_form">
							<label for="nickname" class="category">* 닉네임 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
							<span>${nickname }</span>
						</div>
						
						<div class="join_form">
							<label for="name" class="category">* 이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
							<input id="name" name="name" class="form-control input" value=${member.name }>
						</div>
						
						<div class="join_form">
							<label for="jumin" class="category">* 주민번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
							<span>${member.jumin1 }</span> - 
							<span>${member.jumin2 }</span> 
						</div>
						
						<div class="join_form">
							<label for="phone" class="category">* 휴대폰 번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
							<input id="phone" name="phone" class="form-control input" value=${member.phone }> 
						</div>
						
						<div class="join_form">
							<label for="mail" class="category">* 이메일 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
							<input id="mailid" name="mailid" maxlength=12 class="form-control input2" value=${member.mailid }> @ 
							<input id="domain" name="domain" maxlength=12 class="form-control input2" value=${member.domain }> 
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
									<option value="${re}" 
									<c:if test="${member.region == re}">${'selected'} </c:if>> ${re}</option>
								</c:forEach>
							</select>&nbsp;&nbsp; 
							
							<label for="sub_region" class="category"></label>&nbsp;
							<select id="sub_region_sel" name="sub_region" class="form-control sub_region">
  								<option value="">시·구·군 선택</option>
   								<c:forEach var="i" items="${arr}">
									<option value="${i}" <c:if test="${member.sub_region == i}">${'selected'} </c:if>>${i}</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="join_form">
							<span class="category">* 성별 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> 
								<label for="female">여&nbsp;</label> 
								<input type=radio value="female" id="female" name="gender" class="partyradio" <c:if test="${member.gender == 'female'}">${'checked' }</c:if>> &nbsp;&nbsp;&nbsp;&nbsp;
								<label for="male">남&nbsp;</label> 
								<input type=radio value="male" id="male" name="gender" class="partyradio" <c:if test="${member.gender == 'male'}">${'checked' }</c:if>> &nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<br><br><br>
						<div align="center">
							<span> <input type="button" id="join_submit" value="취소" class="resetBtn" onClick="cancel()"/></span>
							<span> <input type="submit" id="join_submit" value="수정" class="submitBtn" /></span>
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-2 container"></div>
			<!-- 우측 빈 여백 -->
		</div>
	</div>
	</div>
	<%@ include file="../public/footer.jsp"%>
</body>
</html>