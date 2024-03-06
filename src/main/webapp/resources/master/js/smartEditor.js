	function board_check() {
		if ($.trim($("#notice_title").val()) == "") {
			alert("제목 없이 등록할 수 없습니다.");
			$("#notice_title").val("").focus();
			return false;
		}
	}
	//에디터 설정
	let oEditors = [];

	smartEditor = function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "notice_content",
			sSkinURI : "resources/smarteditor/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});
	}

	$(document).ready(function() {
		smartEditor();
	});

	submitPost = function() {
		oEditors.getById["notice_content"].exec("UPDATE_CONTENTS_FIELD", [])
		//스마트 에디터 내의 글 종류 가져옴
		let notice_type = $("#notice_type option:selected").val();
		//스마트 에디터 내의 내용 가져옴
		let notice_content = document.getElementById("notice_content").value;

		if (notice_content == '') {
			alert("내용 없이 등록할 수 없습니다.");
			oEditors.getById["notice_content"].exec("FOCUS");
			return;
		} else {
			var writePost = {
				notice_type : notice_type,
				notice_title : $("#notice_title")[0].value,
				notice_content : notice_content,
			}
			
			$.ajax({
				url : "noticewrite_check",
				data : writePost,
				type : "POST",
				success : function(data) {
					alert("저장되었습니다.")
					location.href="noticelist";
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR)
					alert("오류가 발생하였습니다.")
				}
			})
		}
	}