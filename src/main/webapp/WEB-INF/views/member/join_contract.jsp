<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 이용약관</title>

<link rel="stylesheet" type="text/css" href="/resources/member/css/contract.css" />
<link rel="stylesheet" type="text/css" href="/resources/public/css/paging_page.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/resources/member/js/contract.js"></script>

</head>

<body>
<%@ include file="../public/header.jsp" %> 
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2 container">
				<div align="right" class="minimi board_category">Home > 회원가입</div>
			</div>
			<!-- 좌측 빈 여백  -->
			
			<div class="col-lg-8 container">
			
	<form method="post" action="join_form" onsubmit="return check()">
	
	<div id="contract_wwrap" class="checkbox_group" align=center width=800>
		<table width=600 height=200 align=center class="contract1">
			<h2>이용약관</h2>
			<tr>
				<td>
				<textarea cols=110 rows=13>

 [이용약관] 

 제1조(목적) 
 이 약관은 회사(전자상거래 사업자)가 운영하는 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.

 제2조(정의)
 ① “몰”이란 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
  
 ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.

 제3조 (약관 등의 명시와 설명 및 개정)
 ① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
 
 ② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
 
 ③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
				</textarea>
				<label><input type="checkbox" name="chk" class=agree> 동의합니다 <strong>(필수)</strong></label>
				</td>
			</tr>
		</table>

		<table width=600 height=200 align=center class="contract2">
			<h2>개인정보 수집 및 이용</h2>
			<tr>
				<td>
				<textarea cols=110 rows=13>

 [개인정보 수집 및 이용]
				
 가. 개인정보의 수집 및 이용 목적 국가공간정보포털은 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다. 

 나. 정보주체와 법정대리인의 권리ㆍ의무 및 행사방법 
① 정보주체(만 14세 미만인 경우에는 법정대리인을 말함)는 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다. 

② 제1항에 따른 권리 행사는 개인정보보호법 시행규칙 별지 제8호 서식에 따라 작성 후 서면, 전자우편 등을 통하여 하실 수 있으며, 기관은 이에 대해 지체 없이 조치하겠습니다. 

③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다. 

④ 개인정보 열람 및 처리정지 요구는 개인정보 보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다. 

⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다. 

⑥ 정보주체 권리에 따른 열람의 요구, 정정ㆍ삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다. 다. 수집하는 개인정보의 항목 국가공간정보포털 회원정보(필수): 이름, 이메일(아이디), 비밀번호 라. 개인정보의 보유 및 이용기간 국가공간정보포털은 법령에 따른 개인정보 보유ㆍ이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유ㆍ이용기간 내에서 개인정보를 처리ㆍ보유합니다. - 수집근거: 정보주체의 동의 - 보존기간: 회원 탈퇴 요청 전까지(1년 경과 시 재동의) - 보존근거: 정보주체의 동의 마. 동의 거부 권리 및 동의 거부에 따른 불이익 위 개인정보의 수집 및 이용에 대한 동의를 거부할 수 있으나, 동의를 거부할 경우 회원 가입이 제한됩니다.
					</textarea>
					<label><input type="checkbox" name="chk" class=agree> 동의합니다 <strong>(필수)</strong></label> <br>
				</td>
			</tr>
		</table>
		<br> <label><input type="checkbox" id="check_all" class=agree2 style="font-size: 15px"> 위 사항에 모두 동의합니다</label>
	</div>
	<br>

	<div align=center id="contractBtn">
		<input type=reset value=취소  class="input1">
		<input type=submit value=다음  class="input2">
	</div>
	
	</form>
	
	</div>
	<div class="col-lg-2 container"></div>
			<!-- 우측 빈 여백 -->
		</div>
	</div>

<%@ include file="../public/footer.jsp" %> 
</body>
</html>