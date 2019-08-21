<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 발생</title>
</head>
<body>
요청을 처리하는 과정에서 문제가 발생했습니다.
<%
	Throwable exception = (Throwable)request.getAttribute("exception");
	exception.printStackTrace();
%>
</body>
</html>