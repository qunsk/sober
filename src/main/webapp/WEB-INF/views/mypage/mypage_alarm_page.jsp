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
            	<div class="title_box medium" id="nav_active">알림</div>
                <br><br>
	           	<table class="table whitespace_box mino-alarm-table">
	           		<thead>
                        <tr class="medium">
                          <th>번호</th>
                          <th width=60%>알림 내용</th>
                          <th>날짜</th>
                          <th>삭제</th>
                        </tr>
                      </thead>
	                 <tbody>
		                 <c:set var="num" value="${pageMaker.total-((pageMaker.cri.pageNum-1)*pageMaker.cri.amount)}" />
		                 <c:forEach var="alarm" items="${alarmList}" >
			                   <tr>
			                     <td>${num}</td>
			                     <td width=60% class="alignleft_box" id="alarm-row">
			                     <a href='${alarm.table_url}${alarm.board_pk}'
			                     	class="pagerfontcolor"
			                     	data-alarm="${alarm.alarm_num}" 
			                     	data-idx="${alarm.table_url =='/mypage/readReceiveMessage?message_num='? 'alarm-to-message':''}"
			                     	style="${alarm.read_yn.equals('N')? 'font-weight:bold':'color:red'}">
			                     	[${alarm.sender_nickname}]${alarm.comment_msg}
			                     </a>
			                     </td>
			                     <td><fmt:formatDate value="${alarm.happen_time}" pattern="yyyy-MM-dd" /></td>
			                     <td>
			                     	<form action="/mypage/deleteAlarm" method="post">
			                     		<input type="hidden" name="alarm_num" value="${alarm.alarm_num}">
			                     		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			                     		<button class="btn btn-outline-dark" id="alarm-delete-btn">삭제</button>
			                     	</form>
			                     </td>
			                   </tr>
		                  <c:set var="num" value="${num-1}"/>
		                  </c:forEach>
	                 </tbody>
	           </table> 
	               
	               <ul class="pagination justify-content-center" style="margin-bottom:30px">
	                 <!-- <li class="page-item disabled"><a class="page-link pagerfontcolor" href="#">Back</a></li>  -->
	                 
	                 
	                 <c:if test="${pageMaker.prev}">
	                 <li class="page-item"><a class="page-link pagerfontcolor" 
	                 href="alarmList?pageNum=${pageMaker.startPage - 1}">Prev</a></li>
	                 </c:if>
	                 
	                 <c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                     <c:if test="${pageMaker.cri.pageNum == i}" >
	                        <li class="page-item" >
	                        <a class="page-link pagerfontcolor" style="color:white!important;background-color:#828282!important">${i}</a>
	                        </li>
	                     </c:if>
	                     <c:if test="${pageMaker.cri.pageNum != i}">
	                        <li class="page-item"><a class="page-link pagerfontcolor" 
	                        href="alarmList?pageNum=${i}">${i}</a></li>
	                     </c:if>
	                 </c:forEach>
	                 
	                 <c:if test="${pageMaker.next}">
	                 <li class="page-item"><a class="page-link pagerfontcolor" 
	                 href="alarmList?pageNum=${pageMaker.endPage + 1}">Next</a></li>
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
   	
    $("#alarm-row a").on('click', function(e){
    	e.preventDefault();
    	
    	$.ajax({
			type : "post",
			url : "/mypage/readAlarm",
			data : {alarm_num : $(this).data("alarm")},
			success : function(data){
				console.log(data);
			},
			error : function(error){
				console.log('짜증나');
			}
		});
    	
    	var toWhere = $(this).attr("href");
    	var toHow = $(this).data("idx");
    	if(toHow == 'alarm-to-message'){
    		var popupX = ((window.screen.width-600)/2);
    	   	var popupY = ((window.screen.height-400)/2);
        	window.open(toWhere, "쪽지함", "resizeable=no, location=0, status=0, width=600, height=400, left="+popupX+", top="+popupY);
    	}else{
    		location.href=toWhere;
    	}	
    });
    
    /* $("#alarm-delete-btn").on('click', function(e){
    	$.ajax({
			type : "post",
			url : "/mypage/deleteAlarm",
			data : {alarm_num : $(this).data("alarm")},
			success : function(data){
				console.log(data);
			},
			error : function(error){
				console.log('짜증나');
			}
		});
    }); */
       
</script>

<%@ include file="../public/footer.jsp" %>







