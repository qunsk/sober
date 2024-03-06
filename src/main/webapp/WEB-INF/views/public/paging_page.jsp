<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <title>쓰벌</title>
  
</head>

<body>

  <%@ include file="header.jsp" %>

  <div class="container-fluid">
        <div class="row">
           <div class="col-lg-2 container">
           <div align="right" class="minimi board_category">Home > 파티게시판</div>
           </div><!-- 좌측 빈 여백  -->
           
           
           
           <div class="col-lg-8 container">
           
                    <!--  id=nav_active 가 빠지면 안됩니다. 헤더의 보라색 바를 표시하기 위한 id값입니다.  -->
                    <div class="title_box medium" id="nav_active">파티 게시판</div>
                    <div class="write_box" align="right">
                        <input type="button" class="btn btn-outline-dark" value="글작성" onclick="location.href='partywriteform'">
                        <!-- <input type="text" size="30px">&nbsp;&nbsp;<input type=button value="검색"> -->
                    </div>
   
                    <table class="table whitespace_box">
                      <thead>
                        <tr class="medium">
                          <th>번호</th>
                          <th width=60%>제목</th>
                          <th>작성자</th>
                          <th>조회수</th>
                          <th>댓글수</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>1</td>
                          <td width=60% class=alignleft_box>제목부분입니다. </td>
                          <td>안농앙농</td>
                          <td>0</td>
                          <td>12</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td width=60% class=alignleft_box>제목부분입니다. </td>
                            <td>안농앙농</td>
                            <td>0</td>
                            <td>12</td>
                          </tr>
                          <tr>
                            <td>3</td>
                            <td width=60% class=alignleft_box>제목부분입니다. </td>
                            <td>안농앙농</td>
                            <td>0</td>
                            <td>12</td>
                          </tr>
                          <tr>
                            <td>4</td>
                            <td width=60% class=alignleft_box>제목부분입니다. </td>
                            <td>안농앙농</td>
                            <td>0</td>
                            <td>12</td>
                          </tr>
                          <tr>
                            <td>5</td>
                            <td width=60% class=alignleft_box>제목부분입니다. </td>
                            <td>안농앙농</td>
                            <td>0</td>
                            <td>12</td>
                          </tr>
                          <tr>
                            <td>6</td>
                            <td width=60% class=alignleft_box>제목부분입니다. </td>
                            <td>안농앙농</td>
                            <td>0</td>
                            <td>12</td>
                          </tr>
                          <tr>
                            <td>7</td>
                            <td width=60% class=alignleft_box>제목부분입니다. </td>
                            <td>안농앙농</td>
                            <td>0</td>
                            <td>12</td>
                          </tr>
                          <tr>
                            <td>8</td>
                            <td width=60% class=alignleft_box>제목부분입니다. </td>
                            <td>안농앙농</td>
                            <td>0</td>
                            <td>12</td>
                          </tr>
                          <tr>
                            <td>9</td>
                            <td width=60% class=alignleft_box>제목부분입니다. </td>
                            <td>안농앙농</td>
                            <td>0</td>
                            <td>12</td>
                          </tr>
                          <tr>
                            <td>10</td>
                            <td width=60% class=alignleft_box>제목부분입니다. </td>
                            <td>안농앙농</td>
                            <td>0</td>
                            <td>12</td>
                          </tr>
                      </tbody>
                    </table> 
                    
                    <ul class="pagination justify-content-center" style="margin-bottom:30px">
                      <li class="page-item disabled"><a class="page-link pagerfontcolor" href="#">Back</a></li>
                      <li class="page-item"><a class="page-link pagerfontcolor" href="#">1</a></li>
                      <li class="page-item"><a class="page-link pagerfontcolor" href="#">2</a></li>
                      <li class="page-item"><a class="page-link pagerfontcolor" href="#">3</a></li>
                      <li class="page-item"><a class="page-link pagerfontcolor" href="#">Next</a></li>
                    </ul>
                    
                    
                    <div class="search_box2">
                        <select id=search name=search >
                           <option value="id">작성자</option>
                           <option value="title">제목</option>
                           <option value="content">내용</option>
                           <option value="ti_con">제목 + 내용</option>
                        </select>&nbsp;&nbsp;
                        <input type="text" class="search_boxb" id="keyword" name="keyword">&nbsp;&nbsp;
                        <input type=button value="검색" class="btn btn-outline-dark">
                    </div>
                    
           </div><!-- 가운데 컨텐트 들어갈 곳 -->
           
           
           
           
           
           <div class="col-lg-2 container">
           </div><!-- 우측 빈 여백 -->
        
        
        </div>
    </div> <!--  end main -->


   <%@ include file="footer.jsp" %>




</body>
</html>