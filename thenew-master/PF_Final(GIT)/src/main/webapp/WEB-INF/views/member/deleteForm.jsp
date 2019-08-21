<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="member.delete.title"/></title>
<style type="text/css">
	div{
		width:600px;
		margin:0 auto;
	}
</style>
</head>
<body>
<div>
	<h2><spring:message code="member.delete.title"/></h2>
	<form action="deletePro" method="post">
		<!-- param:내장객체, request랑 같음 -->
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="userid" value="${param.userid}">
		<input type="submit" value="삭제할까요?	">
		<input type="button" value="취소" onclick="history.back();">
	</form>
</div>
</body>
</html>