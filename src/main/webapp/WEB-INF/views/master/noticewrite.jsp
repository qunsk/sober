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
<script type="text/javascript" src="/resources/master/js/noticewrite.js?ver=1"></script>
<link rel="stylesheet" href="/resources/master/css/titletext.css">
</head>
<body>
<%@ include file="masterheader.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2 container"></div>
			<!-- 좌측 빈 여백  -->

			<div class="col-lg-8 container" align="center">

				<!--  id=nav_active 가 빠지면 안됩니다. 헤더의 보라색 바를 표시하기 위한 id값입니다.  -->
				<div class="title_box medium" id="title-set">공지 글 작성</div>
				<div>
				<div class="write_box" align="right">
					<div align="left">
						
					</div>
				</div>

					<form id="notice_write" method="post" action="noticewrite_check"
						enctype="multipart/form-data">
						<!-- <input type="hidden" name="notice_type" id="notice_t" value=""> -->
						<br> <br>
						<table width="835" align="center">
							<tr>
								<td style="padding-bottom: 20px;">
									<select id="notice_type" name="notice_type">
										<option value="" hidden="">선택</option>
										<option value="공지">공지</option>
										<option value="행사">행사</option>
									</select>
								</td>
							</tr>
							<tr>
								<td><input id="notice_title" name="notice_title"
									placeholder="제목을 입력해주세요." style="width: 800px; height: 35px;"></td>
							</tr>
							<tr>
								<td><div id="smartediter">
										<textarea name="notice_content" id="notice_content"
											colspan="3" style="width: 800px; height: 300px;">
								</textarea>
									</div></td>
							</tr>
						</table>

						<br> <br> <input type="submit" id="writeBtn" value="글작성"
							class="btn btn-info" onsubmit="submitPost()" onclick="return check()"><br> <br>
						<br> <br>
					</form>

				</div>
			</div>


			<div class="col-lg-2 container"></div>
			<!-- 우측 빈 여백 -->
		</div>
	</div>
	<!--  end main -->
</body>
</html>
<script src="/resources/master/js/smartEditor.js"></script>