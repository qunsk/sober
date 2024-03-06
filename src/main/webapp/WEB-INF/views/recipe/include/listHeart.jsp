<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 좋아요 구현 -->
<c:choose>
	<c:when test="${! empty sessionScope.nickname }">
		<!-- 로그인 했을 때, 모든 게시물에 좋아요가 0개인 경우 -->
		<c:if test="${empty heart_sel}">
			<a href="javascript:;" idx="${recipe.r_num}" name="${recipe.nickname}" class="heart-click heart_icon${recipe.r_num}" > 
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart" style="color: red;" viewBox="0 0 16 16">
					<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
				</svg>
			</a>
		</c:if>
		<!-- 로그인 했을 때, 좋아요 여부에 따라서 아이콘 다르게 보여주기 -->
		<c:if test="${!empty heart_sel}">
			<c:set var="heartLoop" value="true" />
			<c:forEach var="heart" items="${heart_sel }">
				<c:if test="${heart.r_num == recipe.r_num}">
					<c:set var="heartLoop" value="false" />
				</c:if>
			</c:forEach>
			<!-- 로그인 한 경우 -->
			<c:choose>
				<c:when test="${heartLoop != 'false'}">
				<!-- 좋아요 안 한 경우 -->
					<a href="javascript:;" idx="${recipe.r_num}" name="${recipe.nickname}" class="heart-click heart_icon${recipe.r_num}"> 
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart" style="color: red;" viewBox="0 0 16 16">
							<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
						</svg>
					</a>
				</c:when>
				<c:otherwise>
				<!-- 좋아요 한 경우 -->
					<a href="javascript:;" idx="${recipe.r_num}" name="${recipe.nickname}" class="heart-click heart_icon${recipe.r_num}">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart-fill" style="color: red;" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
						</svg>
					</a>
				</c:otherwise>
			</c:choose>
		</c:if>
	</c:when>
	<c:when test="${empty sessionScope.nickname}">
	<!--  로그인하지 않은 경우 -->
		<a href="javascript:;" class="heart-notlogin"> 
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart" style="color: red;" viewBox="0 0 16 16">
					<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
				</svg>
			</a>
		</c:when>
	</c:choose>
<br><span id="heart${recipe.r_num}">${recipe.like_count}</span>
</body>
</html>