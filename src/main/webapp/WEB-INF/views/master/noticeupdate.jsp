<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글 작성</title>
<script type="text/javascript"
	src="resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="/resources/master/js/noticeupdate.js?ver=1"></script>

</head>
<body>
	<%@ include file="../public/header.jsp"%>

	<c:if test="${ ! empty result }">
		<script>
			alert("게시글 삭제 완료.");
		</script>
	</c:if>


	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2 container"></div>
			<!-- 좌측 빈 여백  -->

			<div class="col-lg-8 container">
				<div class="write_box" align="right"></div>
				<div>
					<form id="noticeupdate" method="post" action="noticeupdate_check">
						<input type="hidden" name="notice_no" value="${notice.notice_no }">
						<input type="hidden" name="pageNum" value="${pageNum }">
						<table width="835" align="center">
							<tr>
								<td><select id="notice_type" name="notice_type">
										<option value="공지"
											${(notice.notice_type == '공지')? "selected": ""}>공지</option>
										<option value="행사"
											${(notice.notice_type == '행사')? "selected": ""}>행사</option>
								</select></td>

							</tr>
							<tr>
								<td><input id="notice_title" name="notice_title"
									value="${notice.notice_title}"
									style="width: 800px; height: 35px;"></td>
							</tr>
							<tr>
								<td><div id="smartediter">
										<textarea name="notice_content" id="notice_content"
											colspan="3" style="width: 800px; height: 300px;">${notice.notice_content}
								</textarea>
									</div></td>
							</tr>
						</table>

						<br> <br> <input type="submit" value="글수정" onsubmit="submitPost()" onclick="return checktwo()"><br>
						<br> <br> <br>
					</form>

				</div>

			</div>
			<!-- 가운데 컨텐트 들어갈 곳 -->

			<div class="col-lg-2 container"></div>
			<!-- 우측 빈 여백 -->

		</div>
	</div>
	<!--  end main -->

	<%@ include file="../public/footer.jsp"%>
</body>
</html>
<script src="/resources/master/js/smartEditor.js"></script>