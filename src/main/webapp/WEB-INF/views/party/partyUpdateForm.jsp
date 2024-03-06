<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<link rel="stylesheet" href="/resources/party/css/kakao.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/resources/party/css/maincss.css?ver=1">

<%--버튼 css 가져옴. 사용 클래스 btn btn-outline-dark --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
   <!-- <script src="/resources/party/js/partyupdateform.js?ver=1"></script>  
 -->

<meta charset="UTF-8">
<title>SOBER :: PARTY</title>
<script>
//주소 선택시 실행된다. 
function selected_lo(location,bar){
	if(${memCount}>1){
		
	  let loc = '${p.location}';
	  let spaceIndex = loc.indexOf(" "); // 첫 번째 띄어쓰기의 인덱스
	  let loclimit = loc.substring(0, spaceIndex);
	  
	  let newspaceIndex = location.indexOf(" "); // 사용자가 수정한 주소의 첫번째 띄어쓰기의 인덱스
	  let newloclimit = location.substring(0,newspaceIndex);

	  if(loclimit != newloclimit){
		  alert("참가 확정된 파티원이 있기 때문에 \n지역을 변경하실 수는 없습니다. ");
		  return false;
	  }
	}  
	  $("#location_").val(location).prop("readonly",true);
	  $("#bar_name_").val(bar).prop("readonly",true);
}	  

function validateNumOfPeople() {
	  if ($("#num_of_people").val() < 2) {
	    $("#num_err").html("인원수는 최소 2명으로 선택하세요.").css("color", "red").css("font-size", "10pt").css("font-weight", "bold");
	  } else {
	    $("#num_err").html("");
	  }
	  
	  if($("#num_of_people").val()<${memCount}){
		  $("#num_limit_msg").text("참가 확정된 파티원의 인원수보다 적은 인원수는 선택하실 수 없습니다. ").css("color", "red").css("font-size", "10pt").css("font-weight", "bold");
	  }else{
		  $("#num_limit_msg").text('');
	  }
	}

$(document).ready(function(){
	
	$("#kewordsearch").hide();
	  $("#outerformbutton").hide();
      $("#resetbut").hide();
	  
      $("#kewordsearch_").click(function(){
		  $("#keyword").val($("#keyword_").val());
		  $("#innerform").submit();
	  });
      
      
      // 지도에 기존 위치 검색하여 표기
      var loc_ = '${p.location}';
      var bar_ = '${p.bar_name}';
      $("#keyword").val(loc_+' '+bar_);
	  $("#innerform").submit();
      $("#keyword_").val(bar_);
      
      
      
      // 나이대를 바꾸려고 할 때 제한한다.
      
      
      
      
      
	  // 연령대를 가져와서 option값을 제한한다.
	  
      var isTrue = ${ ! empty age_limit };

      const select = document.querySelector('select');
      const options = select.querySelectorAll('option');
      var agegroup = $("#agegroup").val();
      
      //age = 25;
      var age_num = agegroup%10;
      
      var age_p = Math.floor(agegroup/10);
      
      var age_suf = '';
      
      if(age_num == 0){
  	    age_suf = '초반';  
      }else if(age_num == 5){
  	    age_suf = '중반';  
      }else if(age_num == 9){
  	    age_suf = '후반';  
      }
      
      
      if(isTrue){
    	  
    	  $("#age_limit_msg").text("참가 확정된 파티원의 나이에 의해 나이대 선택이 제한됩니다.  ").css("color","red").css("font-size","10pt").css("font-weight", "bold");    

    	  if(${age_limit==-1}){ // 좁은 범위
    		 console.log("-1");
    		  const optionValues = Array.from(options).map(option => option.value);
    	      for(let i=1; i < optionValues.length-1; i++){
    	  	    const val = options[i].value;
    	  	    if(val.length!=3 || val.substring(0,1)!=age_p){
    	  	  	  options[i].style.display='none';
    	  	    }
    	      }
    	  }else{ // 제일 좁은 범위
    		  console.log("10");
    		  const optionValues = Array.from(options).map(option => option.value);
    	      for(let i=1; i < optionValues.length-1; i++){
    	  	    const val = options[i].value;
    	  	  	  options[i].style.display='none';
    	      }
    	  }
    	  
      }else{
    	  
    	  console.log("5");
	      
	      const optionValues = Array.from(options).map(option => option.value);
	      for(let i=1; i < optionValues.length-1; i++){
	  	    const val = options[i].value;
	  	    if(val.substring(0,1)!=age_p){
	  	  	  options[i].style.display='none';
	  	    }
	  	    if(val.length==3 && val.substring(0,1)!=age_p){
	  	  	  options[i].style.display='none';
	  	    }
	  	    
	  	    if(val.length==6 && val.substring(4,6)!=age_suf){
	  	  	  options[i].style.display='none';
	  	    }
	  	    
	  	    
	      }
	      
    	  
      }
	  
	
      // 기존 모집 공고가 '성별 무관'인 경우, 그리고 참가 확정자들의 성별이 혼성인 경우는 남/여 체크를 disabled한다. 
      if('${p.gender}'=='irrelevant' && ${g_gender}==1){
    	  $('input[type="radio"][value="male"]').prop('disabled',true);
    	  $('input[type="radio"][value="female"]').prop('disabled',true);
    	  $('input[type="radio"][value="irrelevant"]').prop('checked',true);
    	  $("#limit_msg").text("참가 확정된 파티원의 성별이 다르기 때문에 남/여 선택이 불가능합니다. ").css("color","red").css("font-size","10pt").css("font-weight", "bold");
      }else{
    	  const radio = document.querySelectorAll('input[type=radio]');
    	  var radiochecked = '${p.gender}';
    	  for (let i = 0; i < radio.length; i++) {
    		  const val = radio[i].value;
    		  
    		  if (val != $("#usergender").val()) {
    			if(val != 'irrelevant'){  
    		    radio[i].setAttribute('disabled',true); 
    			}
    		 }
    		  
    		 if(val == radiochecked){
    		    radio[i].setAttribute('checked',true); 
    		 } 
    		  
    	 }	  
    	  
      }
	   
	

	  $("#num_of_people").on("change keyup", validateNumOfPeople);

 
	
	  
	  // submit 클릭시 모든 값 작성했는지 유효성 검사 실행
	  var doubleClick = false; // 전역 변수로 선언
	  $("#submit-bu").click(function(event){
		  
		  
		  
		  if (doubleClick) {
			    return false; // insert 동작 막기
			  } else {
			    // 코드 내용
			    doubleClick = true; // doubleClick 변수 갱신
		  
		  
		  
		  
		        var currentDate = new Date();
		        currentDate.setHours(0, 0, 0, 0); // 시간을 0으로 설정
                
		        var twoMonthsFromNow = new Date(currentDate.getFullYear(), currentDate.getMonth() + 2, currentDate.getDate());
		        twoMonthsFromNow.setHours(0, 0, 0, 0); // 시간을 0으로 설정
                
		        var inputDate = $("#schedule_").val(); // "yyyy-MM-dd" 형식의
		  	    										// String 값
		        var selectedDate = new Date(inputDate);
		        selectedDate.setHours(0, 0, 0, 0); // 시간을 0으로 설정
                
		        
		        doubleClick = false; // doubleClick 변수 갱신
		        
		        
		        if($.trim($("#title").val())==""){
		  	      alert("제목을 입력하세요.");
		  	      $("#title").focus();
		  	      return false;
		        }
		        
		        
		        if($("#title").val().length>60){
		  	      alert("제목은 띄어쓰기 포함 60자 이내로만 가능합니다. ");
		  	      return false;
		        }
		        
		        
		        if($("#schedule_").val()==""){
		  	      alert("모임 일정을 선택하세요. ");
		  	      return false;
		        }
		        
		        if(selectedDate>twoMonthsFromNow){
		  	        alert("모임 일정은 금일을 기준으로 2달 이내까지만 적용 가능합니다. ");
		  	        $("#schedule_").val("").focus();
		  	        return false;
		  	      }
                
		        if(selectedDate<currentDate){
		  	        alert("지난 날짜는 선택할 수 없습니다.  ");
		  	        $("#schedule_").val("").focus();
		  	        return false;
		  	      }
		        
		        if($("#hour").val()==""){
		  	      alert("모임 시간을 선택하세요.");
		  	      $("#hour").focus();
		  	      return false;
		        }
		        
		        
		        if($("#age_sel").val()==""){
		  	      alert("나이대를 선택하세요.");
		  	      $("#age_sel").focus();
		  	      return false;
		        }
		        
		        if($("#num_of_people").val()==""){
		  	      alert("모임 인원수를 입력하세요.");
		  	      $("#num_of_people").focus();
		  	      return false;
		        }
		        
		        if($("#num_of_people").val()<2){
		  	      alert("모임 인원수는 2명 이상부터 가능합니다. ");
		  	      $("#num_of_people").focus();
		  	      return false;
		        }
                
		        if($("#num_of_people").val()<${memCount}){
		  	      alert("참가 확정된 파티원의 인원수보다 적은 인원수는 선택하실 수 없습니다. ");
		  	      $("#num_of_people").focus();
                    return false;			  
		        }
		        
		        
		        if($("#num_of_people").val()>30){
		  	      alert("모임 인원수는 30명 이하만 선택 가능합니다. ");
		  	      $("#num_of_people").val("").focus();
		  	      return false;
		        }
		        
		        if($("input[type=radio]:checked").length<1){
		  	      alert("성별을 선택하세요.");
		  	      return false;
		        }
		        
		        if($.trim($("#location_").val())===""){
		  	      alert("모임 장소를 입력하세요.");
		  	      $("#keyword_").focus();
		  	      return false;
		        }else{
		  	      $("#location").val($("#location_").val());
		        }
		        
		        if($.trim($("#bar_name_").val())!=""){
		  	      $("#bar_name").val($("#bar_name_").val());
		        }
		        
		        
		        
		        if($.trim($("#content_").val())==""){
		  	      alert("모집 내용을 입력하세요. ");
		  	      $("#content_").focus();
		  	      return false;
		        }else{
		  	      $("#content").val($("#content_").val());
		        }
		        
		        
		        if($("#content_").val().length>1000){
		  	      alert("모집 내용은 띄어쓰기 포함 600자 이내로만 가능합니다. ");
		  	      return false;
		        }
		        
		        
		        
     	        
		        
     	        
     	        $("#outerform").submit();
		 
	      }
		  
		  
	  });
	  
	  
	  

	  
	  
});



</script>


</head>
<body>
<input type=hidden value="${usergender}" id="usergender">
<input type=hidden value="${agegroup}" id="agegroup">


<%@ include file="../public/header.jsp" %>


  <div id="hide_text_active"><div class="title_box medium" id="nav_active">파티 게시판</div></div>

  

  <div class="container-fluid">
        <div class="row">
           <div class="col-lg-2 container">
           <div align="right" class="minimi board_category">Home > 파티게시판 > </div>
           </div><!-- 좌측 빈 여백  -->
           
           
           

<div class="col-lg-8 container">
           

   <div class="main">
    <div align=center class=partywritecon>
   <form id="outerform" action="party_update" method="post">
   
   
      <%-- 글목록으로 이동하기 위한 변수들 모두 hidden으로 넘겨주기 --%>
      <input type="hidden" name="bo_num" value="${pageinf.bo_num}">
      <input type="hidden" name="page" value="${page}">
      <input type="hidden" name="search" value="${pageinf.search}">
      <input type="hidden" name="keyword" value="${pageinf.keyword}">
      <input type="hidden" name="region" value="${pageinf.region}">
      <input type="hidden" name="oldLocation" value="${p.location}">
      <input type="hidden" name="memCount" value="${memCount}">
      <input type="hidden" name="sender_nickname" value="${sessionScope.nickname}">
      
   
   
      <%-- 제목 --%>
      <div class="partywritecontent">
      <label for="title" class="category">제목</label>
      <input type=text class="form-control" id="title" name="title" 
            value="${p.title }" maxlength="60">
      </div>
      
   
      <%-- 날짜 --%>
      <div class="partywritecontent">
      <label for="schedule" class="category">일정</label>
      <input type="date" class="form-control" id="schedule_" name="schedule_" 
        value="${date }" style="width:200px !important">
      </div>
   
      <%-- 시간 --%>
      <div class="partywritecontent">
      <label for="hour" class="category">시간</label>
      <input type="time" class="form-control" id="hour" name="hour" 
         value="${time }"  style="width:200px !important">
      </div>
   
      <%-- 연령대 --%>
      <div class="partywritecontent">
      <label for="age" class="category">나이 제한</label>&nbsp;
       <select id="age_sel" name="age" class="form-control partyshortsel">
         <option value="">연령대 선택 </option>
            <option value="20대 초반" >20대 초반</option>
            <option value="20대 중반" >20대 중반</option>
            <option value="20대 후반" >20대 후반</option>
            <option value="20대" >20대</option>
            <option value="30대 초반" >30대 초반</option>
            <option value="30대 중반" >30대 중반</option>
            <option value="30대 후반" >30대 후반</option>
            <option value="30대" >30대</option>
            <option value="40대 초반" >40대 초반</option>
            <option value="40대 중반" >40대 중반</option>
            <option value="40대 후반" >40대 후반</option>
            <option value="40대" >40대</option>
            <option value="50대 초반" >50대 초반</option>
            <option value="50대 중반" >50대 중반</option>
            <option value="50대 후반" >50대 후반</option>
            <option value="50대" >50대</option>
            <option value="60대 이상" >60대 이상</option>
            <option value="나이 무관">나이 무관</option>
      </select>
      <div id="age_limit_msg"></div>
      </div>
   
      <%-- 인원수 --%>
      <div class="partywritecontent">
      <label for="num_of_people" class="category">인원수</label>
      <input type="number" class="form-control" id="num_of_people" 
          value="${p.num_of_people }" name="num_of_people" style="width:200px !important">
      <div id="num_err"></div>
      <div id="num_limit_msg"></div>
      </div>
      
      
      <%-- 성별 --%>
      <div class="partywritecontent">
         <span class="category">성별</span>
         <div class="genderbox">
             <label for="male">남&nbsp;</label>
             <input type=radio  value="male" id="male" name="gender" class="partyradio">&nbsp;&nbsp;&nbsp;&nbsp;
             <label for="female">여&nbsp;</label>
             <input type=radio value="female" id="female" name="gender" class="partyradio">&nbsp;&nbsp;&nbsp;&nbsp;
             <label for="irrelevant">성별무관&nbsp;</label>
             <input type=radio value="irrelevant" id="irrelevant" name="gender" class="partyradio">
         </div>
         <div id="limit_msg"></div>
      </div>
      
           <input type="button" id="outerformbutton" class="btn btn-outline-dark" value="작성"> 
           
           
           <input type="hidden" id="location" name="location">
           <input type="hidden" id="content" name="content">
           <input type="hidden" id="bar_name" name="bar_name">
   
   </form>
    
   
   
       <%--kakaomap 넣기 --%>
      <div class="partywritecontent" align="center">
          <script type="text/javascript" src='//dapi.kakao.com/v2/maps/sdk.js?appkey=${key}&libraries=services'></script>
          <div class="category" style="text-align:left;">모임 장소 선택</div>
          <br>

              <div class="map_wrap">
                    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

                    <div id="menu_wrap" class="bg_white">
                    <div class="option">
                         <div>
                     <form id="innerform" onsubmit="searchPlaces(); return false;"> 
                             <span>키워드</span> : <input type="hidden"  id="keyword" size="15">
                             <input type="text" placeholder="키워드 또는 상호명으로 검색" id="keyword_" size="23">
                             <button type="submit" id="kewordsearch">검색하기</button> 

                             <button type="button" class="btn btn-outline-dark sizedown" id="kewordsearch_">검색</button> 
                         </form>
                         </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
                  </div>
             </div> 
             
             
             
             <br><input type="text" id="location_" class="form-control" 
                name="location_" readonly="readonly" value="${p.location }">
             <input type="text" id="bar_name_" class="form-control" name="bar_name_" 
                 readonly="readonly" value="${p.bar_name }" style="margin-top:7px">
             
            
             
             
             
             </div><!-- end partywritecontent -->  
      <script src="/resources/party/js/kakao.js?ver=1"></script>
      
     
     
     
            <%-- 내용 --%>
      <div class="partywritecontent" style="border-bottom:none">
      <label for="content" class="category">모집 내용</label>
      <textarea rows="7" class="form-control" 
               placeholder="함께 나누고 싶은 대화 주제, 원하는 분위기의  칵테일 바 등 다양하게 적어보세요 !" maxlength="600"
                id="content_" name="content_">${p.content }</textarea>
      <br><br><div align="center">
      <input type="button" value="수정" class="btn btn-outline-dark busize-up detailbu" id="submit-bu" >
      <input type="button" value="다시 작성" class="btn btn-outline-dark busize-up detailbu" onclick="location.reload()">
      <input type="button" value="취소" class="btn btn-outline-dark busize-up detailbu" onclick="history.go(-1)"> 
      </div>
       
     
      </div>
      </div>
      
      
      </div>
   
   
   
   
   </div>
   

   <div class="col-lg-2 container">
           </div><!-- 우측 빈 여백 -->
        
      </div><!-- end row -->
        
   </div><!--  end main -->
   




<%@ include file="../public/footer.jsp" %>

</body>
</html>