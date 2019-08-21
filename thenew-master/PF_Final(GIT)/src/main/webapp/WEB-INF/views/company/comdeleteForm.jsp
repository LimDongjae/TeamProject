<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="company.delete.title"/></title>
<style type="text/css">
	div{
		width:600px;
		margin:0 auto;
	}
</style>
</head>
<body>
<div>
	<h2><spring:message code="company.delete.title"/></h2>
	<form action="cdeletePro">
		<!-- param:내장객체, request랑 같음 -->
		<input type="hidden" name="compid" value="${param.compid}">
		<input type="submit" value="삭제할까요?	">
		<input type="button" value="취소" onclick="location.href='clist'">
	</form>
</div>
</body>
</html>