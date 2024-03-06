function check() {
	$("#notice_t").val($("#notice_type").val());
	var notice_title = document.getElementById("notice_title");
	var notice_type = document.getElementById("notice_type");

	if (notice_type.value == "") {
		alert('종류를 선택해주세요');
		notice_type.focus();
		return false;
	}

	if (notice_title.value == "") {
		alert('제목을 입력해주세요');
		notice_title.focus();
		return false;
	}
	
	if(notice_title.length > 30){
		alert("제목을 30자 이내로 입력하세요");
		$("#notice_title").focus();
		return false;
	}

	oEditors.getById["notice_content"].exec("UPDATE_CONTENTS_FIELD", []);
	var notice_content = $("#notice_content").val();

	if (notice_content == "" || notice_content == null
			|| notice_content == '&nbsp;' || notice_content == '<p>&nbsp;</p>') {
		alert("내용을 입력하세요.");
		oEditors.getById["notice_content"].exec("FOCUS"); // 포커싱
		return false;
	}
	
	if(notice_title.length > 1500){
		alert("내용을 1500자 이내로 입력하세요");
		$("#notice_title").focus();
		return false;
	}

}