<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="../public/header.jsp"%>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<style>
h1 {
   text-align: center;
}

table {
   width: 825px;
   margin-top: 20px;
   border-collapse: collapse;
}

th, td {
   border: 1px solid black;
   padding: 10px;
   text-align: center;
}

th {
   background-color: #f5f5f5;
}

</style>

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
			<h1>1:1 문의 수정하기</h1>
			<br> <br>

			<form action="askModify" method="post">
				<input type="hidden" name="ask_no" value="${modify.ask_no}" />
				<table class="tb1">
					<tr>
						<th>번호</th>
						<td class="short-input">${modify.ask_no}</td>
						<th>작성날짜</th>
						<td class="short-input">${modify.ask_date}</td>
						<th>작성자</th>
						<td class="short-input">${modify.nickname}</td>
					</tr>
				</table>
				<div class="mb-3">
					<label for="ask_content"></label>
					<textarea class="form-control" rows="14" name="ask_content"
						id="ask_content" style="resize: none; width: 825px;">${modify.ask_content}</textarea>
				</div>

				<input type="submit" value="등록"> <input type="button"
					value="취소" onclick="history.go(-1)">
				<!-- 취소눌렀을때 1:1게시판 목록으로 가기 -->

			</form>
		</div>
	</div>
</div>
<br>
<br>

<!-- 푸터 -->
<%@ include file="../public/footer.jsp"%>