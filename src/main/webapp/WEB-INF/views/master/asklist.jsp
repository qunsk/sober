<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<!--  구글 폰트 ROBOTO MONO-->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@1,600&display=swap"
	rel="stylesheet">
<!--  default 페이지 css -->
<link rel="stylesheet" href="/resources/public/css/paging_page.css">
<link rel="stylesheet" href="/resources/master/css/titletext.css">
<style type="text/css">
a:link {
  color : black;
}
a:visited {
  color : black;
}
a:hover {
  color : black;
}
a:active {
  color : black;
}
</style>
</head>

<body>
<%@ include file="masterheader.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2 container">
				<div align="right" class="minimi board_category"></div>
			</div>
			<div class="col-lg-8 container">

				<div class="title_box medium" id="title-set">
					1:1 문의
					<br><br>
				</div>

				<form action="">
					<table class="table whitespace_box">
						<thead>
							<tr class="medium">
								<th style="text-align:center;">번호</th>
								<th style="text-align:center;">닉네임</th>
								<th style="text-align:center;">문의 글 제목</th>
								<th style="text-align:center;">답변 확인</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list }">
								<tr>
									<td colspan="4">등록된 문의가 없습니다.</td>
								</tr>
							</c:if>
								<c:set var="m" value="${no }"></c:set>
							<c:if test="${not empty list  }">
								<c:forEach var="a" items="${list}">
									<tr>
										<td>${m }</td>
										<td>${a.nickname}</td>
										<td width="50%"><a
											href="askdetail?pageNum=${pageNum}&ask_no=${a.ask_no }">
												1:1 문의 합니다.</a></td>
										<td>
										<c:if test="${not empty a.ask_re_content }">답변 완료</c:if>
										<c:if test="${empty a.ask_re_content }">가능</c:if> 
										</td>
									</tr>
								<c:set var="m" value="${m - 1 }"></c:set>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</form>

				<ul class="pagination justify-content-center"
					style="margin-bottom: 30px">
					<c:if test="${p.startPage > p.pagePer }">
						<li class="page-item"><a class="page-link pagerfontcolor"
							href="asklist?pageNum=${p.startPage-1}">Back</a></li>
					</c:if>

					<c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
						<li
							class="page-item<c:if test="${p.currentPage == i}"> active</c:if>"><a
							class="page-link pagerfontcolor" href="asklist?pageNum=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${p.endPage < p.totalPage}">
						<li class="page-item"><a class="page-link pagerfontcolor"
							href="asklist?pageNum=${p.endPage+1}">Next</a></li>
					</c:if>
				</ul>
			</div>
			<!-- 가운데 컨텐트 들어갈 곳 -->

			<div class="col-lg-2 container"></div>
			<!-- 우측 빈 여백 -->

		</div>
	</div>
	<!--  end main -->

</body>
</html>