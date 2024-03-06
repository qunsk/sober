<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
.member_list_profile {
  width: 30px;
  height: 30px;
  border-radius: 50%;
}
.party_apply_tbl{
  margin:20px 0;
}
.party_apply_tbl thead{
  border:1px solid #D5D5D5;
  border-top:none;
  border-left:none;
  border-right:none;
  font-weight: normal;
}
.party_apply_button{
 border:1px solid #616161;
 color:#616161;
 border-radius: 4px;
 padding:2px 4px;
 background: white;
}
.party_apply_button:hover{
 color:white;
 background: #616161;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script><%-- jQuery CDN --%>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align=center>
 <c:if test="${ ! empty list }">
  <table class="party_apply_tbl">
     <thead>
     <tr>
      <th>닉네임</th>
      <th>신청 메세지</th>
      <th>신청일</th>
      <th></th>
     </tr>
     </thead>
     
     <tbody>
     <c:forEach var="mem" items="${list}">
       <tr>
        <td width="20%">
        <c:if test="${ ! empty mem.profile_img }">
		  <img class="member_list_profile" src="/resources/upload/mypage/${mem.profile_img}" alt="profile">
		  </c:if>
		  <c:if test="${ empty mem.profile_img }">
		  <img class="member_list_profile" src="/resources/fileupload/default.jpg" alt="profile">
		  </c:if>&nbsp;
		            <span id="profile_modal_span" style="cursor: pointer;" onclick="openProfilemodal('${mem.nickname}')">${mem.nickname}</span>
        </td>
        
        <td width="50%">
        ${mem.message}
        </td>
        
        <td width="15%">
        <fmt:formatDate value="${mem.apply_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
        </td>
        
        <td width="15%">
        <input type=button id="acc_bu_${mem.li_num}" class="party_apply_button" value="수락" onclick="accepted_update(${mem.li_num},'${mem.nickname}')">&nbsp;&nbsp; 
        <input type=button id="del_bu_${mem.li_num}" class="party_apply_button" value="거절" onclick="declined_delete(${mem.li_num},'${mem.nickname}')"> 
        </td>
     
       </tr>
     </c:forEach>
     </tbody>
  
  
  </table>
 </c:if>
 
  <c:if test="${ empty list }">
  
  <br><b>참가 신청한 유저가 존재하지 않습니다.</b> 
  </c:if> 
</div>




</body>
</html>