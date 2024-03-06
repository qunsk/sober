<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<%--버튼 css 가져옴. 사용 클래스 btn btn-outline-dark --%>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> 
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
  
<link rel="stylesheet" href="/resources/public/css/paging_page.css"> 
<link rel="stylesheet" href="/resources/party/css/maincss.css?ver=1">

<style>
#alert-container {
  position: fixed;
  width:100%;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 9999;
  text-align: center!important;
  display:none;
}
.alert{
  opacity: 70%;
  padding: 45px 0px!important;
}
</style>



 <script src="http://code.jquery.com/jquery-latest.js"></script>
<script>


$(document).ready(function(){
	
	
	
	
	var bo_num = ${p.bo_num};

	getMemNum(); 
	
	
	
	isClose(bo_num);
	
	/* 여기는 원문 댓글 다는 js 입니다. 이걸 json으로 변경할 예정. 이건 페이지 자체를 로드하는 코드임. */
	//$("#reply_list_print").load("party_re_list?bo_num="+bo_num);
	$("#reply_list_print").load("party_re_list?bo_num="+bo_num);
	
	
	
	var doubleClick = false;
	$("#re_insert").click(function(){
		

		if(doubleClick){
             return false;			
		}else{
			
			    doubleClick = true;
			
		
		        if($.trim($("#content").val())==""){
		        	alert("댓글을 입력하세요 !");
		        	$("#content").focus();
		        	doubleClick = false
		        	return false;
		        }
		        
		        // 댓글을 insert 시킵니다. 
		        var ser = $("#reply_form").serialize();
		        
		        $.post("re_insert",ser).done(function(data){
                  	$("#reply_list_print").html(data); 
                  	$("#content").val("");
		        	console.log("party_detail.jsp 댓글 달기 클릭시 - 댓글 리스트 다시 가져옴");
		        	doubleClick = false
		        	
		        }).fail(function(){
		        	console.log("party_detail.jsp 댓글 달기 클릭시 - 댓글 리스트 insert/가져오기 실패");
		        });
		
		}
		
	}); 
	
	

	
});
// 파티일정이 마감된건지 확인하는 함수 
function isClose(bo_num){
	$.ajax({
		type:'get',
		url:'partyCloseCheck',
		data:{'bo_num':bo_num},
		success : function(data){
			if(data!=1){
				$("#alert-container").fadeIn("slow");
				$("#party_buttoncontainer").hide();
			}else{
				$("#alert-container").hide();
				$("#party_buttoncontainer").show();
			}
		},
		fail:function(){
			console.log("ajax요청 실패");
		}
		
	});
	
	
	
}


// 여기는 닉네임 클릭시 프로필 모달 뜨게하는 영역
function openProfilemodal(nickname){
	getProfile(nickname);
}



//해당 닉네임의 프로필을 가져와서 로드한다. 
function getProfile(nickname){
   $("#profileCardModal").load("mypage/getProfile?nickname="+nickname);
   openProfileModal();
}

// 모달 영역
function openProfileModal() {
const modal = document.querySelector('.profileModal');
modal.style.display = 'block';
}



function closeProfileModal(){
const modal = document.querySelector('.profileModal');
modal.style.display = 'none';
}
















// 파티원 정원 수를 업데이트하는 함수
// 현재 파티원 인원수를 party_member_list에서 bo_num을 가지고 구해옴

function getMemNum(){
    var bo_num = ${p.bo_num};
    var limit = ${p.num_of_people };
    
	$.post('party/getParty_member_num',{'bo_num':bo_num}).done(function(result){
		var number = parseInt(result);
		$("#num_limit_").html(number);
		$("#party_member_num").val(number);
		console.log("party_detail.jsp post 성공. 파티원 인원수 가져와서 html로 삽입");
		
		if(number >= limit){
			$("#join_button").hide();
			$("#innerjoin_button").hide();
			$("#closed_board_box").css("display","inline");

			// 여기서 원문작성자에게 알림을 보낸다.
		    var nickname = '${p.nickname}';
	     	$.post('sendCapacityFullAlert',{'board_pk':bo_num,'receiver_nickname':nickname}).done(function(msg){
		    	if(msg=='change'){
			        console.log('정원이 꽉 찼음을 알리는 알림을 insert 성공');
			    }else{
			        console.log('정원 꽉 찼음을 알리는 알림 ㄴ ㄴ');
	    		}
	    	}).fail(function(){
		    	console.log('정원이 꽉 찼음을 알리는 알림을 insert 실패 !!!!!!!!!!');
		});
		}else{
			$("#closed_board_box").css("display","none");
		}
		
		
	}).fail(function(){
		console.log("post 비동기 통신 실패;;;");
	});
	
}



//모달 띄우기 전에 파티 리스트 가져오기
function getMemberList(bo_num){
	$("#party_member_list_box").load("getPartyMemberList?bo_num="+bo_num);
	openModal();
}



// 모달 영역
function openModal() {
    const modal = document.querySelector('.modal');
    modal.style.display = 'block';
}

function closeModal(){
    const modal = document.querySelector('.modal');
    modal.style.display = 'none';
}



   
   
// 여기는 참가신청시 뜨는 모달창--------------------------------------

//우선 조건이 만족되는지 체크
function par_member_check(bo_num,nickname){
   closeModal(); //기존에 떠있던 모달은 닫아버린다. 
   	
   
   var date = '${p.schedule}'.substring(0,10);
   var data = {
		     'bo_num': bo_num,
		     'nickname': nickname,
		     'receiver_nickname': '${p.nickname}',
		     'date': date
		   };
         
   
		 $.ajax({
		   url: "party_member_join_check",
		   type: "POST",
		   data: data,
		   dataType: "text",
		   contentType: "application/x-www-form-urlencoded; charset=UTF-8"  //여기랑 컨트롤러 둘다 한글인코딩해야 msg가 안깨짐(filter에 안걸러지나봄)
		 }).done(function(msg) {
		   if (msg == "true") { //조건이 되면 신청 모달을 띄운다. 
		  	 openJoinModal();
		  	 
		   } else {
		     alert(msg); //조건이 안되면 메세지를 띄운다. 
		   }
		 }).fail(function(jqXHR, textStatus, errorThrown) {
		   console.log("member_check 요청 실패: " + textStatus + ", " + errorThrown);
		 });
   
}

// 조건이 만족된다면 참가신청 모달을 띄운다. 
function openJoinModal() {
const modal = document.querySelector('.joinmodal');
modal.style.display = 'block';
}


function closejoinModal(){
	const modal = document.querySelector('.joinmodal');
	modal.style.display = 'none';
}   
  
  
  
  
  
// 최종 참가신청 버튼 클릭시 insert 한다. 
var joinClick = false; // 전역 변수로 선언 
function submitjoin(receiver){
	
	//("disable",true); 
	
	 if (joinClick) {
      return false; // insert 동작 막기
    } else {
	
    joinClick = true; // doubleClick 변수 갱신
	
	if($("#message").val()==""){
		alert("참가 신청 메세지를 간단하게 작성해주세요 !");
		$("#message").focus();
		joinClick = false; // doubleClick 변수 갱신
		return false;
	}
	
	var data = "message="+$("#message").val()+"&bo_num="+${p.bo_num}+"&nickname="+'${sessionScope.nickname}'+"&receiver_nickname="+receiver;
	$.post("par_mem_apply_insert",data).done(function(msg){
		alert(msg);
		location.reload();
		joinClick = false; // doubleClick 변수 갱신
	}).fail(function(jqXHR, textStatus, errorThrown){
		 console.log("파티원 신청 insert 요청 실패: " + textStatus + ", " + errorThrown);
	}) 
	
	
    }
	//doubleClick = false;
}

// 참가 취소시 ----------------------------------
var cancelClick = false;
function par_member_cancel(bo_num,nickname){
	

	if (cancelClick) {
	      return false; // insert 동작 막기
	    } else {
	    	
	    	cancelClick = true;
	
	
	
	var status = '${isAttending}';
	var isTrue = false;
	if(status == 'pending'){
		if(confirm("현재 참가 대기중입니다. 정말로 참가 취소하시겠습니까? ")){
			isTrue = true;
		}
	}else{
		if(confirm("현재 참가 예약되어 있습니다. 정말로 참가 취소하시겠습니까? ")){
			isTrue = true;
		}
			
	}
	
	if(isTrue){
		var data = "&bo_num="+${p.bo_num}+"&nickname="+'${sessionScope.nickname}';
		$.post("par_mem_cancel",data).done(function(msg){
			alert(msg);
			location.reload();
			cancelClick = false;
		}).fail(function(jqXHR, textStatus, errorThrown){
			 console.log("파티원 신청 insert 요청 실패: " + textStatus + ", " + errorThrown);
			 cancelClick = false;
		}) 
	}
	
	
	    }
	
	
	
}


// 여기는 원문작성자가 확인하는 참가 대기 명단 뿌리는 모달 ----------------------------------
function getapplicants(bo_num){
	// 우선 ajax로 명단 로드먼저하고 오픈해야함
	$("#party_apply_box").load("get_party_apply_list?bo_num="+bo_num);
	openApplyModal();
}

//조건이 만족된다면 참가신청 모달을 띄운다. 
function openApplyModal() {
const modal = document.querySelector('.applymodal');
modal.style.display = 'block';
}


function closeApplyModal(){
	const modal = document.querySelector('.applymodal');
	modal.style.display = 'none';
}   
  


// 참가 리스트 수락 버튼 클릭시 실행됨
var acceptClick = false;
function accepted_update(li_num,nickname){
	
	if (acceptClick) {
	      return false; // insert 동작 막기
	    } else {
	    	
	    	acceptClick = true;
	    	
	var sender_nick = '${sessionScope.nickname}';
	var bo_num = ${p.bo_num};
	var member_num = ${p.num_of_people};
	var mem_num = $("#party_member_num").val();
	
	if(member_num <= mem_num){
		alert("파티원 정원이 모두 찼기 때문에 신청을 수락할 수 없습니다.  ");
	    acceptClick = false;
		return false;
	}
	
	
	
	$.post("accepted_update",{"li_num":li_num,"receiver_nickname":nickname,"board_pk":bo_num,"sender_nickname":sender_nick}).done(function(){
	    alert("파티원 신청을 수락하셨습니다. ");
		getMemNum();
		
		$("#party_apply_box").load("get_party_apply_list?bo_num="+bo_num);
		acceptClick = false;
	}).fail(function(){
		console.log("party_appply_list.jsp에서 accepted_update 함수 실패.");
		acceptClick = false;
	});
	
	
   }
	    //	doubleClick = false;
}

// 참가 리스트 거절 버튼 클릭시 실행됨
var declClick = false;
function declined_delete(li_num,nickname){
	
	
	if (declClick) {
	      return false; // insert 동작 막기
	    } else {
	    	
	    	declClick = true;
	
	var delcall = confirm('거절하시면 다시 수락하실 수 없습니다.\n거절하시겠습니까?');
	var bo_num = ${p.bo_num};
	var sender_nickname = '${sessionScope.nickname}';
	    if(delcall){
	        $.post("declined_delete",{"li_num":li_num,"receiver_nickname":nickname,"board_pk":bo_num,"sender_nickname":sender_nickname}).done(function(){
	  	         alert("파티원 신청을 거절하셨습니다. ");
	         	$("#party_apply_box").load("get_party_apply_list?bo_num="+bo_num);
	         	declClick = false;
	         });
         }
	
	 }
}

var parCancelClick = false;
function parboard_delete(bo_num){
	
	if (parCancelClick) {
	      return false; // insert 동작 막기
	    } else {
	    	
	    	parCancelClick = true;
	
	      if(confirm("파티 취소시 게시글도 함께 삭제됩니다. \n정말 삭제하시겠습니까?")){
	         location.href="parboarddelete?bo_num="+bo_num+"&nickname="+'${sessionScope.nickname}';
	         parCancelClick = false;
	       }else{
	    	   parCancelClick = false;
	       }
	    }
}


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


function parboard_update(bo_num){
	//var data = "page="+${page}+"&search="+${pageinf.search}+"&keyword="+${pageinf.keyword}+"&region="+${pageinf.region}+"&bo_num="+bo_num;
	var data = "page=${page}&search=${pageinf.search}&keyword=${pageinf.keyword}"
	           +"&region=${pageinf.region}&bo_num="+bo_num+"&memCount="
	           +$("#party_member_num").val();
	
	location.href="/partyboardUpdate?"+data;
}







</script>

<meta charset="UTF-8">
<title>SOBER :: ${p.title }</title>
</head>
<body>
<body>


<div id="alert-container" >
   <div class="alert alert-secondary alert-dismissible alertmystyle">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
      <strong style="font-size:14pt!important;font-color:#474747;">모집 마감된 게시글입니다</strong>.
   </div>
</div>





<%@ include file="../public/header.jsp" %>



          <!--  이 값은 헤더에 홈 링크 아래 보라색 바를 넣기 위한 코드입니다.(hide로 숨겨놨습니다.) -->
  <div id="hide_text_active"><div class="title_box medium" id="nav_active">파티 게시판</div></div>
  
  
  <!--  ajax로 가져온 현재 파티원 수를 저장한다.  -->
  <input type=hidden id="party_member_num">
  
  
  
           
  <div class="container-fluid">
        <div class="row">
           <div class="col-lg-2 container">
           <div align="right" class="minimi board_category">Home > 파티게시판</div>
           </div><!-- 좌측 빈 여백  -->
           
           
           
           

<div class="col-lg-8 container">
           

   <div class="main">
    <div align=center class=partywritecon>
      
      <%-- 제목 --%>
      <div class="partywritecontent">
      <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#B100A5" class="bi bi-chat-right-dots" viewBox="0 0 16 16">
       <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
       <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/> 
      </svg>&nbsp;&nbsp;&nbsp;
      <span class="category" style="font-size:16pt;">${p.title }</span>
      <div class="closed_board" id="closed_board_box">모집 마감</div>
      </div>
      <div class="partywritecontent">
      <table width="100%">
      <tr>
      <td width="50%" align="left" style="padding:0px;">
      <%-- 제목 앞에 붙는 닉네임과 프로필 사진 --%>
      <div class="profile-wrapper">
        <c:if test="${ ! empty p.profile_img }">
        <img class="member_profile" src="/resources/upload/mypage/${p.profile_img}" alt="profile">
        </c:if>
        <c:if test="${ empty p.profile_img }">
        <img class="member_profile" src="/resources/fileupload/default.jpg" alt="profile">
        </c:if>
        <div align=left><span class="category" id="profile_modal_span" style="cursor: pointer;" onclick="openProfilemodal('${p.nickname}')">${p.nickname }</span>
        <br><span class="minimi"><fmt:formatDate value="${p.reg_date }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></span>
        <br><span class="minimi">조회수 &nbsp;${p.readcount }</span></div>
      </div>
      </td><td width="50%" align="right">
      
      <a href="/party_paging?page=${page}&search=${pageinf.search}&keyword=${pageinf.keyword}&region=${pageinf.region}">목록</a>
      </td></tr>
      </table>
      </div>
      <br><br><br>

      <span class="category">모집 조건</span>
      <div class="par_detail_box">
      <table>
      <tr>
         <td width=90px style="text-align:left">
         <b>일정</b> 
         </td>
         <td><fmt:formatDate value="${p.schedule }" pattern="yyyy-MM-dd  EEE요일"/></td>
      </tr>
      <tr>
         <td width=90px style="text-align:left">
         <b>시간</b> 
         </td>
         <td><fmt:formatDate value="${p.schedule }" pattern="HH:mm"/></td>
      </tr>
      <tr>
         <td width=90px style="text-align:left">
         <b>연령대</b> 
         </td>
         <td>${p.age }</td>
      </tr>
      <tr>
         <td width=90px style="text-align:left">
         <b>정원</b> 
         </td>
       <!--   <td><span id="num_limit_"></span>  / ${p.num_of_people }</td>  -->
         <td><span id="num_limit_"></span> / ${p.num_of_people }</td>
      </tr>
      <tr>
         <td width=90px style="text-align:left">
         <b>성별</b> 
         </td>
         <td>${p.gender }</td>
      </tr>
      </table>
      
      </div>
      <br><br><br>
     
     
     <span class="category">모집 내용</span>
      <div class="par_detail_box par_detail_con">
      ${p.content } 
      </div>
      <br><br><br>
   
   
   
      <span class="category">모임 장소</span>
      <div class="par_detail_box">
      <table>
      <tr>
         <td width=90px style="text-align:left">
         <b>주소</b> 
         </td>
         <td>${p.location }</td>
      </tr>
      <tr>
         <td width=90px style="text-align:left">
         <b>상호명</b> 
         </td>
         <td>${p.bar_name }</td>
      </tr>
      </table>
      </div>

      <div id="locationbox" >
      <input type="hidden" id="location_" value="${p.location}">
      <input type="hidden" id="bar_name_" value="${p.bar_name}">
      <!-- kakao 지도 시작 -->
      <div align=center style="margin-top:30px;">
      <p style="margin-top:-12px">
       <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
        </a>
       </em>
     </p>
     <div id="map" style="width:80%;height:300px;"></div>
     </div>
         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${key}&libraries=services"></script>
         <script src="/resources/party/js/detail_kakaomap.js"></script>
     
      </div>
      
   
   <div class="partywritecontent" style="border-bottom:none;"></div>
     
     
     <div id="party_buttoncontainer">
         <c:if test="${sessionScope.nickname == p.nickname }">
            <div align="center">
            <input type="button" id="par_mem_list" value="파티원 리스트" class="btn btn-outline-dark busize-up detailbu" onclick="getMemberList(${p.bo_num})">
            <input type="button" id="join_list_button" value="참가 신청 확인" class="btn btn-outline-dark busize-up detailbu" onclick="getapplicants(${p.bo_num})">
            <input type="button" id="update_button" value="일정 변경" class="btn btn-outline-dark busize-up detailbu" onclick="parboard_update(${p.bo_num})">
            <input type="button" id="cancel_button" value="모임 취소" class="btn btn-outline-dark busize-up detailbu" onclick="parboard_delete(${p.bo_num})">
            </div>
         </c:if>
         
         <c:if test="${! empty sessionScope.nickname and sessionScope.nickname != p.nickname }">
            <div align="center">
            <input type="button" id="par_mem_list" value="파티원 리스트" class="btn btn-outline-dark busize-up detailbu" onclick="getMemberList(${p.bo_num})">
              <c:if test="${ empty isAttending}"> <!--  현재 접속중인 유저가 참가하지 않은 상태라면 아래 버튼을 띄운다.  -->
                <input type="button" id="join_button" value="참가 신청 " class="btn btn-outline-dark busize-up detailbu" onclick="par_member_check(${p.bo_num},'${sessionScope.nickname}')">
              </c:if>
              <c:if test="${ ! empty isAttending}"> <!--  현재 접속중인 유저가 참가하지 않은 상태라면 아래 버튼을 띄운다.  -->
                <input type="button" id="joincancel_button" value="참가 취소 " class="btn btn-outline-dark busize-up detailbu" onclick="par_member_cancel(${p.bo_num},'${sessionScope.nickname}')">
              </c:if>
            </div>
         </c:if>
      </div>
      
        
   <div class="partywritecontent" style="border-bottom:none;"></div>



   <!--  댓글 영역  -->
   <div class="partywritecontent" style="padding:0px!important;margin-top:20px;">
    
    <!--  로그인 한 경우 -->
    <c:if test="${! empty sessionScope.nickname }">
    <table style="width:100%;">
    <tr>    
    <td style="width:50%;text-align: left;">
    <c:if test="${ ! empty userProfile }">
    <img class="member_profile pro_mini" src="/resources/upload/mypage/${userProfile }" alt="profile">&nbsp;&nbsp;&nbsp;
    </c:if>
    <c:if test="${ empty userProfile }">
    <img class="member_profile pro_mini" src="/resources/upload/mypage/default.jpg" alt="profile">&nbsp;&nbsp;&nbsp;
    </c:if>
    
    <span class="category">${sessionScope.nickname}</span>
    </td>
    <td style="width:50%;">
    <div style="text-align:right;">
    <a href="#" onclick="clip(); return false;">
      <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#ccc" style="margin-bottom: 2px; color: #333333;"
                        class="bi bi-box-arrow-up" viewBox="0 0 16 16">
      <path fill-rule="evenodd" d="M3.5 6a.5.5 0 0 0-.5.5v8a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5v-8a.5.5 0 0 0-.5-.5h-2a.5.5 0 0 1 0-1h2A1.5 1.5 0 0 1 14 6.5v8a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 14.5v-8A1.5 1.5 0 0 1 3.5 5h2a.5.5 0 0 1 0 1h-2z" />
      <path fill-rule="evenodd" d="M7.646.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 1.707V10.5a.5.5 0 0 1-1 0V1.707L5.354 3.854a.5.5 0 1 1-.708-.708l3-3z" />
      </svg>
    </a>
    </div>
    </td>
    </tr>
    </table><br>
    
    <form id="reply_form" >
    <input type=hidden name="receiver" value="${p.nickname}">
    <input type=hidden name="nickname" value="${sessionScope.nickname }">
    <input type=hidden name="bo_num" value="${p.bo_num}">
    <textarea class="form-control retextbox reply_box" rows="5" id="content" name="content" placeholder="댓글을 입력해보세요 !" maxlength="600"></textarea>
    <div align=right><input type=button class="btn btn-outline-dark busize-down" id="re_insert" value="댓글"></div>
    </form>
    
    </c:if>
    <br>
    <!--  로그인 한 경우 end -->
    
    
    
    <!--  로그인하지 않은 경우 -->
    <c:if test="${empty sessionScope.nickname }">
    <textarea class="form-control retextbox reply_box" rows="5" placeholder="로그인 하셔야 이용 가능합니다. " disabled="disabled"></textarea>
    </c:if>
    <!--  로그인하지 않은 경우 end -->
     
     
   
   </div><!--  댓글 영역 끝  -->
   
   
    <!--  댓글 리스트를 출력하는 공간. load로 불러옵니다.  --> 
     <div class="partywritecontent" style="border-bottom:none;padding-top:0px;">
            <div id="reply_list_print" style="padding-left:20px;padding-rigth:20px;">
            </div>
            
     </div><!--  댓글 리스트 출력 공간 end -->
   
   
   
   
   
   
   
   
   
   
   </div> <!-- end partywritecon --> <!-- 모든 콘텐츠는 이 태그 내에서만 작성 -->
   </div><!--  end main class  -->
   
   
   
   
   
   
   </div>
   

   <div class="col-lg-2 container">

  </div><!-- 우측 빈 여백 -->
        
        
        </div><!-- end row -->
    </div> <!--  end container-fluid -->
    
    
      <!--  모달 영역 -->
  <%@ include file='etc/party_detail_modal.jsp' %>   
   
    
    
    
    



<%@ include file="../public/footer.jsp" %>



</body>
</body>
</html>