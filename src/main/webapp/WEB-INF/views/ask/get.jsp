<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- 헤더 -->


<head>
<meta charset="UTF-8">
<title>SOBER :: ASK</title>

<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<style>
h1 {
   text-align: center;
}

th, td {
   border: 1px solid black;
   padding: 10px;
   text-align: center;
}

table {
   width: 825px;
   margin-top: 20px;
   border-collapse: collapse;
}

th {
   background-color: #f5f5f5;
}

.master_reply_box {
   margin-top: 40px;
}

.member_profile {
   width: 40px;
   height: 40px;
   border-radius: 50%;
}

hr {
   width: 600px;
   height: 10px;
   border: 0;
   box-shadow: 0 10px 10px -10px #bbb inset;
}

/* Additional styling for buttons */
.button-container {
   margin-top: 20px;
}

.button-container button {
   background-color: #337ab7;
   color: #fff;
   border: none;
   padding: 10px 20px;
   cursor: pointer;
   font-size: 14px;
   margin-right: 10px;
}

.button-container button:hover {
   background-color: #23527c;
}

/* Styling for textareas */
textarea.form-control {
   padding: 10px;
}
</style>



<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(function() {

		var ask_no = ${ask.ask_no};
		$.post("get_ask_reply", {
			'ask_no' : ask_no
		}).done(function(msg) {
			$("#reply_box").text(msg);
		}).fail(function() {
			console.log("ajax실패");
		});

	});
</script>
</head>
<body>


	<!-- 헤더 -->
	<%@ include file="../public/header.jsp"%>


	<!-- 메인 -->
	<div class="container-fluid mypage-main">
		<!-- 메인 첫번째 줄 -->
		<div class="row">
			<!-- 왼쪽여백 -->
			<div class="col-lg-1"></div>
			<!-- /왼쪽여백 -->
			<!-- 마이페이지 내비게이션 -->
			<%@ include file="../mypage/include/mypage_sidebar.jsp"%>
			<!-- /마이페이지 내비게이션 -->
			<!-- 메인컨텐츠 박스 -->
			<div class="col-lg-7 container-fluid">
				<br> <br>
				<h1 style="width : 825px;">1:1 문의 글쓰기</h1>
				<br> <br>

				<table>
					<tr>
						<th>번호</th>
						<td>${ask.ask_no}</td>
						<!-- ask.getNo(); -->
						<th>제목</th>
						<td>1:1 문의합니다.</td>
						<th>날짜</th>
						<td>${ask.ask_date}</td>
					</tr>
				</table>

				<div class="mb-3">
					<label for="content"></label>
					<textarea class="form-control" rows="14" name="content"
						id="content" style="resize: none; width: 825px;" readonly>${ask.ask_content}</textarea>
				</div>

				<div>
					<c:if test="${ask.ask_confirm.equals('N')}">
						<input type="button" value="수정" onClick="location='askModify?ask_no=${ask.ask_no}&pageNum=${pageNum}'" />
					</c:if>
					<form action="askDelete" method="post" style="display: inline;">
						<input type="hidden" name="ask_no" value="${ask.ask_no}" />
						<input type="submit" value="삭제">
					</form>
					<input type="button"
						onClick="location.href='askList?pageNum=${pageNum}'" value="목록"/>
				</div>
				<br>
				<br>
				<hr style="width:825px;">

				<div class="master_reply_box">
					<img class="member_profile" src="/resources/upload/mypage/defaultProfileIMG.png">
					<span> &nbsp;&nbsp;관리자</span> <br> <br>
					<textarea class="form-control" rows="6" name="content"
						id="reply_box" style="resize: none; width: 825px;"
						readonly="readonly"></textarea>
				</div>

			</div>
			<!--  end col-lg-7 -->
			<div class="col-lg-1"></div>
		</div>
		<!--  end row -->
	</div>

</body>
<br>
<br>
<br>
<br>
<br>

</html>


<%@ include file="../public/footer.jsp"%>