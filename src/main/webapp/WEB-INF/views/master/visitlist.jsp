<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<!-- <html lang="en" style="height: 100%"> -->

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>월별 통계</title>
<!--  구글 폰트 ROBOTO MONO-->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@1,600&display=swap" rel="stylesheet">
<!-- <link rel="shortcut icon" href="#"> -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<link rel="stylesheet" href="/resources/master/css/titletext.css">
	<!-- 부트스트랩 -->
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
<%@ include file="masterheader.jsp" %>
	<div class="container" align="center">
		<div class="row my-3">
			<div class="col" align="center" id="title-set">
				월별 방문자 수 추이
				<br><br>
			</div>
		</div>
		<div class="row my-2">
			<div class="col">
				<div class="card">
					<div class="card-body">
						<canvas id="myChart" height="100" width="250"></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="row my-1">
			<div class="col">
				<div class="card bg">
					<div class="card-body text-center">
						<table class="table" style="height:253px; overflow: scroll; display:block">
							<thead>
								<tr>
									<th>오늘 방문자 IP</th>
									<th>방문 시간</th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${empty iplist }">
								<tr>
								<td colspan="2">
								오늘 방문한 이용자가 없습니다.
								</td>
								</tr>
							</c:if>
							<c:if test="${not empty iplist }">
								<c:forEach var="iplist" items="${iplist}">
									<tr style="overflow: scroll;">
										<td>${iplist.visit_ip }</td>
										<td>
										<fmt:formatDate value="${iplist.visit_time }" pattern="HH:mm:ss"/>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<div class="card-body text-center">
						<table class="table">
							<thead>
								<tr>
									<th>방문자 경로</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>네이버 포털 검색</td>
									<td>${naver}</td>
								</tr>
								<tr>
									<td>구글 포털 검색</td>
									<td>${google }</td>
								</tr>
								<tr>
									<td>그 외 경로(직접입력 포함)</td>
									<td>${host }</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 차트 -->
	<script>
		let total = JSON.parse('${month}');
		console.log(total[0].MONTH);
		console.log(total[0].COUNT);
		console.log(total.length);
		var month = new Array();
		var count = new Array();
		for (let i = 1; i < total.length; i++) {
			month[i - 1] = total[i].MONTH;
			count[i - 1] = total[i].COUNT;
		}

		var ctx = document.getElementById('myChart').getContext('2d');
		var chart = new Chart(ctx, {
			// 챠트 종류를 선택
			type : 'line',

			// 챠트를 그릴 데이타
			data : {
				labels : month,
				datasets : [ {
					label : '최근 1년간 방문자 수',
					backgroundColor : 'transparent',
					borderColor : 'red',
					data : count
				} ]
			},
			// 옵션
			options : {
				legend : {
					display : false
				},
				title : {
					display : true,
					text : '방문자 통계'
				}

			}
		});
	</script>
</body>

</html>