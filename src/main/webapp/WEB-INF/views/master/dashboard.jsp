<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>관리자 모드</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 최신 문서로 -->
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- 구글 폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@1,600&display=swap"
	rel="stylesheet">
<!-- 구역 나눔 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style type="text/css">
a:link {
	color: black;
}

a:visited {
	color: black;
}

a:hover {
	color: red;
}

a:active {
	color: black;
}

p {
	height: 15rem;
	object-fit: cover;
}

.text-setting {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	
}

.block-margin-set {
	margin: 15px;
	margin-left: 37px;
}

#font_title {
	font-weight: bold;
	font-size: 14px;
}

</style>
<!--  default 페이지 css -->
<link rel="stylesheet" href="/resources/public/css/paging_page.css">
<!-- 사이드바 -->
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<!-- 모든 부트스트랩 키우는 설정 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/master/css/dashboard.css" />
<link rel="stylesheet" href="resources/master/css/dashboard.css?var=1">

<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- /사이드바 -->

<!-- 카드 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<!-- 차트 부트스트랩 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="page-wrapper">
		<!-- 사이드바 -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="/">메인 페이지로 나가기</a></li>
				<li><a href="management">회원 관리</a></li>
				<li><a href="visitlist">월별 통계</a></li>
				<li><a href="asklist">1:1 문의</a></li>
				<li><a href="noticewrite">공지사항 글쓰기</a></li>
				<li><a href="companyinfo">회사 정보 관리</a></li>
			</ul>
		</div>
		<!-- /사이드바 -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-4 block-margin-set">
					<div class="title_box medium" id="font_title">3개월 간 방문자 동향</div>
					<br>
					<br>
					<!-- 차트 -->
					<div class="container">
						<canvas id="myChart" onclick="location.href='visitlist'"></canvas>
					</div>

					<!-- 차트 자바스크립트 -->
					<script>
						let graphlist = JSON.parse('${graphlist}');
						var count = new Array();
						for (let i = 0; i < graphlist.length; i++) {
							count[i] = graphlist[i].COUNT;
						}
						var ctx = document.getElementById('myChart');
						var myChart = new Chart(ctx, {
							type : 'bar',
							data : {
								labels : [ '2달 전', '1달 전', '이번 달' ],
								datasets : [ {
									label : '방문자 수',
									data : count,
									backgroundColor : [
											'rgba(255, 99, 132, 0.2)',
											'rgba(54, 162, 235, 0.2)',
											'rgba(255, 206, 86, 0.2)', ],
									borderColor : [ 'rgba(255, 99, 132, 1)',
											'rgba(54, 162, 235, 1)',
											'rgba(255, 206, 86, 1)', ],
									borderWidth : 1
								} ]
							},
							options : {
								scales : {
									yAxes : [ {
										ticks : {
											beginAtZero : true
										}
									} ]
								}
							}
						});
					</script>
				</div>
				<div class="col-sm-4 block-margin-set">
					<div class="title_box medium" id="font_title">나의 알림</div>
					<br>
					<div class="container">
						<div class="card-columns">
							<div class="card bg-light">
								<div class="card-body text-center">
									<div class="text-setting">
										<p class="card-text">
											읽지 않은 문의<br><span class="badge" style="background-color: #49cfd7">${unread }</span>
										</p>
									</div>
								</div>
							</div>
							<div class="card bg-light">
								<div class="card-body text-center">
									<div class="text-setting">
										<p class="card-text">공지 글이 ${noticeupdate }일 전 업데이트 되었습니다</p>
									</div>
								</div>
							</div>
							<div class="card bg-light">
								<div class="card-body text-center">
									<div class="text-setting">
										<p class="card-text">
											최근 등록된 글 수 <br><span class="badge"
												style="background-color: #49cfd7">${recent }</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-1"></div>
			</div>
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-4 block-margin-set"
					onclick="location.href='asklist'">
					<div class="title_box medium" id="font_title">1:1 문의</div><br>
					<div class="write_box" align="right"></div>
					<table class="table whitespace_box">
						<thead>
							<tr class="medium" align="center">
								<th width=60%>제목</th>
								<th>닉네임</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="a" items="${asklist }">
								<tr align="center">
									<td width=60% class=alignleft_box>문의 드립니다.</td>
									<td>${a.nickname}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-sm-4 block-margin-set">
					<div class="title_box medium" id="font_title">최신 글 목록</div><br>
					<div class="write_box" align="right"></div>
					<table class="table whitespace_box">
						<thead>
							<tr class="medium" align="center">
								<th>게시판</th>
								<th>게시글 수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><a href="/recipeList" style="text-decoration: none;">레시피
										게시판</a></td>
								<td>${recipe}</td>
							</tr>
							<tr>
								<td><a href="/party_paging" style="text-decoration: none;">파티
										게시판</a></td>
								<td>${party}</td>
							</tr>
							<tr>
								<td><a href="/foodList" style="text-decoration: none;">안주
										게시판</a></td>
								<td>${food}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-sm-1"></div>
			</div>
		</div>
	</div>
</body>
</html>
