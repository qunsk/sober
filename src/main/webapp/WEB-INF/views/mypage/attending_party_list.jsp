<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 헤더 -->
<%@ include file="../public/header.jsp" %>

<!-- 메인 -->
<div class="container-fluid mypage-main"></div>
<!-- 메인 첫번째 줄 -->
<div class="row">
   <!-- 왼쪽여백 -->
   <div class="col-lg-1"></div>
   <!-- /왼쪽여백 -->
   <!-- 마이페이지 내비게이션 -->
    <%@ include file="include/mypage_sidebar.jsp" %>
   <!-- /마이페이지 내비게이션 -->

   <!-- 메인컨텐츠 박스 -->
   <div class="col-lg-7 container-fluid">
      <div class="title_box medium" id="nav_active">참가중인 모임</div>
 		<br><br>
      <table class="table whitespace_box mino-alarm-table">
         <thead>
            <tr class="medium">
               <th>번호</th>
               <th width=60%>제목</th>
               <th>작성자</th>
               <th>조회수</th>
               <th>날짜</th>
            </tr>
         </thead>
		 <tbody>
			<c:set var="num" value="${pageMaker.total-((pageMaker.cri.pageNum-1)*pageMaker.cri.amount)}" />
            <c:forEach var="attend" items="${list}">
	            <tr>
	               <td>${attend.bo_num}</td>
	               <td><a href="/party_detailpage?bo_num=${attend.bo_num}">${attend.title}</a></td>
	               <td><span id="profile_modal" style="cursor: pointer;">${attend.nickname}</span></td>
	               <td>${attend.readcount}</td>
	               <td><fmt:formatDate value="${attend.reg_date}" pattern="yyyy-MM-dd"/></td>
	            </tr>
       	   </c:forEach>
		 </tbody>
      </table>

      <!-- 페이징 처리 -->
      <div>
          <ul class="pagination justify-content-center" style="margin-bottom:30px">
             <c:if test="${pageMaker.prev}">
                 <li class="page-item"><a class="page-link pagerfontcolor" 
                 href="attendingPartyList?pageNum=${pageMaker.startPage - 1}">Prev</a></li>
                 </c:if>
                 
                 <c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                     <c:if test="${pageMaker.cri.pageNum == i}" >
                        <li class="page-item" >
                        <a class="page-link pagerfontcolor" style="color:white!important;background-color:#828282!important">${i}</a>
                        </li>
                     </c:if>
                     <c:if test="${pageMaker.cri.pageNum != i}">
                        <li class="page-item"><a class="page-link pagerfontcolor" 
                        href="attendingPartyList?pageNum=${i}">${i}</a></li>
                     </c:if>
                 </c:forEach>
                 
                 <c:if test="${pageMaker.next}">
                 <li class="page-item"><a class="page-link pagerfontcolor" 
                 href="attendingPartyList?pageNum=${pageMaker.endPage + 1}">Next</a></li>
            </c:if>
         </ul>
      </div>
   </div>

   <!-- 오른쪽여백 -->
   <div class="col-lg-1"></div>
   <!-- /오른쪽여백 -->
</div>
<br />
<br />
<!--  end main -->

<%@ include file="../public/footer.jsp" %>

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




























