<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>405 Method not allowed</title>
<script src="https://kit.fontawesome.com/9d99782253.js"
	crossorigin="anonymous"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap')
	;

* {
	font-family: 'Noto Sans KR', sans-serif;
	text-decoration: none;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	text-align: center;
	padding: 50px;
	background-color: #f0f2f5;
}

h1 {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 50px;
	font-weight: bold;
	margin-bottom: 30px;
	color: #333;
}

p {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 500;
	font-size: 18px;
	margin-bottom: 20px;
	color: #777;
}

hr {
	width: 40%;
	border: 1px solid #cccccc;
	margin-bottom: 40px;
}

a {
	transition: background-color 0.2s ease;
}

.bold {
	box-shadow: 1px 1px 1px 1px #9FA0A4;
	text-align: center;
	display: inline-block;
	padding: 10px 20px;
	background-color: #D9FF2A;
	color: #000;
	text-decoration: none;
	border-radius: 4px;
	font-weight: bold;
}

.home:hover {
	background-color: #3f81c1;
}

.section-link {
	display: inline-block;
	padding: 10px 20px;
	background-color: #9b9b9b;
	color: #fff;
	text-decoration: none;
	border-radius: 4px;
	margin: 10px;
	font-weight: 500;
	letter-spacing: 0.5px;
}

.section-link:hover {
	background-color: #898989;
}


.error_box {
	border: 1px solid #ddd;
	border-left: none;
	border-right: none;
	text-align: left;
	padding: 30px 50px 30px 20px;
	width: 35%;
}

.board_link_bold {
	font-weight: 500;
	font-size: 13pt;
	color: black;
}

.board_link_medium {
	font-weight: light;
}

.icon-link-box {
	width: 450px;
	display: flex;
	justify-content: left;
	text-align: left;
}
.minifontsize{
   font-size:10pt;
}


</style>

</head>
<body align=center>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div>
		<img src="/resources/public/img/405image.png"
			style="width: 200px; height: 200px;">
	</div>

	<h1 class="notfound">405 Method not allowed</h1>
	<p class="notfound">페이지를 찾을 수 없습니다. 다시 시도해주세요.</p>
	<a href="/" class="bold">홈으로 가기</a>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div align=center>


		<div class="error_box">
			<table width=100%>
				<tr>
					<td width=80%>
						<div class="icon-link-box">
							<img alt="HTML" src="/resources/public/img/cocktail-icon.png" width=50px;
								height=50px;> &nbsp;&nbsp;&nbsp; <a href="/recipeList" 
								class="board_link_bold" style="text-decoration: none; ">칵테일
								게시판<br><span class="minifontsize">칵테일 재료를 선택해서 원하는 칵테일 레시피를 찾기</span></a>
						</div>
					</td>
					<td width=20% align=right><a href="/recipeList"><svg
							xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-arrow-right-square-fill"
							viewBox="0 0 16 16">
    <path
								d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z" />
    </svg></a></td>
				</tr>
			</table>
		</div>


		<div class="error_box">
			<table width=100%>
				<tr>
					<td width=60%>
						<div class="icon-link-box">
							<img alt="HTML" src="/resources/public/img/party-icon.png" width=50px;
								height=50px;> &nbsp;&nbsp;&nbsp; <a href="/party_paging"
								class="board_link_bold" style="text-decoration: none;">파티
								게시판<br><span class="minifontsize">칵테일 파티 개최하거나 참석하기</span></a>
						</div>
					</td>
					<td width=40% align=right><a href="/party_paging"><svg
							xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-arrow-right-square-fill"
							viewBox="0 0 16 16">
    <path
								d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z" />
    </svg></a></td>
				</tr>
			</table>
		</div>


		<div class="error_box">
			<table width=100%>
				<tr>
					<td width=60%>
						<div class="icon-link-box">
							<img alt="HTML" src="/resources/public/img/dish-icon.png" width=50px;
								height=50px;> &nbsp;&nbsp;&nbsp; <a href="/foodList"
								class="board_link_bold" style="text-decoration: none;">안주
								게시판<br><span class="minifontsize">칵테일과 어울리는 안주 추천</span></a>
						</div>
					</td>
					<td width=40% align=right><a href="/foodList"><svg
							xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-arrow-right-square-fill"
							viewBox="0 0 16 16">
    <path
								d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z" />
    </svg></a></td>
				</tr>
			</table>
		</div>


		<div class="error_box">
			<table width=100%>
				<tr>
					<td width=60%>
						<div class="icon-link-box">
							<img alt="HTML" src="/resources/public/img/news-icon.png" width=50px;
								height=50px;> &nbsp;&nbsp;&nbsp; <a href="/noticelist"
								class="board_link_bold" style="text-decoration: none;">뉴스
								게시판<br><span class="minifontsize">조주기능사 정보/칵테일 원데이 클래스</span></a>
						</div>
					</td>
					<td width=40% align=right><a href="/noticelist"><svg
							xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-arrow-right-square-fill"
							viewBox="0 0 16 16">
    <path
								d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z" />
    </svg></a></td>
				</tr>
			</table>
		</div>



	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>