<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입완료</title>
<link rel="stylesheet" type="text/css"
	href="/resources/member/css/joinSuccess.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/public/css/paging_page.css" />
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

				<div class="main" align=center>
					<img src="/resources/member/image/cocktail2.png" width=300 height=300></img> 
						<span class="font1">회원가입이 정상적으로 처리되었습니다.</span>
					<br><br><br>
					<input type="submit" id="join_submit" value="메인화면" class="mainBtn" onClick="location='/'"/>
					<input type="submit" id="join_submit" value="로그인" class="loginBtn" onClick="location='loginform'" />
				</div>

			</div>

				<div class="col-lg-2 container"></div>
				<!-- 우측 빈 여백 -->
		</div>
	</div>
	<!--  end main -->

	<%@ include file="../public/footer.jsp"%>

</body>
</html>
