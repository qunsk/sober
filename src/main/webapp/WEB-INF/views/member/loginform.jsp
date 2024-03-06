<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link rel="stylesheet" type="text/css" href="/resources/member/css/loginform.css" />
<link rel="stylesheet" type="text/css" href="/resources/public/css/paging_page.css" />
<script src="<%=request.getContextPath()%>/resources/member/js/loginform.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body>
	<%@ include file="../public/header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2 container">
				<div align="right" class="minimi board_category">Home > 로그인</div>
			</div>
			<!-- 좌측 빈 여백  -->

			<div class="col-lg-8 container">
			
			<div id="login_wrap">
				<form method="post" action=login_ok onsubmit="return check()">
					<h2 class="login_title" align=center>Sober</h2>

					<table align=center id=table>
						<tr>
							<td><input type="text" id="id" name="id" placeholder="🔒아이디"
								class="input"> </input></td>
						</tr>
						<tr>
							<td><input type="password" id="passwd" name="passwd"
								placeholder="🔒비밀번호" class="input"> </input></td>
						</tr>
					</table>

					<div align=center>
						<input type="submit" value="로그인" class="input2" /><br>
					</div>

					<div align=center id="login_etc" class="alink">
						<a
							href="javascript:window.open('find_id','id찾기','width=500 height=450 left=500 top=200')">아이디
							찾기</a> | <a
							href="javascript:window.open('find_passwd','비밀번호 찾기','width=500 height=500 left=500 top=200')">비밀번호
							찾기</a> | <a href="join_contract" style="color: gray;">회원가입</a>
					</div>

				</form>
			</div>
			</div>
			<div class="col-lg-2 container"></div>
			<!-- 우측 빈 여백 -->
			</div>
		</div>
	</div>

	<%@ include file="../public/footer.jsp" %>
</body>
</html>