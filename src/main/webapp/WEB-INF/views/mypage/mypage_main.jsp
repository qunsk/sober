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
                <div class="mypage-title">마이페이지</div>

                <div class="row mypage-content">
                    <hr />

                    <div class="container-fluid ">
                        <div class="row profile-box">
                            <div class="card mb-3" style="padding:0">
                                <div class="profile-background">
                                    <c:if test="${!empty profile.profile_img}">
					             	 	<img src="/resources/upload/mypage/${profile.profile_img}" class="card-img-top sb-profile-img" alt="...">
					             	 </c:if>
					             	 <c:if test="${empty profile.profile_img}">
					             	 	 <img src="/resources/mypage/img/sober_profile_img.png" class="card-img-top sb-profile-img" alt="...">
					             	 </c:if>
                                    <div class="keyword">
                                    	<c:forEach var="keyword" items="${keywords}">
                                    		<span>#${keyword}</span>
                                    	</c:forEach>
                                    </div>
                                </div>
                                <!-- card-body start -->
                                <div class="card-body">
                                  <h5 class="card-title sb-card-title">${profile.nickname}</h5>
                                  <p class="card-text" style="font-size: 16pt; font-family: Noto Sans KR; font-style:italic;">
                                  	"${profile.intro.replaceAll("\\n", "<br>")}"
                                  </p>
                                  <div class="row profile-detail justify-content-md-center">
                                	<c:set var="column" value="${profileMaker.column}"/>
                                	<c:set var="data" value="${profileMaker.data}"/>
                                	<!-- <div class="vline"></div> -->
                                  	<c:forEach var="showYN" items="${profileMaker.showYN}" varStatus="status">
                                  		<c:if test="${showYN}">
                                  			<div class="col-lg-2">
		                                        <div class="profile-column" style="font-family: 'Roboto Mono, monospace'; font-size: 11pt">${column[status.index]}</div>
		                                        <div class="profile-data" style="font-family: 'Roboto Mono, monospace'; font-size: 11pt">${data[status.index]}</div>
                                    		</div>
                                    		<!-- <div class="vline"></div> -->
                                  		</c:if>
                                  	</c:forEach>
                                  </div>
                                  <!-- card-body end -->
                                <br>
                                <p class="card-text">
	                                <small class="text-muted">
	                                	<c:if test="${!empty profile.insta}">
	                                		<a href="https://www.instagram.com/${profile.insta}/" target="blank" style="color:black">
	                                			<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
	                                    		<path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
	                                			</svg>
	                                		</a>&nbsp;&nbsp;&nbsp;
	                                	</c:if>
	                                	<c:if test="${!empty profile.facebook}">
	                                		<a href="https://www.facebook.com/${profile.facebook}/" target="blank" style="color:black">
			                                	<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
			                                    <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
			                                	</svg>
			                                </a>
		                                </c:if>
	                                </small>
                                </p>
                                
                            </div>
                        </div>
                        </div>
                    </div>
					
					<!-- 모임 일정 달력 START -->
					<div class="row">
						<div class="col-1"></div>
						<div class="col-10">
							<table id="calendar" class="calender-table" style="width: 100%; height:500px;">
						        <thead style="height:200px;">
						            <tr>
						                <th><input name="preMon" type="button" value="<"></th>
						                <th colspan="5" class="year_mon"></th>
						                <th><input name="nextMon" type="button" value=">"></th>
						            </tr>
						            <tr>
						                <th style="color: red;">SUN</th>
						                <th>MON</th>
						                <th>TUE</th>
						                <th>WED</th>
						                <th>THU</th>
						                <th>FRI</th>
						                <th>SAT</th>
						            </tr>
						        </thead>
						        <tbody>
						        </tbody>
						    </table>
					    </div>
					    <div class="col-1"></div>
					</div>
					<!-- 모임 일정 달력  END -->
					
					<div class="row" style="height:120px;"></div>
					<div style="font-size: 26px; font-weight:bold; text-align:center;">활동내역</div>
                    <div class="row" style="height:50px;"></div>
                    <div style="font-size: 18px; font-weight:bold;">
                    	<a href="activeList?whichActive=myPost">&nbsp;&nbsp;<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16">
  									<path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/>
									</svg>&nbsp;&nbsp;내가 쓴 게시물
						</a>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 mypage-activity">
                            <table style="width:100%">
                                <thead>
                                	<tr>
                                		<th style="width:20%">게시판</th>
	                                    <th style="width:40%">제목</th>
	                                    <th style="width:20%">글쓴이</th>
	                                    <th style="width:20%">작성날짜</th>
                                	<tr>
                                </thead>
                                <tbody>
                                	<c:choose>
                                		<c:when test="${empty MyPostList}">
                                			<tr>
                                				<th colspan="4">활동 내역이 없습니다.</th>
                                			</tr>
                                		</c:when>
                                		<c:otherwise>
                                			<c:forEach var="active" items="${MyPostList}">
		                                    	<tr>
		                                    		<td style="text-align:center;">${active.table_name }</td>
			                                    	<td><a href="${active.table_url}${active.pk_num}" style="color:black;">${active.title}</a></td>
			                                    	<td><span id="profile_modal" style="cursor: pointer; text-align:center;">${active.nickname}</span></td>
			                                    	<td style="text-align:center;"><fmt:formatDate value="${active.regdate}" pattern="yyyy-MM-dd"/></td>
		                                    	</tr>
		                                    </c:forEach>
                                		</c:otherwise>
                                	</c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    <div class="row" style="height:35px;"></div>
                    <div style="font-size: 18px; font-weight:bold;">
                    	<a href="activeList?whichActive=myLike">&nbsp;&nbsp;<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chat-square-heart" viewBox="0 0 16 16">
									 <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12ZM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2Z"/>
									 <path d="M8 3.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
									</svg>&nbsp;&nbsp;좋아요 누른 게시물
                    	</a>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 mypage-activity">
                            <table style="width:100%">
                                <thead>
                                	<tr>
	                                    <th style="width:20%">게시판</th>
	                                    <th style="width:40%">제목</th>
	                                    <th style="width:20%">글쓴이</th>
	                                    <th style="width:20%">작성날짜</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:choose>
                                		<c:when test="${empty MyLikePostList}">
                                			<tr>
                                				<th colspan="4">활동 내역이 없습니다.</th>
                                			</tr>
                                		</c:when>
                                		<c:otherwise>
                                			<c:forEach var="active" items="${MyLikePostList}">
		                                    	<tr>
			                                    	<td style="text-align:center;">${active.table_name }</td>
			                                    	<td><a href="${active.table_url}${active.pk_num}" style="color:black;">${active.title}</a></td>
			                                    	<td><span id="profile_modal" style="cursor: pointer; text-align:center;">${active.nickname}</span></td>
			                                    	<td style="text-align:center;"><fmt:formatDate value="${active.regdate}" pattern="yyyy-MM-dd" /></td>
		                                    	</tr>
		                                    </c:forEach>
                                		</c:otherwise>
                                	</c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    <div class="row" style="height:35px;"></div>
                    <div style="font-size: 18px; font-weight:bold;">
                    	<a href="activeList?whichActive=myReply">&nbsp;&nbsp;<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
								  <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
								  <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
								</svg>&nbsp;&nbsp;댓글 단 게시물
                    	</a>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 mypage-activity">
                            <table style="width:100%">
                                <thead>
                                	<tr>
	                                    <th style="width:20%">게시판</th>
	                                    <th style="width:40%">제목</th>
	                                    <th style="width:20%">글쓴이</th>
	                                    <th style="width:20%">작성날짜</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:choose>
                                		<c:when test="${empty MyReplyList}">
                                			<tr>
                                				<th colspan="4">활동 내역이 없습니다.</th>
                                			</tr>
                                		</c:when>
                                		<c:otherwise>
                                			<c:forEach var="active" items="${MyReplyList}">
		                                    	<tr>
			                                    	<td style="text-align:center;">${active.table_name }</td>
			                                    	<td><a href="${active.table_url}${active.pk_num}" style="color:black;">${active.title}</a></td>
			                                    	<td><span id="profile_modal" style="cursor: pointer; text-align:center;">${active.nickname}</span></td>
			                                    	<td style="text-align:center;"><fmt:formatDate value="${active.regdate}" pattern="yyyy-MM-dd"/></td>
		                                    	</tr>
		                                    </c:forEach>
                                		</c:otherwise>
                                	</c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    
                </div>
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
        	
    /* 마이페이지에서 프로필 수정 버튼 눌렀을 때 페이지 이동 */
    $("#modifyProfile").on('click', function(){
    	self.location = "modifyProfile";
    });
    
    
    /* 달력 관련 JQUERY FIRST */
    $(document).ready(function(){
    	
        var today = new Date();
        var date = new Date();           

        $("input[name=preMon]").click(function() { // 이전달
            $("#calendar > tbody > td").remove();
            $("#calendar > tbody > tr").remove();
            today = new Date ( today.getFullYear(), today.getMonth()-1, today.getDate());
            buildCalendar();
        })
        
        $("input[name=nextMon]").click(function(){ //다음달
            $("#calendar > tbody > td").remove();
            $("#calendar > tbody > tr").remove();
            today = new Date ( today.getFullYear(), today.getMonth()+1, today.getDate());
            buildCalendar();
        })


        function buildCalendar() {
            
            nowYear = today.getFullYear();
            nowMonth = today.getMonth();
            firstDate = new Date(nowYear,nowMonth,1).getDate();
            firstDay = new Date(nowYear,nowMonth,1).getDay(); //1st의 요일
            lastDate = new Date(nowYear,nowMonth+1,0).getDate();

            if((nowYear%4===0 && nowYear % 100 !==0) || nowYear%400===0) { //윤년 적용
                lastDate[1]=29;
            }

            $(".year_mon").text(nowYear+"년 "+(nowMonth+1)+"월");

            for (i=0; i<firstDay; i++) { //첫번째 줄 빈칸
                $("#calendar tbody:last").append("<td></td>");
            }
            for (i=1; i <=lastDate; i++){ // 날짜 채우기
                plusDate = new Date(nowYear,nowMonth,i).getDay();
                if (plusDate==0) {
                    $("#calendar tbody:last").append("<tr class='sb-week'></tr>");
                }
                $("#calendar tbody:last").append("<td class='date' id='sb-date"+i+"' style='text-align: center; height:50px; vertical-align : top;'>"+ i +"</td>");
            }
            if($("#calendar > tbody > td").length%7!=0) { //마지막 줄 빈칸
                for(i=1; i<= $("#calendar>tbody>td").length%7; i++) {
                    $("#calendar tbody:last").append("<td></td>");
                }
            }
            $(".date").each(function(index){ // 오늘 날짜 표시
                if(nowYear==date.getFullYear() && nowMonth==date.getMonth() && $(".date").eq(index).text()==date.getDate()) {
                    $(".date").eq(index).addClass('colToday');
                }
            })
            checkSchedule(nowYear, nowMonth);
        }
        
        function checkSchedule(nowYear, nowMonth){
            $.ajax({
				type : "get",
				url : "/mypage/chekSchedule.json",
				datatype : "JSON",
				data : {year : nowYear, month : nowMonth},
				success : function(obj){
					console.log(obj);
					console.log($.type(obj));
					$.each(obj, function(index, item){
						$("#sb-date"+item.party_date).append("<br><a href='/party_detailpage?bo_num="+item.bo_num+"' style='background-color:#99008E; color:white; border-radius:5px; padding: 3px 5px; font-weight:bold; margin-top:5px;'><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-calendar-check' viewBox='0 0 16 16'><path d='M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z'/><path d='M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z'/></svg>약속</a>");
					});
				}
			});
        }
        
        buildCalendar();
		
        

    });
    /* 달력 관련 JQUERY END */
    
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








