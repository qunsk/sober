<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>

<link rel="stylesheet" type="text/css" href="/resources/member/css/deleteform.css" />
<link rel="stylesheet" type="text/css" href="/resources/public/css/paging_page.css" />
<script src="/resources/member/js/deleteform.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body>
	<%@ include file="../public/header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2 container">
				<div align="right" class="minimi board_category">Home > 회원탈퇴</div>
			</div>
			<!-- 좌측 빈 여백  -->

			<div class="col-lg-8 container">

				<div id="delete_wrap" align=center>
					<form method="post" action=delete_ok onsubmit="return check()">

						<h2 class=title1>정말 <span class=title2>탈퇴</span> 하시겠습니까?</h2>
						<span class=title3>비밀번호를 입력하시면 회원탈퇴가 완료됩니다.</span>

						<table align=center id=table>
							<tr>
								<td>
								<input type="password" id="passwd" name="passwd" placeholder="비밀번호" class="passwd" style="width: 504px;"> </input>
								</td>
							</tr>
							<tr>
								<td>
									<textarea cols=55px rows=5 id="delcontent" name="delcontent" placeholder="탈퇴 이유를 작성해주세요."></textarea>
								</td>
							</tr>
						</table>

						<div align=center>
							<input type="submit" value="확인" class="input1" /><br>
							<input type="button" value="취소" class="input2" onclick="history.go(-1);"/><br>
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