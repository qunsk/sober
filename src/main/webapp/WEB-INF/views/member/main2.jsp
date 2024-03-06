<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
</head>
<body>
<%@ include file="etc/header.jsp" %>

  <!--  이 값은 헤더에 홈 링크 아래 보라색 바를 넣기 위한 코드입니다.(hide로 숨겨놨습니다.) -->
  <div id="hide_text_active"><div class="title_box medium" id="nav_active">홈</div></div>

  <div class="container-fluid sb-main">
            <div class="row swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrhuLWXc28kiOccB7nJv28cwKNyGtWBlhIcw&usqp=CAU"></div>
                    <div class="swiper-slide"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSu3Efn73ronFkC7FCXmLGIoh1L3A5gqaiScg&usqp=CAU"></div>
                    <div class="swiper-slide"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqoz63dS-H56rwH3iztbM2et9X2xKUUpmNeA&usqp=CAU"></div>
                    <div class="swiper-slide"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQt4FTc916g-7ppesoRJKs4Rfz_MxnmodGF5A&usqp=CAU"></div>
                    <div class="swiper-slide"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkkAvg4TVU1HdvVkH5ud50nZef-MpL7ngioQ&usqp=CAU"></div>
                    <div class="swiper-slide"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR68pBQMpdLA46Q1QA3jsZvlcgC3-c0uNhloA&usqp=CAU"></div>
                    <div class="swiper-slide"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-6Zu2VV0eDGbM20iVzfNRucWE1aWmPyh8tg&usqp=CAU"></div>
                </div>
            
                <!-- 네비게이션 -->
                <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
            
                <!-- 페이징 -->
                <div class="swiper-pagination"></div>
            </div>
            <br>
            <br>
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8 sb-main-mini-board">
                    <div class="sb-main-mini-board-title"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#B100A5" class="bi bi-people-fill" viewBox="0 0 16 16">
                        <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"/>
                      </svg>&nbsp;&nbsp;파티게시판</div>
                    <br>
                    <table width="100%">
                        <thead>
                            <th>번호</th>
                            <th width="70%">제목</th>
                            <th>조회수</th>
                            <th>모임일자</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>오늘 이대에서 한잔 하실분~~~~</td>
                                <td>12858</td>
                                <td>23-05-04</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>오늘 이대에서 한잔 하실분~~~~</td>
                                <td>12858</td>
                                <td>23-05-04</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>오늘 이대에서 한잔 하실분~~~~</td>
                                <td>12858</td>
                                <td>23-05-04</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>오늘 이대에서 한잔 하실분~~~~</td>
                                <td>12858</td>
                                <td>23-05-04</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>오늘 이대에서 한잔 하실분~~~~</td>
                                <td>12858</td>
                                <td>23-05-04</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-2"></div>
            </div>
            <br>
            <br>
               <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8 sb-main-mini-board">
                    <div class="sb-main-mini-board-title"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#B100A5" class="bi bi-blockquote-left" viewBox="0 0 16 16">
  <path d="M2.5 3a.5.5 0 0 0 0 1h11a.5.5 0 0 0 0-1h-11zm5 3a.5.5 0 0 0 0 1h6a.5.5 0 0 0 0-1h-6zm0 3a.5.5 0 0 0 0 1h6a.5.5 0 0 0 0-1h-6zm-5 3a.5.5 0 0 0 0 1h11a.5.5 0 0 0 0-1h-11zm.79-5.373c.112-.078.26-.17.444-.275L3.524 6c-.122.074-.272.17-.452.287-.18.117-.35.26-.51.428a2.425 2.425 0 0 0-.398.562c-.11.207-.164.438-.164.692 0 .36.072.65.217.873.144.219.385.328.72.328.215 0 .383-.07.504-.211a.697.697 0 0 0 .188-.463c0-.23-.07-.404-.211-.521-.137-.121-.326-.182-.568-.182h-.282c.024-.203.065-.37.123-.498a1.38 1.38 0 0 1 .252-.37 1.94 1.94 0 0 1 .346-.298zm2.167 0c.113-.078.262-.17.445-.275L5.692 6c-.122.074-.272.17-.452.287-.18.117-.35.26-.51.428a2.425 2.425 0 0 0-.398.562c-.11.207-.164.438-.164.692 0 .36.072.65.217.873.144.219.385.328.72.328.215 0 .383-.07.504-.211a.697.697 0 0 0 .188-.463c0-.23-.07-.404-.211-.521-.137-.121-.326-.182-.568-.182h-.282a1.75 1.75 0 0 1 .118-.492c.058-.13.144-.254.257-.375a1.94 1.94 0 0 1 .346-.3z"/>
</svg>&nbsp;&nbsp;뉴스</div>
                    <br>
                    <table width="100%">
                        <thead>
                            <th>번호</th>
                            <th width="70%">제목</th>
                            <th>조회수</th>
                            <th>작성일</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>칵테일 원데이 클래스 공고 모음</td>
                                <td>12858</td>
                                <td>23-05-04</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>공지</td>
                                <td>12858</td>
                                <td>23-05-04</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>공지</td>
                                <td>12858</td>
                                <td>23-05-04</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>공지</td>
                                <td>12858</td>
                                <td>23-05-04</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>공지</td>
                                <td>12858</td>
                                <td>23-05-04</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-2"></div>
            </div>
            <br>
            <br>
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8 sb-main-mini-board">
                    <div class="sb-main-mini-board-title"><svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="#B100A5" class="bi bi-heart-fill" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                      </svg>&nbsp;&nbsp;안주게시판</div>
                    <br>
                    <table width="100%">
                        <thead>
                            <th>번호</th>
                            <th width="70%">제목</th>
                            <th>조회수</th>
                            <th>모임일자</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>오늘 이대에서 한잔 하실분~~~~</td>
                                <td>12858</td>
                                <td>23-05-04</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>오늘 이대에서 한잔 하실분~~~~</td>
                                <td>12858</td>
                                <td>23-05-04</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>오늘 이대에서 한잔 하실분~~~~</td>
                                <td>12858</td>
                                <td>23-05-04</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>오늘 이대에서 한잔 하실분~~~~</td>
                                <td>12858</td>
                                <td>23-05-04</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>오늘 이대에서 한잔 하실분~~~~</td>
                                <td>12858</td>
                                <td>23-05-04</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-2"></div>
            </div>
            <br>
            <br>
         
        <br>
        <br>
        <br>
    </div> <!--  end main -->


<%@ include file="../public/footer.jsp" %>
</body>
</html>