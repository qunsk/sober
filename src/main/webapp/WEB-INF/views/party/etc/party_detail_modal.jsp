<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%-- 모달창을 만들어봅ㅈ시다.. --%>

    
    <div class="modal">
      <div class="modal_body" align=center>파티원 목록
    
        <div id="party_member_list_box" align=center></div>
    
        <c:if test="${ empty isAttending and p.nickname != sessionScope.nickname }"> <!--  현재 접속중인 유저가 참가하지 않은 상태라면 아래 버튼을 띄운다.  -->       
        <input type="button" value="참가 신청" id="innerjoin_button" class="btn btn-outline-dark busize-up detailbu" onclick="par_member_check(${p.bo_num},'${sessionScope.nickname}')">
        </c:if>     
        <c:if test="${ ! empty isAttending and p.nickname != sessionScope.nickname }"> <!--  현재 접속중인 유저가 참가하지 않은 상태라면 아래 버튼을 띄운다.  -->       
        <input type="button" value="참가 취소" class="btn btn-outline-dark busize-up detailbu" onclick="par_member_cancel(${p.bo_num},'${sessionScope.nickname}')">
        </c:if>     
	    <input type="button" value="닫기" class="btn btn-outline-dark busize-up detailbu" onclick="closeModal()">
    
    
      </div>
    </div>
    
    
    
    <%-- 참가신청시 띄우는 모달창입니다용 --%>
   
    <div class="joinmodal">
      <div class="joinmodal_body" align=center>파티원 신청하기<br><br><br>
         
        <div id="party_member_join_box" align=center>
        <textarea rows="6" class="form-control" 
               placeholder="간단한 파티원 신청 메세지를 남겨보세요 !&#10;최대 100자까지 작성가능합니다." maxlength="100"
                id="message" name="message"></textarea>
        </div> 
             <input type="button" value="참가신청" class="btn btn-outline-dark busize-up detailbu" onclick="submitjoin('${p.nickname}')">

	    <input type="button" value="닫기" class="btn btn-outline-dark busize-up detailbu" onclick="closejoinModal()">
    
    
      </div>
    </div>   <!--  모달 영역 끝  -->
     


    <%-- 원문 작성자가 확인하는 참가자 리스트 모달창 --%>
   
     <div class="applymodal">
      <div class="applymodal_body" align=center>파티원 참가 대기자 리스트 <br><br>
        <div id="party_apply_box" align=center>
         
        </div> 
	    <input type="button" value="닫기" class="btn btn-outline-dark busize-up detailbu" onclick="closeApplyModal()">
    
    
      </div>
    </div>   <!--  모달 영역 끝  -->



    <%-- 프로필 카드 모달 --%>
    <div class="profileModal">
      <div class="profileModal_body">
         <div id="profileCardModal"></div>
         <button id="profileModalCloseBtn" onclick="closeProfileModal()" class="btn btn-outline-dark">닫기</button>
      </div>
   </div>


</body>
</html>