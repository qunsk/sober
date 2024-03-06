<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<style>
.wrapper {
    min-height: 100%;
    position: relative;
}

body{
 height: 100%;
}

footer{
position: relative; 
    transform: translatY(-100%);
}

</style>
<meta charset="UTF-8">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <!--  구글 폰트 ROBOTO MONO-->
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@1,600&display=swap" rel="stylesheet">
    <!--  main 페이지 swiper js -->
    <script src="/resources/public/js/mainswiper.js?ver=1"></script>
    <!--  main 페이지 swiper CDN-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <!--  main 페이지 swiper 및  기본 css들 -->
    <link rel="stylesheet" href="/resources/public/css/last_total.css?ver=1">
    <!--  헤더와 content 간의 이름 비교 후 헤더에 보라색 바를 붙이는 js 파일입니다.  -->
    <script src="/resources/public/js/main_page.js"></script>
    
    
	
<title>SOBER - want to be drunk</title>
</head>
<body>
<div class="wrapper">
<!-- 헤더 -->
    <div class="container-fluid sb-header" style="margin-bottom: 1px;">
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-7 container">
                <div class="title row" onclick="location.href='/'">SOBER</div>
                <div class="nav row  sb-nav" style="border: 0">
                    <ul class="nav nav-tabs nav-ul" style="border: 0">
                       <li class="nav-item">
                            <a class="nav-link" href="/" id="home_bar">홈</a>
                        </li>
                        <div class="sb-line"></div>
                        <li class="nav-item">
                            <a class="nav-link" href="/recipeList" value="칵테일 게시판">칵테일 게시판</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/party_paging" value="파티 게시판">파티 게시판</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/foodList" value="안주 게시판">안주 게시판</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/noticelist" value="뉴스">뉴스</a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="col-lg-3">
                <div class="login-box login-margin">
                    &nbsp;&nbsp;
                    <c:if test="${ empty sessionScope.nickname }">
                        <a href="/member/loginform" class="an_color">로그인/회원가입</a>&nbsp;&nbsp;
                    </c:if>
                    <c:if test="${ ! empty sessionScope.nickname }">
                        <a href="/member/logout" class="an_color">로그아웃</a>&nbsp;&nbsp;
                        <c:choose>
                        	<c:when test="${sessionScope.nickname.equals('관리자')}">
                        		<a href="/dashboard" class="an_color">관리자모드</a>
                        	</c:when>
                        	<c:otherwise>
                        		<a href="/mypage/" class="an_color">마이페이지&nbsp;&nbsp;${alarmCount == 0? '':alarmCount}</a>
                        	</c:otherwise>
                        </c:choose>
                    </c:if>
                    
                    <nav class="navbar bababa">
                        <div class="container-fluid bababa">
                          <form class="d-flex" role="search" action="/search" method="get">
                            <input class="form-control me-2 bg-transparent search_back" type="search" placeholder="전체 검색" aria-label="Search" name="keyword" required="required">
                            <button class="btn btn-outline-success search_back" type="submit">
                            <i class="bi bi-search">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#000" class="bi bi-search" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>
                            </i>
                            </button>
                            
                          </form>
                        </div>
                      </nav>
                </div>
            </div>

        </div>
    </div>
