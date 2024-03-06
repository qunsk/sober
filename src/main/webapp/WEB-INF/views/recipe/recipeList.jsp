<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/ctg_title.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>SORBER :: RECIPE</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/recipe/css/recipeList.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- heart on/off 이벤트 처리 -->
<script src="/resources/recipe/js/listHeart.js"></script>

<style>

.pagination > .active > a
{
    color: white;
    background-color: #828282 !Important;
    border: solid 1px #828282 !Important;
}

select {
	width:100px;
	height:30px;
	appearance: none;
	text-align: center;
	border-radius: 30px;
}

select:hover {
	background-color: #212529;
	color: #fff;
	border: solid 1px;
}

select:focus {
	background-color: #212529;
	color: #fff;
	border: solid 1px;
}

option {
	background-color: #fff;
	color: #212529;
}

.userProfile_img {
	margin: 10px 10px; 
	width: 50px; 
	height: 50px; 
	border-radius: 50%; 
	overflow: hidden;
}

.screen  {
	visibility: hidden;
}

.card-img-overlay:hover {
	background: rgba(160, 160, 160, 0.8);
}

.card-img-overlay:hover .hash {
	visibility: hidden;
}

.card-img-overlay:hover .screen {
	visibility: visible;
}

.hash_t {
	background: #B100A5;
}

.hash_f {
	background: #D9FF2A;
    color:black!important;
}


.img-top {
	position: relative;
   	width: 100%;
   	height: 0;
   	padding-top: calc(350 / 300 * 100%);
}
.img-thumnail{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
   	border-radius: 1.5%;
}

/* 프로필 모달 관련 css START */
.profileModal {
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   display: none;
   background-color: rgba(0, 0, 0, 0.4);
   z-index: 2147483647;
}

.profileModal.show {
   display: block;
}

.profileModal_body {
   position: fixed;
   top: 50%;
   left: 50%;
   width: 1200px;
   /*height: 600px;*/
   padding: 30px;
   text-align: center;
   background-color: rgb(255, 255, 255);
   border-radius: 10px;
   box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
   transform: translateX(-50%) translateY(-50%);
   z-index: 2147483647;
}
/* 프로필 모달 관련 css END */

</style>

<script>

   function check(){
      if(confirm("로그인 하셔야 이용할 수 있는 서비스 입니다. \n로그인 하시겠습니까?")){
         location.href='member/loginform';
      }
   }
   
</script>

</head>
<body>
	<%@ include file="../public/header.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2 container">
				<div align="right" class="minimi board_category">Home > 칵테일게시판</div>
			</div>
			<!-- 좌측 빈 여백  -->

			<div class="col-lg-8 container">

				<!--  id=nav_active 가 빠지면 안됩니다. 헤더의 보라색 바를 표시하기 위한 id값입니다.  -->
				<div class="title_box medium" id="nav_active">칵테일 게시판</div>
				<div>
				<!-- 목록 내 검색 -->
					<form action="recipeList">
						<input type="hidden" name="pageNum" value="1">
						<div align="center" style="margin: 50px 0px 20px;">
							<div id="sel">
								<div class="sel">
									<select name="search_m">
										<option value="">재료</option>
										<option value="main" disabled>--주재료 선택--</option>
										<c:forEach var="ctg" items="${ctg}" begin="0" end="8">
											<option value="${ctg.rc_num}" <c:if test="${search_m==ctg.rc_num}">selected="selected" </c:if>>${ctg.title}</option>
										</c:forEach>
										<option value="sub" disabled>--부재료 선택--</option>
										<c:forEach var="ctg" items="${ctg}" begin="9" end="12">
											<option value="${ctg.rc_num}" <c:if test="${search_m==ctg.rc_num}">selected="selected" </c:if>>${ctg.title}</option>
										</c:forEach>
									</select>
								</div>
								<div class="sel">
									<select name="search_f">
										<option value="">맛</option>
										<c:forEach var="f" items="${flavor}">
											<option value="${f}" <c:if test="${search_f==f}">selected="selected" </c:if>>${f}</option>
										</c:forEach>
									</select>
								</div>
								<div class="sel">
									<select name="search_abv" >
										<option value="">도수</option>
										<option value="1" ${search_abv == 1? 'selected':''}>무알콜</option>
										<option value="2" ${search_abv == 2? 'selected':''}>5도이하</option>
										<option value="3" ${search_abv == 3? 'selected':''}>5~10도</option>
										<option value="4" ${search_abv == 4? 'selected':''}>10~20도</option>
										<option value="5" ${search_abv == 5? 'selected':''}>20~30도</option>
										<option value="6" ${search_abv == 6? 'selected':''}>30도 이상</option>
									</select>
								</div>
							</div>
						</div>
						<div align="center">
							<input type="text" name="keyword" style="width: 500px;" placeholder="검색어를 입력하세요.">
							<input type="submit" class="btn btn-outline-dark" style="margin-bottom: 5px" value="검색">
						</div>
					</form> <!-- end 검색 -->
					
					<!-- 검색 초기화 -->
					<c:if test="${not empty keyword or not empty search_m or not empty search_f or not empty search_abv}">
						<div class="searchCoRef">
							<a href="recipeList" style="text-decoration: none; color: #B100A5; font-weight: bold;">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" style="margin-bottom: 5px;" class="bi bi-arrow-counterclockwise" viewBox="0 0 16 16">
									<path fill-rule="evenodd" d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z"/>
									<path d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z"/>
								</svg>&nbsp;검색 초기화</a>
						</div>
					</c:if>
                    <!-- 글작성 버튼 -->
					<div align="right" style="padding-right: 12px; margin-bottom: 20px;">
						<c:if test="${! empty sessionScope.nickname }">
							<div class="btn btn-outline-dark" onclick="location.href='recipeForm?pageNum=${pp.currentPage}'">
		                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
			                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
			                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
		                        </svg> <span> 글작성</span>
		                   	</div>
						</c:if>
						<c:if test="${empty sessionScope.nickname }">
							<div class="btn btn-outline-dark" onclick="check()">
		                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
			                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
			                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
		                        </svg> <span> 글작성</span>
		                   	</div>
						</c:if>
					</div>

					<!-- 게시글 리스트 출력 -->
					<c:if test="${empty list }">
						<div align="center">검색된 데이터가 없습니다.</div>
					</c:if>
	
					<div class="container">
						<c:if test="${not empty list }">
							<div class="row row-cols-1 row-cols-md-3 g-4">
								<c:forEach var="recipe" items="${list }">
									<div class="col">
										<div class="card" data-num="${recipe.r_num }">
											<div class="card-body">
												<!-- 이미지 및 아이콘 출력하는 부분 -->
												<div class="card img-top">
													<c:if test="${recipe.img_url == 'cockimg.png'}">
														<img src="/resources/recipe/img/cockimg.png" class="img-thumnail"/>
													</c:if>
													<c:if test="${recipe.img_url != 'cockimg.png' }">
														<img src="/resources/upload/recipe/${recipe.img_url}" class="img-thumnail"/>
													</c:if>
													<div class="card-img-overlay" id="card-img-overlay" onclick="location.href='recipeView?r_num=${recipe.r_num}&pageNum=${pp.currentPage}&search_m=${search_m}&search_f=${search_f}&search_abv=${search_abv}&keyword=${keyword}'">
														<div class="screen" id="screen">
															<div class="nick_read" id='nick_read' style="position:absolute; top: 35%; left: 10px;">
																
																<!-- 프로필 사진 -->
																<div>
												                   <img class="userProfile_img img-thumnail" src="/resources/upload/mypage/${recipe.profile_img}" alt="profile"  style="width: 50px; height:50px;">
																</div>
																
																
																<!-- 닉네임 -->
																<div style="width:200px; position:absolute; top: 15px; left: 70px;">
																	<span id="profile_modal" style="cursor: pointer; text-align:center;"><b class="largesize">${recipe.nickname}</b></span>
																</div>
																
																
																<!-- 작성일, 조회수, 댓글수 -->
																<div style="width:200px; position:absolute; top: 70px; left: 10px;">
																	<!-- 작성일 -->
																	<font class="medium"><fmt:formatDate value="${recipe.register}" pattern="yyyy-MM-dd"/></font><br>
																	<!-- 조회수 -->
																	<svg style="margin-bottom: 2px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
																		<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
																		<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
																	</svg> <font class="medium">${recipe.readcount}</font>&nbsp;
																	<!-- 댓글수 -->
																	<svg style="margin-bottom: 2px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-right-dots" viewBox="0 0 16 16">
																	  <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
																	  <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
																	</svg> <font class="medium">${recipe.replycount}</font>
																</div>
																
																
															</div>
															<!-- heart icon -->
															<div class="heart_div" align="right" style="position:absolute; top: 10px; right: 10px;">
																<%@ include file="include/listHeart.jsp" %>
															</div>
														</div>
														<!-- hash tag [ 주종(division column == 1), 맛(recipe.flavor) ] -->
														<div class="hash" style="display: inline; position:absolute; bottom: 10px; right: 15px; text-align: right;">
															<c:forEach var="hash" items="${hash }">
																<c:if test="${hash.division == 1 and hash.r_num == recipe.r_num}">
																	<span class="badge hash_t">#${hash.title}</span>
																</c:if>
															</c:forEach>
															<c:set var="flavor" value="${fn:split(recipe.flavor,'-')}"/>
															<c:forEach var="f" items="${flavor}">
																<span class="badge hash_f">#${f}</span>
															</c:forEach>
														</div>
													</div>
												</div>
												<!-- 칵테일 이름 출력하는 부분 -->
												<div class="card-footer" align="center">
													<a style="text-decoration: none; color: black;" href="recipeView?r_num=${recipe.r_num}&pageNume=${pp.currentPage}&search_m=${search_m}&search_f=${search_f}&search_abv=${search_abv}&keyword=${keyword}'">${recipe.cocktail_name}</a>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</c:if>
					</div>
					<!-- 페이징 처리 -->
					<ul class="pagination justify-content-center" style="margin: 30px 0px 30px;">
					<!-- 검색 했을 경우의 페이징 처리 -->
						<c:if test="${not empty keyword or not empty search_m or not empty search_f or not empty search_abv}">
							<c:if test="${pp.startPage > pp.pagePerBlk }">
								<li class="page-item"><a class="page-link pagerfontcolor"
									href="recipeList?pageNum=${pp.startPage - 1}&search_m=${search_m}&search_f=${search_f}&search_abv=${search_abv}&keyword=${keyword}">Back</a></li>
							</c:if>
							<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
								<li class="page-item<c:if test="${pp.currentPage==i}">active</c:if>">
									<a class="page-link pagerfontcolor"
									href="recipeList?pageNum=${i}&search_m=${search_m}&search_f=${search_f}&search_abv=${search_abv}&keyword=${keyword}">${i}</a></li>
							</c:forEach>
							<c:if test="${pp.endPage < pp.totalPage}">
								<li class="page-item"><a class="page-link pagerfontcolor"
									href="recipeList?pageNum=${pp.endPage + 1}&search_m=${search_m}&search_f=${search_f}&search_abv=${search_abv}&keyword=${keyword}">Next</a></li>
							</c:if>
						</c:if>
						
						<!-- 전체 목록의 페이징 처리 -->
						<c:if test="${empty keyword and empty search_m and empty search_f and empty search_abv}">
							<c:if test="${pp.startPage > pp.pagePerBlk }">
								<li class="page-item">
									<a class="page-link pagerfontcolor" 
										href="recipeList?pageNum=${pp.startPage - 1}">Back</a></li>
							</c:if>
							<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
								<li class="page-item  <c:if test="${pp.currentPage==i}">active</c:if>">
									<a class="page-link pagerfontcolor" 
									 href="recipeList?pageNum=${i}">${i}</a>
								</li>
							</c:forEach>
							<c:if test="${pp.endPage < pp.totalPage}">
								<li class="page-item">
									<a class="page-link pagerfontcolor"
										href="recipeList?pageNum=${pp.endPage + 1}">Next</a>
								</li>
							</c:if>
						</c:if>
					</ul>
				</div>
			</div>
		<!-- 가운데 컨텐트 들어갈 곳 -->


			<div class="col-lg-2 container"></div>
			<!-- 우측 빈 여백 -->
		</div>
	</div>
	<!--  end main -->

	<%@ include file="../public/footer.jsp"%>
	
	<!-- 프로필 모달 START -->
	<div class="profileModal">
	  <div class="profileModal_body">
	     <div id="profileCardModal"></div>
	     <button class="btn btn-outline-dark" onclick="closeModal()">닫기</button>
	   </div>
	</div>
	<!-- 프로필 모달 END -->
	
	
	<!-- 모달 관련 JS -->
	<script src="/resources/public/js/profileModal.js"></script>
	
</body>

<!-- <script>

function recipeView(r_num,currentPage) {
	load('recipeView?r_num='+r_num+'&pageNum'+currentPage);
}

</script> -->

</html>
