<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<link rel="stylesheet" href="/resources/party/css/kakao.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/resources/party/css/maincss.css">

<%--버튼 css 가져옴. 사용 클래스 btn btn-outline-dark --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
   <script src="/resources/party/js/partywriteform.js?ver=71"></script> 


<meta charset="UTF-8">
<title>파티원 모집</title>
</head>
<body>
<input type=hidden value="${usergender}" id="usergender">
<input type=hidden value="${agegroup}" id="agegroup">
<input type=hidden value="${sessionScope.nickname}" id="usernickname">

<%@ include file="../public/header.jsp" %>


  <div id="hide_text_active"><div class="title_box medium" id="nav_active">파티 게시판</div></div>

  

  <div class="container-fluid">
        <div class="row">
           <div class="col-lg-2 container">
           <div align="right" class="minimi board_category">Home > 파티게시판</div>
           </div><!-- 좌측 빈 여백  -->

<div class="col-lg-8 container">
           

   <div class="main">
    <div align=center class=partywritecon>
   <form id="outerform" action="party_insert" method="post">
      <%-- 제목 --%>
      <div class="partywritecontent">
      <label for="title" class="category">제목</label>
      <input type=text class="form-control" id="title" name="title" maxlength="60">
      </div>
      
   
      <%-- 날짜 --%>
      <div class="partywritecontent">
      <label for="schedule" class="category">일정</label>
      <input type="date" class="form-control" id="schedule_" name="schedule_" style="width:200px !important">
      </div>
   
      <%-- 시간 --%>
      <div class="partywritecontent">
      <label for="hour" class="category">시간</label>
      <input type="time" class="form-control" id="hour" name="hour" style="width:200px !important">
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
      </div>
   
      <%-- 인원수 --%>
      <div class="partywritecontent">
      <label for="num_of_people" class="category">인원수</label>
      <input type="number" class="form-control" id="num_of_people" name="num_of_people" style="width:200px !important">
      <div id="num_err" style="border:none"></div>
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
      </div>
      
           <input type="button" id="outerformbutton" class="btn btn-outline-dark" value="작성"> 
           
           
           <input type="hidden" id="location" name="location">
           <input type="hidden" id="content" name="content">
           <input type="hidden" id="bar_name" name="bar_name">
           
   
   </form>
    
   
   
       <%--kakaomap 넣기 --%>
      <div class="partywritecontent" align="center">
          <script type="text/javascript" src='//dapi.kakao.com/v2/maps/sdk.js?appkey=${key}&libraries=services'></script>
          <div class="category" style="text-align:left;">모임 장소 선택</div><br>

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
             <br><input type="text" id="location_" class="form-control" name="location_">
             <input type="text" id="bar_name_" class="form-control" name="bar_name_" style="margin-top:7px">
             
             </div><!-- end partywritecontent -->  
      <script src="/resources/party/js/kakao.js"></script>
      
     
     
     
     
     
     
     
     
            <%-- 내용 --%>
      <div class="partywritecontent" style="border-bottom:none">
      <label for="content" class="category">모집 내용</label>
      <textarea rows="7" class="form-control" 
               placeholder="함께 나누고 싶은 대화 주제, 원하는 분위기의  칵테일 바 등 다양하게 적어보세요 !" maxlength="600"
                id="content_" name="content_"></textarea>
      <br><br><div align="center">
      <input type="button" value="작성" class="btn btn-outline-dark busize-up" id="submit-bu" ></div>
     
     
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