<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 찾기</title>
<link rel="stylesheet" type="text/css"
	href="/resources/member/css/findid.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/public/css/paging_page.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/member/js/findid.js"></script>
</head>
<body>
	<%@ include file="etc/miniheader.jsp"%>
	<c:if test="${empty idOk}">
		<div class="main">
			<form method="post" action="find_id_ok" onsubmit="return check()">
				<div class="join_form" align="center">
					<input id="name" name="name" placeholder="이름"
						class="form-control input_name">
				</div>
				<br>
				<div align=center>
					<input id="phone" name="phone" placeholder="휴대폰 번호"
						class="form-control input"> <input type="button"
						id="phoneChk" class="button" value="인증번호 전송" /><br> <br>
					<input id="phone_certify" name="phone_certify"
						class="form-control input3"> <input type="button"
						id="phoneChk2" class="button" value="인증하기"> <br> <span
						class="point successPhoneChk">휴대폰 번호는 '-' 없이 번호만 입력하세요.</span> <input
						type="hidden" id="phoneDoubleChk" />
				</div>
				<br>

				<div align=center>
					<input type="button" value="닫기" onclick="self.close();"
						class="closeBtn"> <input type="submit" value="찾기"
						class="submitBtn">
				</div>
			</form>
		</div>
	</c:if>

	<c:if test="${!empty idOk}">
		<div class="main2">
			<div align="center">
				<c:choose>
					<c:when test="${!empty dbmember }">
						<c:forEach var="member" items="${dbmember}">
							<label for=find_Id class="fID1">ID:</label>
							<label for=find_Id class="fID2">${member.id}</label>
							<br />
						</c:forEach>
					</c:when>
					<c:otherwise>
								<label for=find_Id class="fID1">일치하는 정보가 없습니다.</label>
					</c:otherwise>
				</c:choose>
			</div>
			<br> <br> <br> <br>
			<div align="center">
				<input type="button" value="닫기" onclick="self.close();"
					class="closeBtn">
			</div>
		</div>
	</c:if>
</body>
</html>