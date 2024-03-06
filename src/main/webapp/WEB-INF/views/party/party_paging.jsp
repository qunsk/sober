<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SOBER :: PARTY</title>

         
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function(){

    var isdeletedboard = '${isdeletedboard}';
    if(isdeletedboard=='isdeletedboard'){
    	alert("이미 삭제된 게시글입니다. ");
    }
	
	if($("#region_").val()!=""){
		var region =$.trim($("#region_").val()); 
		$('#region_sel option[value=\''+region+'\']').prop("selected",true);
	}

	$("#find_butt").click(function(){
		
		
	   if($.trim($("#keyword").val())==""){
		   alert("검색 키워드를 입력하세요.");
		   $("#keyword").focus();
		   return false;
	   }else{
		   var search = $("#search").val();
		   var keyword = $("#keyword").val();
		   var region = $("#region_").val()
	       location.href="party_paging?search="+search+"&keyword="+keyword+"&region="+region;
	   }
       
	});
	
	
	$("#region_sel").change(function(){
		var region = $("#region_sel").val();
		//location.href='party_paging?page=${paging.currentPage}&region='+region;
		location.href='party_paging?search=${search}&keyword=${keyword}&region='+region;
	});
	
	// 닉네임 클릭시 프로필 모달 요청 
	$("td #profile_modal").click(function(){
		 var nickname = $(this).text();
	     getProfile(nickname);
	});
	
	
	// 글작성 버튼 클릭시 인터셉터로 넘어가기전에 실행되는 것 
	$("#party_write_button").click(function(){
		if($("#session_nickname").val()==null || $("#session_nickname").val()==""){
		    var gowriteform = confirm("로그인 하셔야 이용할 수 있는 서비스입니다. \n로그인 화면으로 이동하시겠습니까? ");
		    if(gowriteform){
		    	location.href='/member/loginform';
		    }
		}else{
			location.href='partywriteform';
		}
		
	});
	
	
     
     //해당 닉네임의 프로필을 가져와서 로드한다. 
     function getProfile(nickname){
        $("#profileCardModal").load("mypage/getProfile?nickname="+nickname);
        openModal();
     }

     // 모달 영역
     function openModal() {
     const modal = document.querySelector('.modal');
     modal.style.display = 'block';
     }

});

function closeModal(){
    const modal = document.querySelector('.modal');
    modal.style.display = 'none';
    }
    
    
    
</script>
<style>
.region_badge{
               border:1px solid #B100A5!important;
               display:inline!important;
               background: white!important;
               color:#B100A5!important;
               font-size:10pt!important;
               padding:1px 5px!important;
               border-radius: 7px!important;
               margin-right:10px;
            }
.keyword_print_box{
   font-size:8pt;
   color:silver;
   margin-top:8px;
}

</style>
</head>
<body>


<!-- 프로필 모달 START -->
<div class="profileModal">
  <div class="profileModal_body">
     <div id="profileCardModal"></div>
     <button class="btn btn-outline-dark" onclick="closeModal()">닫기</button>
   </div>
</div>
<!-- 프로필 모달 END -->




   <input type=hidden value="${sessionScope.nickname }" id="session_nickname">



	<%@ include file="../public/header.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2 container">
				<div align="right" class="minimi board_category">Home > 파티게시판</div>
			</div>
			<!-- 좌측 빈 여백  -->

			
			
			<input type=hidden id="region_" value=${region }>
			
			
			
			<!-- 가운데 컨텐츠 들어가는 가운데 박스 시작 -->
			<div class="col-lg-8 container">
			
			 <!--  id=nav_active 가 빠지면 안됩니다. 헤더의 보라색 바를 표시하기 위한 id값입니다.  -->
                    <div class="title_box medium" id="nav_active">파티 게시판</div>
                    <br><br>
                    
                    
                    <!--  여기는 글작성 버튼과 지역 선택 select 있는 곳 -->
                    <table width=100%><tr>
                    <td width="50%">
                    <div align="left"><b>지역 필터 &nbsp;</b>
                    <select id="region_sel" name="region" class="form-control partyshortsel" style="width:140px;display:inline;">
                         <option value="">전국</option>
                         <option value="서울">서울</option>
                         <option value="인천">인천</option>
                         <option value="부산">부산</option>
                         <option value="대전">대전</option>
                         <option value="대구">대구</option>
                         <option value="울산">울산</option>
                         <option value="광주">광주</option>
                         <option value="제주특별자치도">제주특별자치도</option>
                         <option value="세종특별자치시">세종특별자치시</option>
                         <option value="경기">경기</option>
                         <option value="강원">강원</option>
                         <option value="충북">충북</option>
                         <option value="충남">충남</option>
                         <option value="경북">경북</option>
                         <option value="경남">경남</option>
                         <option value="전북">전북</option>
                         <option value="전남">전남</option>
                         
                    </select>
                    </div>
                    <div align=left class="keyword_print_box">
                    <c:if test="${!empty keyword and ! empty search }">
                    <a href="party_paging?page=${paging.currentPage}&region=${region}" style="text-decoration: none; color: #B100A5; font-weight: bold;">
                     <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" style="margin-bottom: 5px;" class="bi bi-arrow-counterclockwise" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z"/>
                        <path d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z"/>
                     </svg>&nbsp;검색 초기화</a>
                    </c:if>
                     
                     
                    </div>
                    </td>
                    <td width="50%">
                    <div class="write_box" align="right">
                        <div class="btn btn-outline-dark">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                        </svg> <span id="party_write_button"> 글작성</span>
                    </div>
                        <!-- <input type="text" size="30px">&nbsp;&nbsp;<input type=button value="검색"> -->
                    </div></td>
                    </tr></table>
                    <br>
                    
                    
                    
                    <c:if test="${! empty list }">
                    
                    <table class="table whitespace_box">
                      <thead>
                        <tr class="medium">
                          <th>번호</th>
                          <th width=60%>제목</th>
                          <th>작성자</th>
                          <th>조회수</th>
                          <th>작성일</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:set var="num" value="${paging.number}" />
                      <c:forEach var="i" items="${list}" >
                        <tr>
                          <td>${num}</td>
                          <td width=60% class=alignleft_box>
                          <div class="region_badge">${i.region}</div>
                          <a href='party_detailpage?bo_num=${i.bo_num}&page=${paging.currentPage}&search=${search}&keyword=${keyword}&region=${region}&nickname=${i.nickname}'
                          class="pagerfontcolor">${i.title}</a>
                          </td>
                          <td><span id="profile_modal" style="cursor: pointer;">${i.nickname}</span></td>
                          <td>${i.readcount}</td>
                          <td><fmt:formatDate value="${i.reg_date}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                        
                       <c:set var="num" value="${num-1}"/>
                       </c:forEach>
                      </tbody>
                    </table> 
                    
                    <ul class="pagination justify-content-center" style="margin-bottom:30px">
                      <!-- <li class="page-item disabled"><a class="page-link pagerfontcolor" href="#">Back</a></li>  -->
                      
                      
                      <c:if test="${paging.startPage>paging.block}">
                      <li class="page-item"><a class="page-link pagerfontcolor" 
                      href="party_paging?page=${paging.startPage-1}&search=${search}&keyword=${keyword}&region=${region}">Back</a></li>
                      </c:if>
                      
                      <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
                          <c:if test="${paging.currentPage == i}" >
                             <li class="page-item" >
                             <a class="page-link pagerfontcolor" style="color:white!important;background-color:#828282!important">${i}</a>
                             </li>
                          </c:if>
                          <c:if test="${paging.currentPage != i}">
                             <li class="page-item"><a class="page-link pagerfontcolor" 
                             href="party_paging?page=${i}&search=${search}&keyword=${keyword}&region=${region}">${i}</a></li>
                          </c:if>
                      </c:forEach>
                      
                      <c:if test="${paging.endPage<paging.pageCount}">
                      <li class="page-item"><a class="page-link pagerfontcolor" 
                      href="party_paging?page=${paging.endPage+1}&search=${search}&keyword=${keyword}&region=${region}">Next</a></li>
                      </c:if>
                      
                      
                    </ul>
                    
                    </c:if><!-- ! empty list -->
                    
                    <c:if test="${empty list and empty search}">
                    <br><br><br><br><br><div align=center>게시글이 존재하지 않습니다. </div><br><br><br><br><br><br>
                    </c:if>

                    <c:if test="${empty list and !empty search}">
                    <br><br><br><br><br><div align=center>검색하신 키워드에 해당하는 게시글이 존재하지 않습니다. </div><br><br><br><br><br><br>
                    </c:if>
                    
                    
                    <div class="search_box2">
                        <select id=search name=search >
                           <option value="nickname">작성자</option>
                           <option value="title">제목</option>
                           <option value="content">내용</option>
                           <option value="allsearch">제목 + 내용</option>
                        </select>&nbsp;&nbsp;
                        <input type="text" class="search_boxb" id="keyword" name="keyword" maxlength="30">&nbsp;&nbsp;
                        <input type=button value="검색" class="btn btn-outline-dark" id="find_butt">
                    </div>
			
			
			
			</div><!--  가운데 컨텐츠 들어가는 가운데 박스 끝 -->

         










		<!-- 우측 빈 여백 -->
		<div class="col-lg-2 container"></div>

	</div>
	<!-- end row -->

	</div>
	<!--  end main -->

	


	<%@ include file="../public/footer.jsp"%>
	
	<!-- 모달 관련 JS -->
	<script src="/resources/public/js/profileModal.js"></script>
	
	
	
</body>
</html>