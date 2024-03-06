<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/ctg_title.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>안주 작성폼</title>
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
	if (content == '<p>&nbsp;</p>') { //비어있는 경우
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

					<form id="food" method="post" action="foodwrite_ok"
						enctype="multipart/form-data" onsubmit="return check()">
						<input type="hidden" name="nickname" value="${nickname }">
						<br> <br>
						<table width=835 align="center">
							<tr>
								<td><input id="title" name="title"
									placeholder="제목을 입력해주세요." style="width: 800px; height: 35px;"></td>
							</tr>
							<tr>
								<td>
									<!-- Naver SmartEditor 2.8.2를 사용하였습니다. --> <textarea
										name="content" id="content" colspan="3"
										style="width: 800px; height: 300px;" class="smart">
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

						<br> <br> <input type="submit" id="writeBtn" value="글작성"
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

<!-- <script>
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "content", // 저는 textarea의 id와 똑같이 적어줬습니다.
		sSkinURI : "resources/smarteditor/SmartEditor2Skin.html", // 경로를 꼭 맞춰주세요!
		fCreator : "createSEditor2",
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,

			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : false,

			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : false,
			fOnBeforeUnload : function() {
			}
		},

		fOnAppLoad : function() {
			//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
		}
	});

	$("#writeBtn").click(function() {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		var content = document.getElementById("content").value;
	});

	/* function check() {

		var title = $("#title").val();
		var img = $("#img").val();
		//	var content = oEditors.getById["smartEditor"].getIR();

		oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
		//content Text 가져오기
		var content = document.getElementById("smartEditor").value;
		$('#smartEditor').val(content);
		if (content == '<p>&nbsp;</p>') { //비어있는 경우
			alert("내용을 입력해주세요.")
			oEditors.getById["smartEditor"].exec("FOCUS")
			return false;
		} else {
			//console.log(content);
			//        let writePost = {
			//            title: $("#title")[0].value
			//            ,content: content
			//        }

			//ajax 통신으로 서버로 보내 데이터 저장함
			$.ajax({
				url : "foodInsertAjax",
				data : {
					"title" : title,
					"content" : content,
					 "img" : img 
				},
				type : 'POST',
				success : function(data) {
					console.log('success')
					alert('저장되었습니다.')
					// location.href='food/foodView'
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR)
					alert('오류가 발생하였습니다.')
				}
			})
		}
	} */
</script> -->