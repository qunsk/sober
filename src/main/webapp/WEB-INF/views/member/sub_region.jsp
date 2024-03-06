<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<option value="">시·구·군 선택</option>
<c:forEach var="i" items="${arr}">
	<option value="${i}">${i}</option>
</c:forEach>