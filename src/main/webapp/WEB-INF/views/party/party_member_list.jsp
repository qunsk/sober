<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<style>
.member_list_profile {
  width: 30px;
  height: 30px;
  border-radius: 50%;
}
.party_list_tbl{
  margin:20px 0;
}


}

</style>

 <meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<div align=center>
	<table class="party_list_tbl">
		
		<tbody>
		<c:forEach var="mem" items="${memlist}">
		<tr>
		  <td width=90% style="text-align:left!important;">
		  <c:if test="${ ! empty mem.profile_img }">
		  <img class="member_list_profile" src="/resources/upload/mypage/${mem.profile_img}" alt="profile">
		  </c:if>
		  <c:if test="${ empty mem.profile_img }">
		  <img class="member_list_profile" src="/resources/fileupload/default.jpg" alt="profile">
		  </c:if>
		  <!-- <span id="profile_modal" style="cursor: pointer;">${mem.nickname }</span> !-->
		  <span id="profile_modal_span" style="cursor: pointer;" onclick="openProfilemodal('${mem.nickname}')">${mem.nickname }</span>
		    <c:if test="${mem.isLeader == 'y' }">		    
		    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#B100A5" class="bi bi-award" viewBox="0 0 16 16">
            <path d="M9.669.864 8 0 6.331.864l-1.858.282-.842 1.68-1.337 1.32L2.6 6l-.306 1.854 1.337 1.32.842 1.68 1.858.282L8 12l1.669-.864 1.858-.282.842-1.68 1.337-1.32L13.4 6l.306-1.854-1.337-1.32-.842-1.68L9.669.864zm1.196 1.193.684 1.365 1.086 1.072L12.387 6l.248 1.506-1.086 1.072-.684 1.365-1.51.229L8 10.874l-1.355-.702-1.51-.229-.684-1.365-1.086-1.072L3.614 6l-.25-1.506 1.087-1.072.684-1.365 1.51-.229L8 1.126l1.356.702 1.509.229z"/>
            <path d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z"/>
            </svg>
		    </c:if>  
		  </td>
		  <td>
		  <c:if test="${sessionScope.nickname != mem.nickname }">
		   <a id="message-icon" href="${mem.nickname}">
		   <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="silver" class="bi bi-envelope" viewBox="0 0 16 16">
           <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
           </svg>
		   </a>
		  </c:if>
		  </td>
		</tr>
		</c:forEach>
		</tbody>

	</table>
	<script src="http://code.jquery.com/jquery-latest.js"></script>	
	<script>
		$(document).ready(function(){
			$("td #message-icon").on('click', function(e){
				e.preventDefault();
				var sendTo = $(this).attr("href");
				
				var popupX = ((window.screen.width-500)/2);
	        	var popupY = ((window.screen.height-620)/2);
				window.open("/mypage/sendMessage?sendTo="+sendTo, "쪽지보내기", "resizeable=no, location=0, status=0, width=500, height=620, left="+popupX+", top="+popupY);
			});
			
			
		});
	</script>	
</div>		
</body>
</html>