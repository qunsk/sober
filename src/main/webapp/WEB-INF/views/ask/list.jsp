<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- 헤더 -->
<%@ include file="../public/header.jsp"%>

<!-- 메인 -->
<style>
  /* 게시판 */
  .table {
    width: 100%;
    margin-bottom: 1rem;
    color: #212529;
  }

  .table th,
  .table td {
    padding: 0.75rem;
    vertical-align: top;
    border-top: 1px solid #dee2e6;
  }

  .table thead th {
    vertical-align: bottom;
    border-bottom: 2px solid #dee2e6;
  }

  .table tbody+tbody {
    border-top: 2px solid #dee2e6;
  }

  .table-sm th,
  .table-sm td {
    padding: 0.3rem;
  }
  
  /* 페이징처리 */
  .pagination .page-item.active .page-link {
    background-color: #495057;
    border-color: #000000;
    color: #ffffff;
  }

  .pagination .page-item .page-link {
    color: #808080;
  }
</style>

<div class="container-fluid mypage-main">
   <!-- 메인 첫번째 줄 -->
   <div class="row">
      <!-- 왼쪽여백 -->
      <div class="col-lg-1"></div>
      <!-- /왼쪽여백 -->
      <!-- 마이페이지 내비게이션 -->
      <%@ include file="../mypage/include/mypage_sidebar.jsp"%>
      <!-- /마이페이지 내비게이션 -->


      <!-- 메인컨텐츠 박스 -->
      <div class="col-lg-7 container-fluid" style="text-align: center;">
         <h1>1:1 문의</h1>
         <br> <br>

         <div style="text-align:right;">총 ${total}건의 게시물</div>
         <div style="text-align: left;">
            <select id="sel" style="display: inline-block;">
               <option value="desc">최신순</option>
               <option value="asc">오래된순</option>
            </select>
               </div>

         <form action="askRegister" method="get" style="text-align: right;">
    <button type="submit" class="btn btn-outline-dark"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
        </svg>글쓰기</button>
</form>


         <table class="table table-hover">
            <thead>
               <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>날짜</th>
               </tr>
            </thead>
            <tbody>
               <c:set var="num" value="${total-(pageNum-1)*10}"/>
               <c:forEach var="ask" items="${list}">
                  <tr>
                     <td style="text-align: center;">${num}</td>
                     <td><a href="askGet?pageNum=${pageNum}&ask_no=${ask.ask_no}">1:1문의
                           합니다.</a></td>
                     <td>${ask.nickname}</td>
                     <td>${ask.ask_date}</td>
                  </tr>
                  <c:set var="num" value="${num-1}"/>
               </c:forEach>
            </tbody>
         </table>
         <br>
         
         

         <!-- 페이징 처리 -->
         <div>
            <ul class="pagination justify-content-center">
               <c:set var="endPage"
                  value="${Math.round(Math.ceil(pageNum/10.0)*10)}" />
               <c:set var="startPage" value="${endPage - 9}" />
               <c:set var="realEnd" value="${Math.ceil(total/10.0)}" />

               <c:if test="${realEnd < endPage}">
                  <c:set var="endPage" value="${realEnd}" />
               </c:if>

               <c:if test="${startPage != 1}">
                  <li class="page-item"><a class="page-link"
                     href="askList2?pageNum=${startPage-1}&orderBy=${sort}">prev</a></li>
               </c:if>

               <c:forEach var="num" begin="${startPage}" end="${endPage}">
                  <li class="page-item <c:if test='${pageNum eq num}'>active</c:if>">
                     <a class="page-link" href="askList2?pageNum=${num}&orderBy=${sort}">${num}</a>
                  </li>
               </c:forEach>

               <c:if test="${endPage != realEnd}">
                  <li class="page-item"><a class="page-link"
                     href="askList2?pageNum=${endPage+1}&orderBy=${sort}">next</a></li>
               </c:if>
            </ul>
         </div>
      </div>
   </div>
   <!-- 메인컨텐츠 박스 -->

      <!-- 오른쪽여백 -->
      <div class="col-lg-1"></div>
      <!-- /오른쪽여백 -->
   </div>
   <br />
   <br />

   <!--  end main -->

   <!-- script는 여기에! -->
   <!-- 글 최신순, 오래된순 정렬 -->
   <script>
  
  $(document).ready(function(){
     
     $("#sel").change(function(){
        var orderBy = $("#sel").val();
        
        location.href="askList2?orderBy="+orderBy;
     });
     
     var selectedOption = "${sort}";

       // Check if the selectedOption value is not empty
       if (selectedOption !== "") {
         // Find the option element with the matching value attribute
         var optionToSelect = $("select option[value='" + selectedOption + "']");

         // Set the selected attribute on the option
         optionToSelect.prop("selected", true);
       }
  });
  
  
</script>


<%@ include file="../public/footer.jsp" %>