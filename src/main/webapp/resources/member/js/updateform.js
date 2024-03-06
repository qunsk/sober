/*var nickDuplChk = false; // 닉네임 중복 체크 버튼*/
//var pwdRule = /(?=.*\d{1,16})(?=.*[~`!@#$%\^&*()-+=]{1,16})(?=.*[a-zA-Z]{1,16}).{8,16}$/; // 비밀번호 정규식
//var pwdRule = /(?=.*\d)(?=.*[~`!@#$%\^&*()-+=])(?=.*[a-zA-Z]).{8,16}$/; // 비밀번호 정규식
//var nickRule = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]+$/ // 닉네임 정규식

function check() {
	if ($.trim($("#passwd").val()) == "") {
		alert("비밀번호를 입력하세요.");
		$("#passwd").val("").focus();
		return false;
	}
	/*if ($.trim($("#newpasswd").val()) != $.trim($("#newpasswd2").val())) {
		alert("새 비밀번호가 일치하지 않습니다.");
		$("#passwd").val("");
		$("#passwd2").val("");
		$("#passwd").focus();
		return false;
	}*/
/*	if (!pwdRule.test($("#newpasswd").val())) {
		alert("비밀번호는 영문자, 숫자, 특수문자 포함 8~16자로 설정하세요.");
		$("#passwd").val("").focus();
		return false;
	}*/
//	if ($.trim($("#nickname").val()) == "") {
//		alert("닉네임을 입력하세요.");
//		$("#nickname").val("").focus();
//		return false;
//	}
	/*
	 * if (nickDuplChk == false) { alert("닉네임 중복확인을 눌러주세요.");
	 * $("#nickname").focus(); return false; }
	 */
//	if (!nickRule.test($("#nickname").val())) {
//		alert("닉네임에 특수문자는 사용 불가능 합니다.")
//		$("#nickname").focus();
//		return false;
//	}
	if ($.trim($("#name").val()) == "") {
		alert("이름을 입력하세요.");
		$("#name").val("").focus();
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
	/*
	 * if ($.trim($("#sub_region").val()) == "") { alert("시,군,구를 선택하세요.");
	 * $("#sub_region").focus(); return false; }
	 */
	if ($("#male").is(":checked") == false
			&& $("#female").is(":checked") == false) {
		alert("성별을 선택하세요");
		return false;
	}

} // check() 함수 끝

$(function() {
	// 비밀번호 정규식 확인
//	$("#alert_ruleS").hide();
//	$("#alert_ruleF").hide();
//	$("input").keyup(function() {
//		var passwd = $("#newpasswd").val();
//		if (passwd != "") {
//			if (pwdRule.test(passwd)) {
//				$("#alert_ruleS").show();
//				$("#alert_ruleF").hide();
//			} else {
//				$("#alert_ruleF").show();
//				$("#alert_ruleS").hide();
//			}
//		}
//
//	});

	// 비밀번호 일치/불알치 확인
//	$("#alert_success").hide();
//	$("#alert_fail").hide();
//	$("input").keyup(function() {
//		var passwd = $("#newpasswd").val();
//		var passwd2 = $("#newpasswd2").val();
//		if (passwd != "" || passwd2 != "") {
//			if (passwd == passwd2) {
//				$("#alert_success").show();
//				$("#alert_fail").hide();
//				$("#join_submit").removeAttr("disabled");
//			} else {
//				$("#alert_success").hide();
//				$("#alert_fail").show();
//			}
//		}
//
//	});

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

		// 지역 선택
		$("#region_sel").change(function() {
			var region = $("#region_sel").val();
			if (region != "") {
				$("#sub_region_sel").load("sub_region?region=" + region);
			} else {
				$("#sub_region_sel").html("");
			}
		});
	});
});
// 닉네임 중복체크
//function nick_check() {
//	/* nickDuplChk = true; */
//	$("#nickcheck").hide();
//	var memnick = $("#nickname").val();
//
//	// 1.입력글자 길이 체크
//	if ($.trim($("#nickname").val()).length < 2) {
//		var newtext = '<font color="red">닉네임은 2자 이상이어야 합니다.</font>';
//		$("#nickcheck").text('');
//		$("#nickcheck").show();
//		$("#nickcheck").append(newtext); // span 아이디 영역에 경고문자 추가
//		$("#nickname").focus();
//		return false;
//	}
//	;
//
//	if ($.trim($("#nickname").val()).length > 12) {
//		var newtext = '<font color="red">닉네임은 12자 이하이어야 합니다.</font>';
//		$("#nickcheck").text('');
//		$("#nickcheck").show();
//		$("#nickcheck").append(newtext); // span 아이디 영역에 경고문자 추가
//		$("#nickname").val("").focus();
//		return false;
//	}
//	;
//
//	// 입력 닉네임 유효성 검사
//	if (!(validate_usernick(memnick))) {
//		var newtext = '<font color="red">특수문자는 사용 불가능 합니다.</font>';
//		$("#nickcheck").text(''); // 문자 초기화
//		$("#nickcheck").show(); // span 아이디 영역을 보이게 한다.
//		$("#nickcheck").append(newtext);
//		$("#nickname").val("").focus();
//		return false;
//	}
//	;
//
//	// 닉네임 중복확인
//	$.ajax({
//		type : "POST",
//		url : "join_nickcheck",
//		data : {
//			"memnick" : memnick
//		},
//		success : function(data) {
//			// alert("return success=" + data);
//			if (data == 1) { // 중복 ID
//				var newtext = '<font color="red">중복된 닉네임입니다.</font>';
//				$("#nickcheck").text('');
//				$("#nickcheck").show();
//				$("#nickcheck").append(newtext);
//				$("#nickname").val('').focus();
//				return false;
//
//			} else { // 사용 가능한 ID
//				var newtext = '<font color="green">사용가능한 닉네임입니다.</font>';
//				$("#nickcheck").text('');
//				$("#nickcheck").show();
//				$("#nickcheck").append(newtext);
//				$("#name").focus();
//			}
//		},
//		error : function(e) {
//			alert("data error" + e);
//		}
//	}); // $.ajax 끝
//};
//// 닉네임 중복 체크 끝
//
//// 닉네임 정규식
//function validate_usernick(memnick) {
//	var pattern = new RegExp(/^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]+$/); // 영어 소문자,
//	// 숫자, 한글만
//	// 가능
//
//	return pattern.test(memnick);
//};
//
