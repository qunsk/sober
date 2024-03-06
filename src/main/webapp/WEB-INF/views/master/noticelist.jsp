<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style type="text/css">
.pagination>.active>a {
	color: white;
	background-color: #828282 !Important;
	border: solid 1px #828282 !Important;
}
</style>
<script type="text/javascript">
	function sendVar() {
		$("#notice_").val($("#notice_type").val());
	}

	function noticeChange() {

		var notice_type = $("#notice_type option:selected").val();
		var keyword = $("#keyword").val();
		var search = $("#search").val();

		var params = "?pageNum=1";
		params += "&notice_type=" + notice_type;
		if (keyword.length > 0) {
			params += "&search=" + search + "&keyword=" + keyword;
		}
		location.href = "noticelist" + params;
	}
</script>
</head>

<body>

	<%@ include file="../public/header.jsp"%>

	<c:if test="${ ! empty result }">
		<script>
			alert("게시글 삭제 완료.");
		</script>
	</c:if>


	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2 container">
				<div align="right" class="minimi board_category">Home > 뉴스</div>
			</div>
			<!-- 좌측 빈 여백  -->

			<div class="col-lg-8 container">
				<!--  id=nav_active 가 빠지면 안됩니다. 헤더의 보라색 바를 표시하기 위한 id값입니다.  -->
				<div class="title_box medium" id="nav_active">뉴스</div>
				<div class="write_box" align="right">
					<div align="left">
						<select id="notice_type" name="notice_type"
							onchange="noticeChange()">
							<option value="" ${(notice_type == '')? "selected": ""}>전체글</option>
							<option value="공지" ${(notice_type == '공지')? "selected": ""}>공지</option>
							<option value="행사" ${(notice_type == '행사')? "selected": ""}>행사</option>
						</select>
					</div>
				</div>

				<c:set var="m" value="${no }"></c:set>
				<table class="table whitespace_box">
					<thead>
						<tr class="medium">
							<th>번호</th>
							<th>글 종류</th>
							<th width=60%>제목</th>
							<th>조회수</th>
						</tr>
					</thead>
					<c:if test="${empty noticelist}">
						<tbody>
							<tr>
								<td colspan="4">작성된 글이 없습니다.</td>
							</tr>
						</tbody>
					</c:if>
					<c:if test="${not empty noticelist}">
						<tbody>
							<c:set var="m" value="${no }"></c:set>
							<c:forEach var="n" items="${noticelist}">
								<tr>
									<td>${m}</td>
									<td>${n.notice_type }</td>
									<td width=60% class=alignleft_box><a
										href="noticedetail?pageNum=${p.currentPage}&notice_no=${n.notice_no}&search=${search }&keyword=${keyword }&notice_type=${notice_type}">${n.notice_title}</a></td>
									<td>${n.readcount}</td>
								</tr>
								<c:set var="m" value="${m - 1}"></c:set>
							</c:forEach>
						</tbody>
					</c:if>
				</table>

				<c:if test="${not empty keyword and not empty notice_type}">
					<ul class="pagination justify-content-center"
						style="margin: 30px 0px 30px;">
						<c:if test="${p.startPage > p.pagePer }">
							<li class="page-item disabled"><a
								class="page-link pagerfontcolor"
								href="noticelist?pageNum=${p.startPage-1 }&search=${search}&keyword=${keyword}&notice_type=${notice_type}">Back</a></li>
						</c:if>
						<c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
							<li
								class="page-item <c:if test="${p.currentPage==i}">active</c:if>"><a
								class="page-link pagerfontcolor"
								href="noticelist?pageNum=${i }&search=${search}&keyword=${keyword}&notice_type=${notice_type}">${i }</a></li>
						</c:forEach>
						<c:if test="${p.totalPage>p.endPage }">
							<li class="page-item"><a class="page-link pagerfontcolor"
								href="noticelist?pageNum=${p.endPage+1 }&search=${search}&keyword=${keyword}&notice_type=${notice_type}">Next</a></li>
						</c:if>
					</ul>
				</c:if>

				<c:if test="${empty keyword and not empty notice_type}">
					<ul class="pagination justify-content-center"
						style="margin: 30px 0px 30px;">
						<c:if test="${p.startPage > p.pagePer }">
							<li class="page-item disabled"><a
								class="page-link pagerfontcolor"
								href="noticelist?pageNum=${p.startPage-1 }&notice_type=${notice_type}">Back</a></li>
						</c:if>
						<c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
							<li
								class="page-item <c:if test="${p.currentPage==i}">active</c:if>"><a
								class="page-link pagerfontcolor"
								href="noticelist?pageNum=${i }&notice_type=${notice_type}">${i }</a></li>
						</c:forEach>
						<c:if test="${p.totalPage>p.endPage }">
							<li class="page-item"><a class="page-link pagerfontcolor"
								href="noticelist?pageNum=${p.endPage+1 }&notice_type=${notice_type}">Next</a></li>
						</c:if>
					</ul>
				</c:if>
				<c:if test="${not empty keyword and empty notice_type}">
					<ul class="pagination justify-content-center"
						style="margin: 30px 0px 30px;">
						<c:if test="${p.startPage > p.pagePer }">
							<li class="page-item disabled"><a
								class="page-link pagerfontcolor"
								href="noticelist?pageNum=${p.startPage-1 }&search=${search}&keyword=${keyword}">Back</a></li>
						</c:if>
						<c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
							<li
								class="page-item <c:if test="${p.currentPage==i}">active</c:if>"><a
								class="page-link pagerfontcolor"
								href="noticelist?pageNum=${i }&search=${search}&keyword=${keyword}">${i }</a></li>
						</c:forEach>
						<c:if test="${p.totalPage>p.endPage }">
							<li class="page-item"><a class="page-link pagerfontcolor"
								href="noticelist?pageNum=${p.endPage+1 }&search=${search}&keyword=${keyword}">Next</a></li>
						</c:if>
					</ul>
				</c:if>

				<c:if test="${empty keyword and empty notice_type}">
					<ul class="pagination justify-content-center"
						style="margin: 30px 0px 30px;">
						<c:if test="${p.startPage > p.pagePer }">
							<li class="page-item disabled"><a
								class="page-link pagerfontcolor"
								href="noticelist?pageNum=${p.startPage-1 }">Back</a></li>
						</c:if>
						<c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
							<li
								class="page-item <c:if test="${p.currentPage==i}">active</c:if>"><a
								class="page-link pagerfontcolor" href="noticelist?pageNum=${i }">${i }</a></li>
						</c:forEach>
						<c:if test="${p.totalPage>p.endPage }">
							<li class="page-item"><a class="page-link pagerfontcolor"
								href="noticelist?pageNum=${p.endPage+1 }">Next</a></li>
						</c:if>
					</ul>
				</c:if>

				<form action="noticelist">
					<div class="search_box2">
						<input type="hidden" name="notice_type" id="notice_" value="">
						<select id="search" name="search">
							<option value="notice_title">제목</option>
							<option value="notice_content">내용</option>
							<option value="ti_con">제목 + 내용</option>
						</select>&nbsp;&nbsp;
							<input type="text" class="search_boxb" id="keyword"
								name="keyword">&nbsp;&nbsp; 

						<input type="submit" value="검색" class="btn btn-outline-dark"
							onclick="sendVar();">
					</div>
				</form>

			</div>
			<!-- 가운데 컨텐트 들어갈 곳 -->

			<div class="col-lg-2 container"></div>
			<!-- 우측 빈 여백 -->

		</div>
	</div>
	<!--  end main -->

	<%@ include file="../public/footer.jsp"%>

</body>
</html>