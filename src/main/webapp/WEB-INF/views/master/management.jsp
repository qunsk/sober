<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<!--  구글 폰트 ROBOTO MONO-->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@1,600&display=swap"
	rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


<!--  main 페이지 swiper 및  기본 css들 -->
<link rel="stylesheet" href="/resources/public/css/main_page.css">
<link rel="stylesheet" href="/resources/master/css/titletext.css">


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
					회원 목록
				</div>
				<div class="write_box" align="left">
					<select id="state" name="state" onchange="orderdelete()">
						<option value="O" ${state == 'O' ? 'selected="selected"' : '' }>전체 회원</option>
						<option value="X" ${state == 'X' ? 'selected="selected"' : '' }>탈퇴 회원</option>
					</select>
				</div>

				<table class="table whitespace_box">
					<thead>
						<tr class="medium" align="center">
							<th>ID</th>
							<th>닉네임</th>
							<th>E-Mail</th>
							<th>탈퇴</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty memberlist }">
							<tr>
								<td colspan="4">등록된 회원이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty memberlist }">
							<c:forEach var="m" items="${memberlist}">
								<tr>
									<td>${m.id}</td>
									<td>${m.nickname}</td>
									<td>${m.mailid}@${m.domain}</td>
									<c:if test="${m.state == 'O'}">
										<td><input type="button" class="btn btn-outline-danger btn-sm"
											value="탈퇴" onclick="deleteaccount('${m.id}')"></td>
									</c:if>
									<c:if test="${m.state == 'X'}">
										<td>탈퇴 회원</td>
									</c:if>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>

				<ul class="pagination justify-content-center"
					style="margin-bottom: 30px">
					<c:if test="${empty keyword and state == 'X'}">
						<c:if test="${p.startPage > p.pagePer }">
							<li class="page-item disabled"><a
								class="page-link pagerfontcolor"
								href="management?pageNum=${p.startPage-1}&state=${state}">Back</a></li>
						</c:if>
						<c:forEach var="i" begin="${p.startPage}" end="${p.endPage }">
							<li
								class="page-item<c:if test="${p.currentPage == i}"> active </c:if>"><a
								class="page-link pagerfontcolor" href="management?pageNum=${i}&state=${state}">${i}</a></li>
						</c:forEach>
						<c:if test="${p.endPage < p.totalPage}">
							<li class="page-item"><a class="page-link pagerfontcolor"
								href="managment?pageNum=${p.endPage + 1}&state=${state}">Next</a></li>
						</c:if>
					</c:if>
					<c:if test="${not empty keyword and state == 'X'}">
						<c:if test="${p.startPage > p.pagePer}">
							<li class="page-item disabled"><a
								class="page-link pagerfontcolor"
								href="management?pageNum=${p.startPage-1}&search=${search}&keyword=${keyword}&state=${state}">Back</a></li>
						</c:if>
						<c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
							<li
								class="page-item<c:if test="${p.currentPage==i}"> active </c:if>"><a
								class="page-link pagerfontcolor"
								href="management?pageNum=${i}&search=${search}&keyword=${keyword}&state=${state}">${i}</a></li>
						</c:forEach>
						<c:if test="${p.endPage < p.totalPage }">
							<li class="page-item"><a class="page-link pagerfontcolor"
								href="managment?pageNum=${p.endPage + 1}&search=${search}&keyword=${keyword}&state=${state}">Next</a></li>
						</c:if>
					</c:if>
					<c:if test="${empty keyword and state != 'X'}">
						<c:if test="${p.startPage > p.pagePer }">
							<li class="page-item disabled"><a
								class="page-link pagerfontcolor"
								href="management?pageNum=${p.startPage-1}">Back</a></li>
						</c:if>
						<c:forEach var="i" begin="${p.startPage}" end="${p.endPage }">
							<li
								class="page-item<c:if test="${p.currentPage == i}"> active </c:if>"><a
								class="page-link pagerfontcolor" href="management?pageNum=${i}">${i}</a></li>
						</c:forEach>
						<c:if test="${p.endPage < p.totalPage}">
							<li class="page-item"><a class="page-link pagerfontcolor"
								href="managment?pageNum=${p.endPage + 1}">Next</a></li>
						</c:if>
					</c:if>
					<c:if test="${not empty keyword and state != 'X'}">
						<c:if test="${p.startPage > p.pagePer}">
							<li class="page-item disabled"><a
								class="page-link pagerfontcolor"
								href="management?pageNum=${p.startPage-1}&search=${search}&keyword=${keyword}">Back</a></li>
						</c:if>
						<c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
							<li
								class="page-item<c:if test="${p.currentPage==i}"> active </c:if>"><a
								class="page-link pagerfontcolor"
								href="management?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a></li>
						</c:forEach>
						<c:if test="${p.endPage < p.totalPage }">
							<li class="page-item"><a class="page-link pagerfontcolor"
								href="managment?pageNum=${p.endPage + 1}&search=${search}&keyword=${keyword}">Next</a></li>
						</c:if>
					</c:if>
				</ul>
				<form action="management">
					<input type="hidden" name="pageNum" value="1">
					<input type="hidden" name="state" id="state_val" value="${state}">
					<div class="search_box2">
						<select id="search" name="search">
							<option value="id" <c:if test="${search == 'id'}"></c:if>>ID</option>
							<option value="nickname" <c:if test="${search == 'nickname'}"></c:if>>닉네임</option>
							<option value="mailid" <c:if test="${search == 'mailid'}"></c:if>>Email
								ID</option>
						</select> &nbsp;&nbsp; <input type="text" class="search_boxb" id="keyword"
							name="keyword"> &nbsp;&nbsp; <input type="submit"
							value="검색" class="btn btn-outline-dark" >
					</div>
				</form>
			</div>
			<!-- 가운데 컨텐트 들어갈 곳 -->

			<div class="col-lg-2 container"></div>
			<!-- 우측 빈 여백 -->

		</div>
	</div>
	<!--  end main -->
<script>
	
		
	function deleteaccount(id) {
		let con = confirm(id + "님을 정말 탈퇴하시겠습니까?");
		console.log(id);
		console.log(con);
		if(con){
			$.ajax({
				url : "deleteaccount",
				type : "post",
				contentType : "application/json; charset=UTF-8",
				data : JSON.stringify({"id":id}),
				success : function(data) {
					console.log("요청이 성공했습니다.");
					console.log(data);
					alert("탈퇴 되었습니다.");
					location.reload();
				}
			});
		}
	}

	
	function orderdelete() {
		var state = $("#state").val();
		location.href = "management?pageNum=1&state=" + state;
	}
	

</script>
</body>
</html>