<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>SOBER :: ${food.title}</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/food/css/recipeForm.css">
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
<script src="resources/food/js/viewHeart.js?ver=1"></script>

<!-- 답글쓰기 이벤트 처리 -->
<script src="resources/food/js/comment.js"></script>

<script>


 $(document).ready(function() {
	
	var f_num = ${f_num};
	var receiver_nickname = '${food.nickname}';   // 게시물 작성자
	console.log(receiver_nickname);
	// DB에 저장된 댓글을 상세페이지로 load
	$("#foodReply").load("foodReplyList?f_num="+f_num+"&receiver_nickname=${food.nickname}");
	
		
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
 
 function del(f_num){
	 var chk = confirm("정말 삭제하시겠습니까?");
	 if(chk) {
		 location.href='foodDelete?f_num='+f_num;
		 alert("삭제 되었습니다.");
	 }
 }
 
</script>

<style>
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
				<div align="right" class="minimi board_category">Home > 안주게시판</div>
			</div>
			<!-- 좌측 빈 여백  -->

			<div class="col-lg-8 container">

				<!--  id=nav_active 가 빠지면 안됩니다. 헤더의 보라색 바를 표시하기 위한 id값입니다.  -->
				<div class="title_box" id="nav_active"
					style="visibility: hidden;">안주 게시판</div>

				<div class="td_line profile" align="center">
					<div align="left">
					 <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#B100A5" class="bi bi-chat-right-dots" viewBox="0 0 16 16">
      					<path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
       					<path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/> 
      				</svg>
					<span style="padding: 10px;" align="left"><b class="largesize" align="left">${food.title}</b></span>
					</div>
					<hr style="border:0; height:1px; background:#ccc;">
					<div align="left">
						<c:if test="${! empty userProfile }">
							<img class=userProfile_img src="/resources/upload/mypage/${userProfile}" alt="profile">
						</c:if>
						<td><span id="profile_modal" style="cursor: pointer; text-align:center;"><b>${food.nickname}</b></span></td>
						<br><br>
						<fmt:formatDate value="${food.reg_date}"
								pattern="yyyy.MM.dd"></fmt:formatDate>&nbsp;&nbsp; <img
							style="width: 25px; height: 25px; margin-bottom: 2px"
							src="/resources/food/img/read.png"> ${food.readcount}
					</div>

					<hr style="border:0; height:1px; background:#ccc;"><br>
					<div align="left">${food.content}</div>
					<br>
					<hr style="border:0; height:1px; background:#ccc;">
					<br>
					<div>
						<input type="button" class="btn btn-outline-dark" value="목록"
							onClick="location.href='foodList?pageNum=${pageNum}'">
					
						<c:if test="${sessionScope.nickname == food.nickname }">		
						<input type="button" class="btn btn-outline-dark" value="수정"
							onClick="location.href='foodUpdate?pageNum=${pageNum}&f_num=${food.f_num}'">
						<input type="button" class="btn btn-outline-dark" value="삭제" onClick="del(${food.f_num})">
						</c:if>
					</div>
					<br> <br> 
					<!-- 좋아요, 댓글수, 공유하기 -->
					<div style="margin: 3% 3%;">
						<div style="display: inline; position: absolute; left: 30px;">
							<%@ include file="include/viewHeart.jsp"%>&nbsp;
							<svg style="color: black;" xmlns="http://www.w3.org/2000/svg"
								width="25" height="25" fill="currentColor"
								class="bi bi-chat-right-dots" viewBox="0 0 16 16">
						<path
									d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z" />
						<path
									d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
				</svg>
							<span id='recount-span'>${recount}</span>
						</div>
						<div style="display: inline; position: absolute; right: 30px;"
							onclick="clip(); return false;">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
								fill="currentColor" style="margin-bottom: 2px; color: #333333;"
								class="bi bi-box-arrow-up" viewBox="0 0 16 16">
						<path fill-rule="evenodd"
									d="M3.5 6a.5.5 0 0 0-.5.5v8a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5v-8a.5.5 0 0 0-.5-.5h-2a.5.5 0 0 1 0-1h2A1.5 1.5 0 0 1 14 6.5v8a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 14.5v-8A1.5 1.5 0 0 1 3.5 5h2a.5.5 0 0 1 0 1h-2z" />
						<path fill-rule="evenodd"
									d="M7.646.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 1.707V10.5a.5.5 0 0 1-1 0V1.707L5.354 3.854a.5.5 0 1 1-.708-.708l3-3z" />
					</svg>
						</div>
					</div>
					<!-- 댓글 영역 -->
					<div id="foodReply"></div>
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
     <button onclick="closeModal()">닫기</button>
   </div>
</div>
<!-- 프로필 모달 END -->


<!-- 모달 관련 JS -->
<script src="/resources/public/js/profileModal.js?ver=4"></script>
</body>
</html>