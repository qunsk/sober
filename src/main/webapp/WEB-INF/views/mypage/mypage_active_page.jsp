<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
    
<!-- 헤더 -->
<%@ include file="../public/header.jsp" %>



    <!-- 메인 -->
    <div class="container-fluid mypage-main">
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
            	<div>
            		<select id="whichActive" name="whichActive">
            			<option id="myPost" value="myPost" ${whichActive == 'myPost'? 'selected':''}>내가 쓴 게시물</option>
            			<option id="myLike" value="myLike" ${whichActive == 'myLike'? 'selected':''}>좋아요 누른 게시물</option>
            			<option id="myReply" value="myReply" ${whichActive == 'myReply'? 'selected':''}>댓글 단 게시물</option>
            		</select>
            	</div>
            	<div class="title_box medium" id="nav_active">활동내역</div>
                <br><br>
	           	<table class="table whitespace_box mino-alarm-table">
	           		<thead>
                        <tr class="medium">
                          <th>번호</th>
                          <th>게시판</th>
                          <th width=60%>제목</th>
                          <th>글쓴이</th>
                          <th>작성날짜</th>
                        </tr>
                      </thead>
	                 <tbody>
		                 <c:set var="num" value="${pageMaker.total-((pageMaker.cri.pageNum-1)*pageMaker.cri.amount)}" />
		                 <c:forEach var="active" items="${list}" >
			                   <tr>
			                     <td>${num}</td>
			                     <td>${active.table_name}</td>
			                     <td width=60% class="alignleft_box" id="alarm-row">
			                    	 <a href='${active.table_url}${active.pk_num}' class="pagerfontcolor">${active.title}</a>
			                     </td>
			                     <td><span id="profile_modal" style="cursor: pointer;">${active.nickname}</span></td>
			                     <td><fmt:formatDate value="${active.regdate}" pattern="yyyy-MM-dd" /></td>
			                   </tr>
		                  <c:set var="num" value="${num-1}"/>
		                  </c:forEach>
	                 </tbody>
	           </table> 
	               
	               <ul class="pagination justify-content-center" style="margin-bottom:30px">
	                 <!-- <li class="page-item disabled"><a class="page-link pagerfontcolor" href="#">Back</a></li>  -->
	                 
	                 
	                 <c:if test="${pageMaker.prev}">
	                 <li class="page-item"><a class="page-link pagerfontcolor" 
	                 href="activeList?pageNum=${pageMaker.startPage - 1}&whichActive=${whichActive}">Prev</a></li>
	                 </c:if>
	                 
	                 <c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                     <c:if test="${pageMaker.cri.pageNum == i}" >
	                        <li class="page-item" >
	                        <a class="page-link pagerfontcolor" style="color:white!important;background-color:#828282!important">${i}</a>
	                        </li>
	                     </c:if>
	                     <c:if test="${pageMaker.cri.pageNum != i}">
	                        <li class="page-item"><a class="page-link pagerfontcolor" 
	                        href="activeList?pageNum=${i}&whichActive=${whichActive}">${i}</a></li>
	                     </c:if>
	                 </c:forEach>
	                 
	                 <c:if test="${pageMaker.next}">
	                 <li class="page-item"><a class="page-link pagerfontcolor" 
	                 href="activeList?pageNum=${pageMaker.endPage + 1}&whichActive=${whichActive}">Next</a></li>
	                 </c:if>
	                 
	                 
	               </ul>
            </div>
            <!-- 메인컨텐츠 박스 -->

            <!-- 오른쪽여백 -->
            <div class="col-lg-1"></div>
            <!-- /오른쪽여백 -->
        </div>
        <br /><br />
    </div>
    <!--  end main -->

	<script>
		$(document).ready(function(){
			$("#whichActive").on('change', function(e){
				location.href='activeList?pageNum=1&whichActive='+$(this).val();
			});
		});
	</script>

<%@ include file="../public/footer.jsp" %>

<!-- 프로필 모달 START -->
<div class="profileModal">
  <div class="profileModal_body">
     <div id="profileCardModal"></div>
     <button onclick="closeModal()" class="btn btn-outline-dark">닫기</button>
   </div>
</div>
<!-- 프로필 모달 END -->


<!-- 모달 관련 JS -->
<script src="/resources/public/js/profileModal.js?ver=4"></script>






