<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <!--  구글 폰트 ROBOTO MONO-->
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@1,600&display=swap" rel="stylesheet">
    <!--  default 페이지 css -->
    <link rel="stylesheet" href="/resources/public/css/paging_page.css">
    <!--  main 페이지 swiper js -->
    <script src="/resources/public/js/mainswiper.js"></script>
    <!--  main 페이지 swiper CDN-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <!--  main 페이지 swiper 및  기본 css들 -->
    <link rel="stylesheet" href="/resources/public/css/main_page.css">
    <!--  헤더와 content 간의 이름 비교 후 헤더에 보라색 바를 붙이는 js 파일입니다.  -->
    <script src="/resources/public/js/main_page.js"></script>
    
    
<title>header</title>
</head>
<body>
<!-- 헤더 -->
    <div class="container-fluid sb-header">
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-7 container">
                <div class="title row">SOBER</div>
                <div class="nav row  sb-nav">
                    <ul class="nav nav-tabs nav-ul">
                       <li class="nav-item">
                            <a class="nav-link" href="#" id="home_bar">홈</a>
                        </li>
                        <div class="sb-line"></div>
                        <li class="nav-item">
                            <a class="nav-link" href="#" value="칵테일 게시판">칵테일 게시판</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" value="파티 게시판">파티 게시판</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" value="안주 게시판">안주 게시판</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" value="뉴스">뉴스</a>
                        </li>
                       <!--  <li class="nav-item">
                          <a class="nav-link" href="#">홈</a>
                        </li>
                        <div class="sb-line"></div>
                        <li class="nav-item">
                          <a class="nav-link" href="#">칵테일 레시피</a>
                        </li>
                        <li class="nav-item sb-active">
                          <a class="nav-link" href="#">파티 게시판</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">안주 게시판</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">뉴스</a>
                        </li> -->
                    </ul>
                </div>
            </div>

            <div class="col-lg-3">
                <div class="login-box login-margin">
                    &nbsp;&nbsp;
                        <a href="logout" class="an_color">로그아웃</a>&nbsp;&nbsp;
                        
                        <a href="update_form" class="an_color">마이페이지</a>
                    
                    <nav class="navbar bababa">
                        <div class="container-fluid bababa">
                          <form class="d-flex" role="search">
                            <input class="form-control me-2 bg-transparent search_back" type="search" placeholder="Search" aria-label="Search">
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
</body>
</html>