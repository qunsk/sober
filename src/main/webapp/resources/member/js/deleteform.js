function check(){
	 if($.trim($("#passwd").val())==""){
		 alert("비밀번호를 입력하세요");
		 $("#passwd").focus();
		 return false;
	 }
	 if($.trim($("#delcontent").val())==""){
		 alert("탈퇴 이유를 작성해주세요");
		 $("#delcontent").focus();
		 return false;
	 }
 }

