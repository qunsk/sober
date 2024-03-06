<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>SOBER :: ${recipe.cocktail_name}</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/recipe/css/recipeForm.css">
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
<script src="/resources/recipe/js/viewHeart.js?ver=1"></script>

<script>


 $(document).ready(function() {
	
	var r_num = ${r_num};
	var receiver_nickname = '${recipe.nickname}';	// 게시물 작성자
	
	// DB에 저장된 댓글을 상세페이지로 load
	//$("#recipeReply").load("recipeReplyList?r_num="+r_num+"&receiver_nickname="+receiver_nickname);
	$("#recipeReply").load("recipeReplyList?r_num="+r_num+"&receiver_nickname=${recipe.nickname}");
	
});
 
 
	function clip(){

	   var url = '';
	   var textarea = document.createElement("textarea");
	   
	   document.body.appendChild(textarea);
	   url = window.document.location.href;
	   textarea.value = url;
	   textarea.select();
	   document.execCommand("copy");
	   document.body.removeChild(textarea);
	   alert("URL이 복사되었습니다.")
	}
 
 
   function del(r_num){
	   
	   var chk = confirm("게시물을 삭제 하시겠습니까?");
	   
	   if(chk){
	      location.href="recipeDelete?r_num="+r_num;
	      alert("삭제 되었습니다.")
	   }else{
	  	 return false
	   }
   }

   function Edit(r_num){
	   
	   var chk = confirm("게시물을 수정 하시겠습니까?");
	   
	   if(chk){
	      location.href="recipeEdit?r_num="+r_num;
	   }else{
	  	 return false
	   }
   }

 
</script>

<style>

h3 {
	margin-left: 12px;
}

.sub_view {
	text-align: left;
}

.td_line {
	border: 1px solid #E6E6E6;
	border-top: none;
	border-left: none;
	border-right: none;
}

.profile {
	padding: 0px 20px 40px
}

.userProfile_img {
	margin: 10px 10px; 
	width: 50px; 
	height: 50px; 
	border-radius: 50%; 
	overflow: hidden;
}

.cocktail_icon {
	width: 30px;
	height: 30px;
	margin: 0px 10px 10px 0px;
}

.content {
	margin: 0px 0px 25px 50px;
	text-align: left;
}

.content_m {
	display: inline-block; 
	width: 45%; 
	text-align: left;
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
				<div class="title_box largesize" id="nav_active" style="visibility: hidden; margin: 0;">칵테일 게시판</div>

				<div class="row" align=center>
					<table>
						<!-- 칵테일 이름 -->
						<tr>
							<td class="td_line" style="margin-bottom: 25px;">
								<div align="left" class="subject" >
									 <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#B100A5" class="bi bi-chat-right-dots" viewBox="0 0 16 16">
								       <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
								       <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/> 
								      </svg>
									<span style="padding: 10px;"><b class="largesize">${recipe.cocktail_name}</b></span>
								</div>
							</td>
						</tr>
						<!-- 작성자 프로필, 작성일, 조회수 -->
						<tr>
							<td class="td_line profile">
								<div align="left">
									<c:if test="${ ! empty writeProfile }">
					                   <img class=userProfile_img src="/resources/upload/mypage/${writeProfile }" alt="profile">
					                </c:if>
					                <c:if test="${ empty writeProfile }">
					                   <img class=userProfile_img src="/resources/mypage/img/sober_profile_img.png" alt="profile">
					                </c:if>
									<span class="mediem" id="profile_modal" style="cursor: pointer; text-align:center;"><b>${recipe.nickname}</b></span><br><br>
									<div>
										<fmt:formatDate value="${recipe.register}" pattern="yyyy-MM-dd"></fmt:formatDate>&nbsp;&nbsp;
										<img style="width: 25px; height: 25px; margin-bottom: 2px" src="/resources/recipe/img/read.png"> ${recipe.readcount}
									</div>
								</div>	
							</td>
						</tr>
						<!-- 칵테일 사진-->
						<tr>
							<td align="center" class="td_line">
								<div class="subject">
									<c:if test="${recipe.img_url == 'cockimg.png' }">
										<img src="/resources/recipe/img/cockimg.png" width="300px;" height="400px;" />
									</c:if>
									<c:if test="${recipe.img_url != 'cockimg.png' }">
										<img src="/resources/upload/recipe/${recipe.img_url}" width="300px;" height="400px;" />
									</c:if>
								</div>
							</td>
						</tr>
						<!-- 재료-->
						<tr>
							<td align="left" class="td_line">
								<div class="subject sub_view">
									<h3><img class="cocktail_icon" src="/resources/recipe/img/cocktail_icon.png">재료</h3>
								</div>
								<div style="margin-bottom: 25px">
									<div class="content_m" style="margin-left: 5px;">
										<c:forEach var="material" items="${mclist }">
											<font class="medium">${material.title} (${material.product})</font> <br>
										</c:forEach>
									</div>
									<div class="content_m">
										<c:forEach var="material" items="${mclist }">
											<font class="medium">용량 (${material.volume} ml)</font> <br>
										</c:forEach>
									</div>
								</div>
							</td>
						</tr>
						<!-- 도수 -->
						<tr>
							<td align="left" class="td_line">
								<div class="subject sub_view">
									<h3><img class="cocktail_icon" src="/resources/recipe/img/cocktail_icon.png">도수</h3>
									<div class="content">
										<c:if test="${abv_result == 0.0}">
											<font class="medium">0 도</font>
										</c:if>
										<c:if test="${abv_result != 0.0}">
											<font class="medium">${abv_result} 도</font>
										</c:if>
									</div>
								</div>
							</td>
						</tr>
						<!-- 맛 -->
						<tr>
							<td align="left" class="td_line">
								<div class="subject sub_view">
									<h3><img class="cocktail_icon" src="/resources/recipe/img/cocktail_icon.png">맛</h3>
									<div class="content">
										<c:forEach var="flavor" items="${rflavor}">
											<font class="medium">${flavor}</font>&nbsp;
										</c:forEach>
									</div>
								</div>
							</td>
						</tr>
						<!-- 상세설명 -->
						<tr>
							<td align="left" class="td_line">
								<div class="subject sub_view">
									<h3><img class="cocktail_icon" src="/resources/recipe/img/cocktail_icon.png">상세설명</h3>
								</div>
								<div class="content" style="margin-bottom: 5%">
									<pre><font class="medium">${recipe.detail}</font></pre>
								</div>
							</td>
						</tr>
						<!-- 버튼 -->
						<tr>
							<td align="center">
								<div style="margin-top: 3%; ">
									<input type="button" class="btn btn-outline-dark" value="목록"
										onclick="location.href='recipeList?pageNum=${pageNum}&search_m=${search_m}&search_f=${search_f}&search_abv=${search_abv}&keyword=${keyword}'">
									<c:if test="${sessionScope.nickname == recipe.nickname}">	<!-- 글 작성자인 경우에만 보이도록 설정 -->
										<input type="button" class="btn btn-outline-dark" value="수정" onclick="Edit(${recipe.r_num})">
										<input type="button" class="btn btn-outline-dark" value="삭제" onclick="del(${recipe.r_num})">
									</c:if>
								</div>
							</td>
						</tr>
						<!-- 좋아요, 댓글수, 공유하기 -->
						<tr>
							<td>
								<div style="margin: 3% 3%;">
									<div style="display: inline; position:absolute; left: 30px;">
										<%@ include file="include/viewHeart.jsp" %>&nbsp;
										<svg style="color: black;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-chat-right-dots" viewBox="0 0 16 16">
										  <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
										  <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
										</svg>
										<span id='recount-span'>${recount}</span>
									</div>
									<div style="display: inline; position:absolute; right: 30px;" onclick="clip(); return false;">
										<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" style="margin-bottom: 2px; color: #333333;" class="bi bi-box-arrow-up" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M3.5 6a.5.5 0 0 0-.5.5v8a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5v-8a.5.5 0 0 0-.5-.5h-2a.5.5 0 0 1 0-1h2A1.5 1.5 0 0 1 14 6.5v8a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 14.5v-8A1.5 1.5 0 0 1 3.5 5h2a.5.5 0 0 1 0 1h-2z"/>
										  <path fill-rule="evenodd" d="M7.646.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 1.707V10.5a.5.5 0 0 1-1 0V1.707L5.354 3.854a.5.5 0 1 1-.708-.708l3-3z"/>
										</svg>
									</div>
								</div>
							</td>
						</tr>
					</table> <!-- end content -->
					<!-- 댓글 영역 -->
					<div id="recipeReply"></div>
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
	<script src="/resources/public/js/profileModal.js?ver=4"></script>
</body>
</html>