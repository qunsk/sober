var phoneBtnChk = false; // 인증번호 전송 여부 체크 변수
var certifyBtnChk = false; // 인증하기버튼 안눌렀을 때 막을 변수
var phoneCertifyChk = false; // 인증번호 일치여부 체크 변수

function check() {
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
} // check() 함수 끝

// 휴대폰 본인 인증
$(function() {

	var code = "";
	$("#phoneChk").click(function() {
		phoneBtnChk = true;
		var phone = $("#phone").val();

		if ($("#phone").val() == "") {
			alert("휴대폰 번호를 입력하세요.")
			$("#phone").focus();
			return false;
		}

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
					$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주세요.");
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