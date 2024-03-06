<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="/resources/member/css/join.css" />
<link rel="stylesheet" type="text/css" href="/resources/public/css/paging_page.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- <script src="/resources/member/js/joinform.js"></script> -->
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
				<div class="join_form">
					<label for=passwd class="category">* 현재 비밀번호
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<input type=password id="passwd" name="passwd"
						class="form-control input">
				</div>

				<div class="join_form">
					<label for=passwd class="category">* 새 비밀번호
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<input type=password id="newpasswd" name="newpasswd"
						class="form-control input"> <span id="alert_ruleS"
						style="color: green;">사용 가능한 비밀번호 입니다.</span> <span
						id="alert_ruleF" style="color: red;">영문자, 숫자, 특수문자 포함
						8~16자로 설정하세요.</span>
				</div>

				<div class="join_form">
					<label for="passwd2" class="category">* 새 비밀번호 확인
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <input
						type=password id="newpasswd2" name="newpasswd2"
						class="form-control input"> <span id="alert_success"
						style="color: green;">비밀번호가 일치합니다.</span> <span id="alert_fail"
						style="color: red;">비밀번호가 일치하지 않습니다.</span>
				</div>

				<div class="col-lg-2 container"></div>
				<!-- 우측 빈 여백 -->
			</div>
		</div>
	</div>
	<%@ include file="../public/footer.jsp"%>
</body>
</html>