<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>SOBER :: ${notice.notice_title}</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <!--  구글 폰트 ROBOTO MONO-->
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@1,600&display=swap" rel="stylesheet">
    <!--  default 페이지 css -->
    <link rel="stylesheet" href="/resources/public/css/paging_page.css">

<style>
.notice_content_box{
    border: 1px solid #EDEDED;
    border-radius:10px;
    padding:60px 40px;
    height: auto;
    min-height:600px;
    text-align: left;
    margin-top:70px;
}    
</style>

</head>

<body>
	<%@ include file="../public/header.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2 container">
				<div align="right" class="minimi board_category">Home > 뉴스</div>
			</div>
			<!-- 좌측 빈 여백  -->

			<div class="col-lg-8 container">

				<!--  id=nav_active 가 빠지면 안됩니다. 헤더의 보라색 바를 표시하기 위한 id값입니다.  -->
				<div class="title_box medium" id="nav_active"
					style="visibility: hidden;">뉴스</div>

				<div class="foodPage" align="center">
					<div style="font-size: 45px; text-align:left; margin-bottom:80px; margin-top:100px;">${notice.notice_title}</div>
					<div align="left">
						<fmt:formatDate value="${notice.notice_time}" pattern="yyyy.MM.dd"></fmt:formatDate>
						&nbsp;&nbsp; <img
							style="width: 25px; height: 25px; margin-bottom: 2px"
							src="/resources/master/img/read.png"> ${notice.readcount}
					</div>
					<hr>
					<div class="notice_content_box">${notice.notice_content}</div>
					<br> <br> <br> <br>
					<div>
						<c:if test="${empty bnotice_type }">
							<input type="button" class="btn btn-outline-dark" value="목록"
								onClick="location.href='noticelist?pageNum=${pageNum}&search=${search }&keyword=${keyword }'">
						</c:if>
						<c:if test="${not empty bnotice_type }">
							<input type="button" class="btn btn-outline-dark" value="목록"
								onClick="location.href='noticelist?pageNum=${pageNum}&search=${search }&keyword=${keyword }&notice_type=${notice.notice_type }'">
						</c:if>
						<c:if
							test="${ ! empty sessionScope.nickname and sessionScope.nickname == '관리자' }">
							<input type="button" class="btn btn-outline-dark" value="수정"
								onClick="location.href='noticeupdate?pageNum=${pageNum}&notice_no=${notice.notice_no}&notice_type=${notice.notice_type}'">
							<input type="button" class="btn btn-outline-dark" value="삭제"
								onClick="location.href='noticedelete?notice_no=${notice.notice_no}'">
						</c:if>
					</div>
					<br> <br> <br> <br>
				</div>
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