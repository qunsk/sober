<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/ctg_title.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>안주 수정폼</title>
<meta charset="utf-8">

<script type="text/javascript"
	src="resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
function check(){

	if($.trim($("#title").val())==""){
		alert("제목을 입력하세요.");
		$("#title").focus;
		return false;	
	}
	
	if($.trim($("#title").val()).length > 30){
		alert("제목은 30자 이하로 입력하세요.");
		$("#title").focus;
		return false;	
	}

	var content = document.getElementById("content").value;
	$('#content').val(content);
	if (content == '<p>&nbsp;</p>' || content == "") { //비어있는 경우
		alert("내용을 입력해주세요.")
		oEditors.getById["content"].exec("FOCUS")
		return false;
	}
 	if (content.length > 1500) { //비어있는 경우
		alert("내용은 1500자 이하로 작성해주세요.")
		oEditors.getById["content"].exec("FOCUS")
		return false;
	} 
}
</script>
<style>

input[type=file]::file-selector-button {
  width: 80px;
  height: 30px;
  background: #fff;
  border: 1px solid rgb(77,77,77);
  border-radius: 5px;
  cursor: pointer;
  font-size: 10pt;
  margin-top: 10px;
}

</style>

</head>
<body>
	<%@ include file="../public/header.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2 container">
				<div align="right" class="minimi board_category">Home > 안주게시판</div>
			</div>
			
			<!-- 좌측 빈 여백  -->
			<div class="col-lg-8 container" align="center">

				<!--  id=nav_active 가 빠지면 안됩니다. 헤더의 보라색 바를 표시하기 위한 id값입니다.  -->
				<div class="title_box medium" id="nav_active">안주 게시판</div>
				<div id="foodF">

					<form id="food" method="post" action="foodUpdate_ok"
						enctype="multipart/form-data" onsubmit="return check()">
						<input type="hidden" name="f_num" value="${food.f_num }">
 						<input type="hidden" name="pageNum" value="${pageNum }">
						<input type="hidden" name="nickname" value="${nickname }">
						<br> <br>
						<table width=835 align="center">
							<tr>
								<td><input id="title" name="title" value="${food.title }"
									placeholder="제목을 입력해주세요." style="width: 800px; height: 35px;"></td>
							</tr>
							<tr>
								<td>
									<!-- Naver SmartEditor 2.8.2를 사용하였습니다. --> <textarea
										name="content" id="content" colspan="3"
										style="width: 800px; height: 400px;" class="smart">${food.content }
								</textarea>
								</td>
							</tr>
							<tr>
								<td>
									<div align="left">
										<span class=minimi><b>썸네일 이미지를 선택해주세요.</b></span><br>
										<input type="file" id="img" name="foodImg" style="font-size: 10pt;">
									</div>
								</td>
							</tr>
							
						</table>



						<br> <br> <input type="submit" id="writeBtn" value="글수정"
							class="btn btn-outline-dark"><br><br><br><br>
					</form>

				</div>
			</div>


			<div class="col-lg-2 container"></div>
			<!-- 우측 빈 여백 -->
		</div>
	</div>
	<!--  end main -->

	<%@ include file="../public/footer.jsp"%>
</body>
</html>

<script src="/resources/food/js/smartEditor.js"></script>

