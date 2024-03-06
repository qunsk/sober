<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%@ include file="header.jsp" %>

  <!--  이 값은 헤더에 홈 링크 아래 보라색 바를 넣기 위한 코드입니다.(hide로 숨겨놨습니다.) -->
  <div id="hide_text_active"><div class="title_box medium" id="nav_active">홈</div></div>

  <div class="container-fluid sb-main">
            <div class="row">
                <div class="col-12 swiper-container">
                    <div class="swiper-wrapper">
                    	<c:forEach var="cocktail" items="${cocktailList}">
                        <div class="swiper-slide">
                        	<a href="${cocktail.uri}${cocktail.pk_num}">
                            <img src="/resources/upload//recipe/${cocktail.img}" />
                            </a>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="row" style="height: 10px"></div>
            

            <br />
            <br />
            <div class="row">
            	<div class="col-lg-2"></div>
            	<div class="col-lg-8" style="padding:0">
            		<div class="sb-main-mini-board-title" style="display: inline-block; width:370px; height:50px; padding: 0px 10px; background-image: url('/resources/public/img/mainpageimg1.png'); background-size: cover;" >
                    </div>
            	</div>
            	<div class="col-lg-2"></div>
            </div>
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8 sb-main-mini-board">
                    <br />
                    <table width="100%">
                        <thead>
                        	<tr>
								<th style="width: 10%">인기순위</th>
	                            <th style="width: 40%">제목</th>
	                            <th style="width: 12%">글쓴이</th>
	                            <th style="width: 12%">조회수</th>
	                            <th style="width: 12%">모임일자</th>                            
                            </tr>
                        </thead>
                        <tbody class="mino-main-table">
                        	<c:forEach var="party" items="${partyList}" varStatus="status">
                            <tr class="godjisoo">
                                <td>${status.count}</td>
                                <td  style="text-align:left;">
                                	<a href="${party.uri}${party.pk_num}">
                                		<span style="background-color:#4C4C4C; color:white; border-radius:5px; padding:2px 6px; font-weight:bold;">${party.location}</span>&nbsp;&nbsp;${party.title}
                                	</a>
                                </td>
                                <td><span id="profile_modal" style="cursor: pointer;">${party.nickname}</span></td>
                                <td>${party.readcount}</td>
                                <td><fmt:formatDate value="${party.regdate}" pattern="yyyy-MM-dd"/></td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-2"></div>
            </div>
            <div class="row" style="height:50px"></div>
            <br />
            <br />
            <div class="row">
            	<div class="col-lg-2"></div>
            	<div class="col-lg-8" style="padding:0">
            		<div class="sb-main-mini-board-title" style="display: inline-block; width:370px; height:50px; padding: 0px 10px; background-image: url('/resources/public/img/mainpageimg2.png'); background-size: cover;" >
                    </div>
            	</div>
            	<div class="col-lg-2"></div>
            </div>
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8 sb-main-mini-board">
                    <br />
                    <table width="100%">
                        <thead>
                            <tr>
	                            <th style="width: 10%">인기순위</th>
	                            <th style="width: 40%">제목</th>
	                            <th style="width: 12%">글쓴이</th>
	                            <th style="width: 12%">조회수</th>
	                            <th style="width: 12%">등록일</th>                            
                            </tr>
                        </thead>
                        <tbody class="mino-main-table">
	                       <c:forEach var="food" items="${foodList}" varStatus="status">
	                           <tr class="godjisoo">
	                               <td>${status.count}</td>
	                               <td style="text-align:left;"><a href="${food.uri}${food.pk_num}">${food.title}</a></td>
	                               <td><span id="profile_modal" style="cursor: pointer;">${food.nickname}</span></td>
	                               <td>${food.readcount}</td>
	                               <td><fmt:formatDate value="${food.regdate}" pattern="yyyy-MM-dd"/></td>
	                           </tr>
                           </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-2"></div>
            </div>
            <br />
            <br />
            
            <div class="row" style="height:50px"></div>
            <div class="row">
            	<div class="col-lg-2"></div>
            	<div class="col-lg-8" style="padding:0">
            		<div class="sb-main-mini-board-title" style="display: inline-block; width:370px; height:50px; padding: 0px 10px; background-image: url('/resources/public/img/mainpageimg3.png'); background-size: cover;" >
                    </div>
            	</div>
            	<div class="col-lg-2"></div>
            </div>
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8 sb-main-mini-board">
                    <br />
                    <table width="100%">
                        <thead>
                        	<tr>
								<th style="width: 10%">인기순위</th>
	                            <th style="width: 40%">제목</th>
	                            <th style="width: 12%">글쓴이</th>
	                            <th style="width: 12%">조회수</th>
	                            <th style="width: 12%">등록일</th>                          
                            </tr>
                        </thead>
                        <tbody class="mino-main-table">
                        	<c:forEach var="notice" items="${noticeList}" varStatus="status">
	                           <tr class="godjisoo">
	                               <td>${notice.pk_num}</td>
	                               <td style="text-align:left;"><a href="${notice.uri}${notice.pk_num}">${notice.title}</a></td>
	                               <td><span id="profile_modal" style="cursor: pointer;">${notice.nickname}</span></td>
	                               <td>${notice.readcount}</td>
	                               <td><fmt:formatDate value="${notice.regdate}" pattern="yyyy-MM-dd"/></td>
	                           </tr>
                           </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-2"></div>
            </div>
            <br />
            <br />
            

            <br />
            <br />
            <br />
        </div>
        <!--  end main -->


<%@ include file="footer.jsp" %>

<!-- 프로필 모달 START -->
<div class="profileModal">
  <div class="profileModal_body">
     <div id="profileCardModal"></div>
     <button class="btn btn-outline-dark" onclick="closeModal()">닫기</button>
   </div>
</div>
<!-- 프로필 모달 END -->


<!-- 모달 관련 JS -->
<script src="/resources/public/js/profileModal.js?ver=5"></script>






