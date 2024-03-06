//var pwdRule = /(?=.*\d{1,16})(?=.*[~`!@#$%\^&*()-+=]{1,16})(?=.*[a-zA-Z]{1,16}).{8,16}$/; // 비밀번호 정규식
var pwdRule = /(?=.*\d)(?=.*[~`!@#$%\^&*()-+=])(?=.*[a-zA-Z]).{8,16}$/; // 비밀번호 정규식
var nickRule = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]+$/ // 닉네임 정규식

function check() {
	if ($.trim($("#passwd").val()) == "") {
		alert("비밀번호를 입력하세요.");
		$("#passwd").val("").focus();
		return false;
	}
	if ($.trim($("#newpasswd").val()) != $.trim($("#newpasswd2").val())) {
		alert("새 비밀번호가 일치하지 않습니다.");
		$("#newpasswd").val("");
		$("#newpasswd2").val("");
		$("#newpasswd").focus();
		return false;
	}
	if (!pwdRule.test($("#newpasswd").val())) {
		alert("비밀번호는 영문자, 숫자, 특수문자 포함 8~16자로 설정하세요.");
		$("#newpasswd").val("").focus();
		return false;
	}
} // check() 함수 끝

$(function() {
	// 비밀번호 정규식 확인
	$("#alert_ruleS").hide();
	$("#alert_ruleF").hide();
	$("input").keyup(function() {
		var passwd = $("#newpasswd").val();
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
		var passwd = $("#newpasswd").val();
		var passwd2 = $("#newpasswd2").val();
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

});
