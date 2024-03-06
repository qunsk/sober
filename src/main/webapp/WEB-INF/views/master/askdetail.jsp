<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<!-- 헤더 -->
<head>
<meta charset="UTF-8">
<title>SOBER</title>
<!--  구글 폰트 ROBOTO MONO-->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@1,600&display=swap"
	rel="stylesheet">
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
	width: 825px; /* 테이블의 가로 길이를 줄임 */
	margin-top: 20px;
}

th, td {
	border: 1px solid black;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #f5f5f5;
}

th:nth-child(1), td:nth-child(1) {
	width: 10%;
	text-align: center;
}

th:nth-child(3), td:nth-child(3) {
	width: 20%; /* 번호와 제목, 날짜의 가로 길이를 동일하게 설정 */
	text-align: center;
}

.large-textarea {
	width: 400px; /* 입력 폼 가로 길이를 늘림 */
	height: 300px;
	resize: none;
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
	width: 600px; /* 가로 길이를 줄임 */
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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<!--  default 페이지 css -->
<link rel="stylesheet" href="/resources/public/css/paging_page.css">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$("#commentinsert").click(function() {

			console.log('${ask.ask_no}');
			console.log('${ask.nickname}');
			var ask_re_content = $("#reply_box").val();
			var ask_no = '${ask.ask_no}';
			var nickname = '${ask.nickname}';
			var comment = {
				"ask_re_content" : ask_re_content,
				"ask_no" : ask_no,
				"nickname" : nickname
			};

			$.ajax({
				type : "post",
				url : "reInsert",
				data : comment,

				success : function(data) {
					alert("답변이 등록되었습니다.");
					location.reload();
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR)
					alert("오류가 발생하였습니다.")
				}
			});
		});
	});
</script>
</head>
<body>
	<%@ include file="masterheader.jsp"%>
	<!-- 메인 -->
	<div class="container-fluid mypage-main">
		<!-- 메인 첫번째 줄 -->
		<div class="row">
			<!-- 왼쪽여백 -->
			<div class="col-lg-1"></div>
			<!-- /왼쪽여백 -->
			<!-- 메인컨텐츠 박스 -->
			<div class="col-lg-7 container-fluid">
				<br> <br>
				<h4>1:1 문의 글쓰기</h4>
				<br> <br>

				<div class="master_reply_box" onclick="location.href='management'">
					<img class="member_profile" src="/resources/upload/mypage/${ask.profile_img }">
					<span> &nbsp;&nbsp;${ask.nickname }</span>
				</div>
				<table>
					<tr>
						<th>번호</th>
						<td>${ask.ask_no}</td>
						<th>제목</th>
						<td>1:1 문의합니다.</td>
						<th>날짜</th>
						<td><fmt:formatDate value="${ask.ask_date}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
				</table>

				<div class="mb-3">
					<label for="content"></label>
					<textarea class="form-control" rows="14" name="content"
						id="content" style="resize: none; width: 825px;"
						readonly="readonly">${ask.ask_content}</textarea>
				</div>
				<br> <br> <br>
				<hr>


				<c:if test="${empty re.ask_re_content }">
					<div class="master_reply_box">
						<img class="member_profile" src="/resources/upload/mypage/${userProfile }">
						<span> &nbsp;&nbsp;관리자</span> <br> <br>
						<textarea class="form-control" rows="6" name="content"
							id="reply_box" style="resize: none; width: 825px;"></textarea>
						<br>
						<button id="commentinsert">등록</button>
					</div>
				</c:if>
				<c:if test="${not empty re.ask_re_content }">
					<div class="master_reply_box">
						<img class="member_profile" src="/resources/upload/mypage/${userProfile }">
						<span> &nbsp;&nbsp;관리자</span> <br> <br>
						<textarea class="form-control" rows="6" name="content"
							id="reply_box" style="resize: none; width: 825px;"
							readonly="readonly">${re.ask_re_content}</textarea>
					</div>

					<br>
					<br>

					</c:if>
					<br>
				<div>
					<button type="button"
						onClick="location.href='asklist?pageNum=${pageNum}'">목록</button>
				</div>
			</div>
			<!--  end col-lg-7 -->
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


