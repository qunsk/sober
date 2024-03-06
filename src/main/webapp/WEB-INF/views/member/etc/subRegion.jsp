<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/member/css/join.css" />
</head>
<body>

<label for="sub_region" class="category"></label>&nbsp;
<select id="sub_region" name="sub_region" class="form-control sub_region">
  <option value="">시·구·군 선택</option>
   <c:forEach var="i" items="${arr}">
   <option value="${i}">${i}</option>
   </c:forEach>
</select>

</body>
</html>