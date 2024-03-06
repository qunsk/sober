<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%@ include file="header.jsp" %>
	
	<!-- main START -->
	<div class="container-fluid sb-main">
			<div class="row" style="height:100px;"></div>
            <div class="row">
            	<div class="col-lg-1"></div>
            	<div class="col-lg-10 minomino" style="padding:0; font-size:0;">
            		<div style="background-image: url('/resources/public/img/searchImg5.png');" id="whichTable" data-table="0"></div>
            		<div style="background-image: url('/resources/public/img/searchImg3.png');" id="whichTable" data-table="1"></div>
            		<div style="background-image: url('/resources/public/img/searchImg1.png');" id="whichTable" data-table="2"></div>
            		<div style="background-image: url('/resources/public/img/searchImg2.png');" id="whichTable" data-table="3"></div>
            		<div style="background-image: url('/resources/public/img/searchImg4.png');" id="whichTable" data-table="5"></div>
            	</div>
            	<div class="col-lg-1"></div>
            </div>
            <div class="row" style="height:2px;"></div>
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-10 sb-main-mini-board" style="box-shadow: 4px -4px 10px #E8E8E8;">
                    <br />
                    <table style="width:100%;">
                        <thead>
                        	<tr>
								<th style="width: 8%">번호</th>
								<th style="width: 13%">게시판</th>
	                            <th style="width: 40%">제목</th>
	                            <th style="width: 10%">글쓴이</th>
	                            <th style="width: 10%">조회수</th>
	                            <th style="width: 12%">등록일자</th>                            
                            </tr>
                        </thead>
                        <tbody class="mino-main-table">
                       		<c:set var="num" value="${pageMaker.total-((pageMaker.cri.pageNum-1)*pageMaker.cri.amount)}" />
                        	<c:forEach var="list" items="${list}">
	                        	<tr>
	                                <td style="text-align:center; padding-top:10px;">${num}</td>
	                                <td style="text-align:center;">
	                                	<c:choose>
	                                		<c:when test="${list.table_name.equals('칵테일 게시판')}">
	                                			<span style="background-color:#76FEC0; color:white; border-radius:5px; padding:2px 6px; font-weight:bold;">${list.table_name}</span>
	                                		</c:when>
	                                		<c:when test="${list.table_name.equals('파티 게시판')}">
	                                			<span style="background-color:#F52E7F; color:white; border-radius:5px; padding:2px 6px; font-weight:bold;">${list.table_name}</span>
	                                		</c:when>
	                                		<c:when test="${list.table_name.equals('안주 게시판')}">
	                                			<span style="background-color:#E0DA1E; color:white; border-radius:5px; padding:2px 6px; font-weight:bold;">${list.table_name}</span>
	                                		</c:when>
	                                		<c:when test="${list.table_name.equals('공지사항')}">
	                                			<span style="background-color:#670FDF; color:white; border-radius:5px; padding:2px 6px; font-weight:bold;">${list.table_name}</span>
	                                		</c:when>
	                                	</c:choose>
	                                </td>
	                                <td  style="text-align:left;">
	                                	<a href="${list.uri}${list.pk_num}">${list.title}</a>
	                                </td>
	                                <td style="text-align:center;"><span id="profile_modal" style="cursor: pointer;">${list.nickname}</span></td>
	                                <td style="text-align:center;">${list.readcount}</td>
	                                <td style="text-align:center;"><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
	                            </tr>
								<c:set var="num" value="${num-1}" />	                           
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                
                <div class="row" style="height:50px;"></div>
	            <ul class="pagination justify-content-center" style="margin-bottom:30px">
		                 <!-- <li class="page-item disabled"><a class="page-link pagerfontcolor" href="#">Back</a></li>  -->
		                 
		                 
		                 <c:if test="${pageMaker.prev}">
		                 <li class="page-item"><a class="page-link pagerfontcolor" 
		                 href="/search?pageNum=${pageMaker.startPage - 1}&keyword=${pageMaker.cri.keyword}">Prev</a></li>
		                 </c:if>
		                 
		                 <c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		                     <c:if test="${pageMaker.cri.pageNum == i}" >
		                        <li class="page-item" >
		                        <a class="page-link pagerfontcolor" style="color:white!important;background-color:#828282!important">${i}</a>
		                        </li>
		                     </c:if>
		                     <c:if test="${pageMaker.cri.pageNum != i}">
		                        <li class="page-item"><a class="page-link pagerfontcolor" 
		                        href="/search?pageNum=${i}&keyword=${pageMaker.cri.keyword}">${i}</a></li>
		                     </c:if>
		                 </c:forEach>
		                 
		                 <c:if test="${pageMaker.next}">
		                 <li class="page-item"><a class="page-link pagerfontcolor" 
		                 href="/search?pageNum=${pageMaker.endPage + 1}&keyword=${pageMaker.cri.keyword}">Next</a></li>
		                 </c:if>
	              </ul>
                
                <div class="col-lg-1"></div>
            </div>
            
    <div class="row" style="height:50px;"></div>
    </div>
    <!-- main END -->
    
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

<script>
	
	$(document).ready(function(){
		
		$(".minomino #whichTable").on('click', function(){
			var table_num = $(this).data("table");
			var keyword = "${pageMaker.cri.keyword}";
			
			location.href = "/search?keyword="+keyword+"&table_num="+table_num;
			
		});		
		
		
	});
	
</script>


<%@ include file="footer.jsp" %>









