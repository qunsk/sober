<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 정보 관리</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <!--  구글 폰트 ROBOTO MONO-->
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@1,600&display=swap" rel="stylesheet">
    <!--  default 페이지 css -->
    <link rel="stylesheet" href="/resources/public/css/paging_page.css">
    <link rel="stylesheet" href="/resources/master/css/titletext.css">
</head>

<body>
<%@ include file="masterheader.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2 container"></div>
			<!-- 좌측 빈 여백  -->

			<div class="col-lg-8 container">
				<div class="title_box medium" id="title-set">회사 정보 관리</div>
<br><br>
				<div class="write_box" align="right"></div>
				<form action="companyupdate" name="frm">
					<input type="hidden" name="com_name" value="${company.com_name}">
					<table class="table whitespace_box">
						<tr>
							<td>회사명</td>
							<td>${company.com_name}</td>
						</tr>
						<tr>
							<td>대표 이메일</td>
							<td><input type="text" name="com_email" required="required"
								value="${company.com_email}"></td>
						</tr>
						<tr>
							<td>대표 번호</td>
							<td><input type="text" name="com_phone" required="required"
								value="${company.com_phone}"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" name="com_address"
								required="required" value="${company.com_address}"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit" class="btn btn-info" value="확인"></td>
						</tr>
					</table>
				</form>
			</div>
			<!-- 가운데 컨텐트 들어갈 곳 -->

			<div class="col-lg-2 container"></div>
			<!-- 우측 빈 여백 -->

		</div>
	</div>
	<!--  end main -->

</body>
</html>