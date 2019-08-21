<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="../includes/header.jsp"%>
<style type="text/css">
	.error-color {
		color:red;
	}
</style>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header"><spring:message code="member.insert.title"/></h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">  
				<div class="panel-body">
					<form:form modelAttribute="memberVO"><!-- memberCommand 자바빈 초기화 필요 -->
						아이디 <form:input class="form-control" path="userid"/>
						<form:errors path="userid" class="error-color"/><br>
						비밀번호 <form:password class="form-control" path="userpw"/>
						<form:errors path="userpw" class="error-color"/><br>
						이름 <form:input class="form-control" path="username"/>
						<form:errors path="username" class="error-color"/><br>
						전화번호 <form:input class="form-control" path="userphone"/>
						<form:errors path="userphone" class="error-color"/><br>
						이메일 <form:input class="form-control" path="useremail"/>
						<form:errors path="useremail" class="error-color"/><br>
						<input type="submit" class="btn btn-info" value="보내기">
					</form:form>
				</div>
				<div class="panel-footer">
					<a href="${pageContext.request.contextPath}/company/cinsert">
						<button type="button" class="btn btn-xs">기업 회원 가입</button>
					</a>
				</div>
		</div>
	</div>
</div>
<%@include file="../includes/footer.jsp"%>