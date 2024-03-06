$(document).ready(function(){

 $("form").submit(function(){

	var notice_type=$.trim($("#notice_type").val());
	var notice_title=$.trim($("#notice_title").val());
	
	if(notice_type == "") {
		alert("종류를 선택해주세요");
		$("#notice_type").focus();
		return false;
	}
	
	if(notice_title == "") {
		alert("제목을 입력해주세요");
		$("#notice_title").focus();
		return false;
	}
	
	if(notice_type.length > 30){
		alert("제목을 30자 이내로 임혁하세요")
	}
		
	oEditors.getById["notice_content"].exec("UPDATE_CONTENTS_FIELD", []);
	var notice_content = $.trim($("#notice_content").val());

	if (notice_content == "" || notice_content == null
			|| notice_content == '&nbsp;' || notice_content == '<p>&nbsp;</p>'|| notice_content == '<p></p>') {
		alert("내용을 입력하세요.");
		oEditors.getById["notice_content"].exec("FOCUS"); // 포커싱
		return false;
	}
	
	if(notice_title.length > 1500){
		alert("내용을 1500자 이내로 입력하세요");
		$("#notice_title").focus();
		return false;
	}

 });

});

