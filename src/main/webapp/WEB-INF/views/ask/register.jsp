<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
<!-- 헤더 -->
<%@ include file="../public/header.jsp"%>


    <!-- 메인 -->
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
            <div class="col-lg-7 container-fluid" >
               		 <h1>1:1 문의 글쓰기</h1> <br><br>
            

				<table>
					<tr>
						<th>제목</th>
						<td colspan="3" class="long-input" style="width:500px; text-align:center;">1:1 문의합니다.</td>
					</tr>
				</table>
				<form action="askRegister" method="post">
				<div class="mb-3">
					<label for="content"></label>
					<textarea class="form-control" rows="14" name="ask_content" id="ask_content" style="resize: none; width: 825px;" required="required"></textarea>
				</div>
					<input type="submit" value="글작성">
				</form>
			</div>
		</div>
	</div>				
	
	

<%@ include file="../public/footer.jsp"%>
