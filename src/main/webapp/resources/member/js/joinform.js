var idDuplChk = false; // 아이디 중복 체크 버튼
var nickDuplChk = false; // 닉네임 중복 체크 버튼
var phoneBtnChk = false; // 인증번호 전송 여부 체크 변수
var certifyBtnChk = false; // 인증하기버튼 안눌렀을 때 막을 변수
var phoneCertifyChk = false; // 인증번호 일치여부 체크 변수
var idRule = /^[a-z0-9]+$/;
var pwdRule = /(?=.*\d{1,16})(?=.*[~`!@#$%\^&*()-+=]{1,16})(?=.*[a-zA-Z]{1,16}).{8,16}$/; // 비밀번호 정규식
var nickRule = /^(?=.*[a-zA-Z0-9가-힣])[a-zA-Z0-9가-힣]+$/ // 닉네임 정규식


function check() {
	if ($.trim($("#id").val()) == "") {
		alert("ID를 입력하세요.");
		$("#id").focus();
		return false;
	}
	if (idDuplChk == false) {
		alert("ID 중복확인을 눌러주세요.");
		$("#id").focus();
		return false;
	}
/*	if($("#id").val() == $("#getId()").val()){
		alert("중복된 ID 입니다.");
		$("#id").focus();
		return false;
	}*/
	
	if ($.trim($("#id").val()).length < 4) {
		alert("ID는 4자 이상이어야 합니다.")
		$("#id").focus();
		return false;
	}
	
	if ($.trim($("#id").val()).length > 12) {
		alert("ID는 12자 이하여야 합니다.")
		$("#id").focus();
		return false;
	}
	if(!idRule.test($("#id").val())){
		alert("ID는 영문 소문자, 숫자만 사용 가능 합니다.")
		$("#nickname").focus();
		return false;
	}
	if ($.trim($("#passwd").val()) == "") {
		alert("비밀번호를 입력하세요.");
		$("#passwd").val("").focus();
		return false;
	}
	if ($.trim($("#passwd2").val()) == "") {
		alert("비밀번호 확인을 입력하세요.");
		$("#passwd2").val("").focus();
		return false;
	}
	if (!pwdRule.test($("#passwd").val())) {
		alert("비밀번호는 영문자, 숫자, 특수문자(~!@#$%\^&*()+=) 포함 8~16자로 설정하세요.");
		$("#passwd").val("").focus();
		return false;
	}
	if ($.trim($("#passwd").val()) != $.trim($("#passwd2").val())) {
		alert("비밀번호가 일치하지 않습니다.");
		$("#passwd").val("");
		$("#passwd2").val("");
		$("#passwd").focus();
		return false;
	}
	if ($.trim($("#nickname").val()) == "") {
		alert("닉네임을 입력하세요.");
		$("#nickname").val("").focus();
		return false;
	}
	if (nickDuplChk == false) {
		alert("닉네임 중복확인을 눌러주세요.");
		$("#nickname").focus();
		return false;
	}
	if ($.trim($("#nickname").val()).length < 2) {
		alert("닉네임은 2자 이상이어야 합니다.")
		$("#nickname").focus();
		return false;
	}
	if ($.trim($("#nickname").val()).length > 12) {
		alert("닉네임은 12자 이하여야 합니다.")
		$("#nickname").focus();
		return false;
	}
	if(!nickRule.test($("#nickname").val())){
		alert("닉네임에 특수문자는 사용 불가능 합니다.")
		$("#nickname").focus();
		return false;
	}
	if ($.trim($("#name").val()) == "") {
		alert("이름을 입력하세요.");
		$("#name").val("").focus();
		return false;
	}
	if ($.trim($("#jumin1").val()) == "") {
		alert("주민번호를 입력하세요.");
		$("#jumin1").val("").focus();
		return false;
	}
	if ($("#jumin1").val().length != 6) {
		alert("주민번호 6자리를 입력하세요");
		$("#jumin1").val("").focus();
		return false;
	}
	if (isNaN($("#jumin1").val())) {
		alert("숫자만 입력하세요");
		$("#jumin1").val("").focus();
		return false;
	}
	if ($.trim($("#jumin2").val()) == "") {
		alert("주민번호를 입력하세요.");
		$("#jumin2").val("").focus();
		return false;
	}
	if (isNaN($("#jumin2").val())) {
		alert("숫자만 입력하세요");
		$("#jumin2").val("").focus();
		return false;
	}
	if ($.trim($("#phone").val()) == "") {
		alert("휴대폰 번호를 입력하세요.");
		$("#phone").val("").focus();
		return false;
	}
	if (isNaN($("#phone").val())) {
		alert("숫자만 입력하세요");
		$("#phone").val("").focus();
		return false;
	}
	if (phoneBtnChk == false) {
		alert("휴대폰 인증번호 전송을 눌러주세요.");
		$("#phone_certify").focus();
		return false;
	}
	if ($.trim($("#phone_certify").val()) == "") {
		alert("휴대폰 인증번호를 입력하세요.");
		$("#phone_certify").focus();
		return false;
	}
	if (certifyBtnChk == false) {
		alert("휴대폰 인증하기를 눌러주세요.");
		$("#phone_certify").focus();
		return false;
	}
	if (phoneCertifyChk == false) {
		alert("휴대폰 인증번호가 일치하지 않습니다.");
		$("#phone_certify").val("").focus();
		return false;
	}
	if ($.trim($("#mailid").val()) == "") {
		alert("이메일을 입력하세요.");
		$("#mailid").val("").focus();
		return false;
	}
	if ($.trim($("#domain").val()) == "") {
		alert("이메일을 입력하세요.");
		$("#domain").focus();
		return false;
	}
	if ($.trim($("#region_sel").val()) == "") {
		alert("시,도를 선택하세요.");
		$("#region_sel").focus();
		return false;
	}
	if ($.trim($("#sub_region").val()) == "") {
		alert("시,군,구를 선택하세요.");
		$("#sub_region").focus();
		return false;
	}

	if ($("#male").is(":checked") == false
			&& $("#female").is(":checked") == false) {
		alert("성별을 선택하세요");
		return false;
	}

	// 성인 인증
	const jumin1 = document.getElementById("jumin1").value;
	const jumin2 = document.getElementById("jumin2").value;

	const year = parseInt(jumin1.substring(0, 2));
	const month = parseInt(jumin1.substring(2, 4));
	const day = parseInt(jumin1.substring(4, 6));

	const jumin2_num = parseInt(jumin2.substring(0, 1));

	let birthYear = 0;

	if (jumin2_num == 1 || jumin2_num == 2) {
		birthYear = 1900 + year;

	} else {
		birthYear = 2000 + year;

	}

	const today = new Date();
	const age = today.getFullYear() - birthYear + 1;

	if (age < 19) {
		alert("만 19세 이상만 가입이 가능합니다.");
		return false;
	}
	return true;

} // check() 함수 끝

$(function() {

	// 주민등록번호 key up
	$("#jumin1").keyup(function() {
		if ($("#jumin1").val().length == 6)
			$("#jumin2").focus();
	});
	

	$("#jumin2").keyup(function() {
		var arr = ['5','6','7','8','9','0'];
		
		if($.inArray($("#jumin2").val(),arr)!=-1){
			alert("유효한 주민등록 번호가 아닙니다. ");
			$("#jumin2").val('').focus();
			return false;
		}
		
		if($("#jumin2").val()==1 || $("#jumin2").val()==3 ){
           $("#male").prop("checked",true);			
		}else{
			$("#female").prop("checked",true);			
		}
	});
	
	

	// 비밀번호 정규식 확인
	$("#alert_ruleS").hide();
	$("#alert_ruleF").hide();
	$("input").keyup(function() {
		var passwd = $("#passwd").val();
		if (passwd != "") {
			if (pwdRule.test(passwd)) {
				$("#alert_ruleS").show();
				$("#alert_ruleF").hide();
			} else {
				$("#alert_ruleF").show();
				$("#alert_ruleS").hide();
			}
		}

	});

	// 비밀번호 일치/불알치 확인
	$("#alert_success").hide();
	$("#alert_fail").hide();
	$("input").keyup(function() {
		var passwd = $("#passwd").val();
		var passwd2 = $("#passwd2").val();
		if (passwd != "" || passwd2 != "") {
			if (passwd == passwd2) {
				$("#alert_success").show();
				$("#alert_fail").hide();
				$("#join_submit").removeAttr("disabled");
			} else {
				$("#alert_success").hide();
				$("#alert_fail").show();
			}
		}

	});

	// 이메일 도메인 선택
	$(document).ready(function() {

		$("select[name=mail_list]").change(function() {

			if ($(this).val() == "1") {

				$("#domain").val("");
				$("#domain").attr("readonly", false);

			} else {

				$("#domain").val($(this).val());
				$("#domain").attr("readonly", true);
			}
		});
	});

	// 휴대폰 본인 인증
	var code = "";
	$("#phoneChk").click(function() {
		phoneBtnChk = true;
		var phone = $("#phone").val();

		if ($("#phone").val()=="") {
			alert("휴대폰 번호를 입력하세요.")
			$("#phone").focus();
			return false;
		}
		
/*		$.ajax({
			type: "post",
			url: "phoneDuplChk",
			data: {phone: $("#phone").val()},
			success: function(response){
				if(response != '0'){
					alert("이미 등록된 휴대폰 번호 입니다.");
					return false;
				} else{
					
				}
			}, error: function(){
				alert("오류가 발생했습니다.");
			}
		});*/

			alert("인증번호 발송이 완료되었습니다. \n 휴대폰에서 인증번호를 확인해주세요.")

			$.ajax({
				type : "get",
				url : "phoneChk",
				data : {
					phone : phone
				},
				cache : false,
				success : function(data) {
					if (data == "error") {
						alert("휴대폰 번호가 올바르지 않습니다.");
						$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
						$(".successPhoneChk").css("color", "red");
						$("#phone").attr("autofocus", "true");
					} else {
						$("#phone_certify").attr("disabled", false);
						$("#phoneChk2").css("display", "inline-block");
						$(".successPhoneChk").text("인증번호를 입력한 뒤 인증하기를 눌러주세요.");
						$(".successPhoneChk").css("color", "green");
						$("#phone").attr("readonly", "true");
						code = data;
					}
				}
			});
	});

	// 휴대폰 인증번호 일치 여부
	$("#phoneChk2").click(function() {
		certifyBtnChk = true;
		phoneCertifyChk = true;
		var phone_certify = $("#phone_certify").val();

		if (!phone_certify) {
			alert("인증번호를 입력하세요.")
			$("#phone_certify").focus();
			return false;
		}

		if ($("#phone_certify").val() == code) {
			$(".successPhoneChk").text("인증번호가 일치합니다.");
			$(".successPhoneChk").css("color", "green");
			$("#phoneDoubleChk").val("true");
			$("#phone_certify").attr("disabled", true);

			phoneCertifyChk = true;

		} else {
			$(".successPhoneChk").text("인증번호가 일치하지 않습니다.");
			$(".successPhoneChk").css("color", "red");
			$("#phoneDoubleChk").val("false");
			$(this).attr("autofocus", true);

			phoneCertifyChk = false;
		}
	});
});

// 아이디 중복체크
function id_check() {
	idDuplChk = true;

	$("#idcheck").hide();
	var memid = $("#id").val();

	// 1.입력글자 길이 체크
	if ($.trim($("#id").val()).length < 4) {
		var newtext = '<font color="red">아이디는 4자 이상이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);// span 아이디 영역에 경고문자 추가
		$("#id").val("").focus();
		return false;
	};
	
	if ($.trim($("#id").val()).length > 12) {
		var newtext = '<font color="red">아이디는 12자 이하이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);// span 아이디 영역에 경고문자 추가
		$("#id").val("").focus();
		return false;
	};

	// 입력아이디 유효성 검사
	if (!(validate_userid(memid))) {
		var newtext = '<font color="red">아이디는 영문소문자,숫자,_ 조합만 가능합니다.</font>';
		$("#idcheck").text('');// 문자 초기화
		$("#idcheck").show();// span 아이디 영역을 보이게 한다.
		$("#idcheck").append(newtext);
		$("#id").val("").focus();
		return false;
	};

	// 아이디 중복확인
	$.ajax({
		type : "POST",
		url : "join_idcheck",
		data : {
			"memid" : memid
		},
		success : function(data) {
			// alert("return success=" + data);
			if (data == 1) { // 중복 ID
				var newtext = '<font color="red">중복 아이디입니다.</font>';
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append(newtext);
				$("#id").val("").focus();
				return false;

			} else { // 사용 가능한 ID
				var newtext = '<font color="green">사용가능한 아이디입니다.</font>';
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append(newtext);
				$("#passwd").focus();
			}
		},
		error : function(e) {
			alert("data error" + e);
		}
	}); // $.ajax 끝
};
// 아이디 중복 체크 끝

// 닉네임 중복체크
function nick_check() {
	nickDuplChk = true;
	$("#nickcheck").hide();
	var memnick = $("#nickname").val();

	// 1.입력글자 길이 체크
	if ($.trim($("#nickname").val()).length < 2) {
		var newtext = '<font color="red">닉네임은 2자 이상이어야 합니다.</font>';
		$("#nickcheck").text('');
		$("#nickcheck").show();
		$("#nickcheck").append(newtext);	// span 아이디 영역에 경고문자 추가
		$("#nickname").focus();
		return false;
	}
	;

	if ($.trim($("#nickname").val()).length > 12) {
		var newtext = '<font color="red">닉네임은 12자 이하이어야 합니다.</font>';
		$("#nickcheck").text('');
		$("#nickcheck").show();
		$("#nickcheck").append(newtext);	// span 아이디 영역에 경고문자 추가
		$("#nickname").val("").focus();
		return false;
	}
	;

	// 입력 닉네임 유효성 검사
	if (!(validate_usernick(memnick))) {
		var newtext = '<font color="red">특수문자는 사용 불가능 합니다.</font>';
		$("#nickcheck").text('');	// 문자 초기화
		$("#nickcheck").show();		// span 아이디 영역을 보이게 한다.
		$("#nickcheck").append(newtext);
		$("#nickname").val("").focus();
		return false;
	}
	;

	// 닉네임 중복확인
	$.ajax({
		type : "POST",
		url : "join_nickcheck",
		data : {
			"memnick" : memnick
		},
		success : function(data) {
			// alert("return success=" + data);
			if (data == 1) { // 중복 ID
				var newtext = '<font color="red">중복된 닉네임입니다.</font>';
				$("#nickcheck").text('');
				$("#nickcheck").show();
				$("#nickcheck").append(newtext);
				$("#nickname").val('').focus();
				return false;

			} else { // 사용 가능한 ID
				var newtext = '<font color="green">사용가능한 닉네임입니다.</font>';
				$("#nickcheck").text('');
				$("#nickcheck").show();
				$("#nickcheck").append(newtext);
				$("#name").focus();
			}
		},
		error : function(e) {
			alert("data error" + e);
		}
	}); // $.ajax 끝
};
// 닉네임 중복 체크 끝

// ID 정규식
function validate_userid(memid) {
	var pattern = new RegExp(/^[a-z0-9]+$/); // 영어 소문자, 숫자만 가능
	return pattern.test(memid);
};

// 닉네임 정규식
function validate_usernick(memnick) {
	var pattern = new RegExp(/^(?=.*[a-zA-Z0-9가-힣])[a-zA-Z0-9가-힣]+$/); // 영어 소문자, 숫자, 한글만 가능
	
	return pattern.test(memnick);
};

// 지역선텍
$(document).ready(function() {

	$("#region_sel").change(function() {
		// alert("도달함");
		var region = $("#region_sel").val();
		if (region != "") {
			$("#rerere").load("subregion?region=" + region);
		} else {
			$("#rerere").html("");
		}

	});

});