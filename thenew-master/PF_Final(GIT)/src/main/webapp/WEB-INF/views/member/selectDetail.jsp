<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h2><spring:message code="member.detail.title" arguments="${member.userid}"/></h2>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
		<div class="panel-body">
		<div class="form-group">
			<label>아이디</label>
			<input class="form-control" value='${member.userid}' readonly="readonly">
		</div>
		<div class="form-group">
			<label>이름</label>
			<input class="form-control" value='${member.username}' readonly="readonly">
		</div>
		<div class="form-group">
			<label>연락처</label>
			<input class="form-control" value='${member.userphone}' readonly="readonly">
		</div>
		<div class="form-group">
			<label>이메일</label>
			<input class="form-control" value='${member.useremail}' readonly="readonly">
		</div>
		<div class="form-group">
			<label>날짜</label>
			<input class="form-control" value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${member.regdate}"/>' readonly="readonly">
		</div>
		<a href="update?userid=${member.userid}"><button class="btn btn-default">수정</button></a>
		<a href="delete?userid=${member.userid}"><button class="btn btn-danger">삭제</button></a>
	
		</div>
	</div>
</div>
</div>

<%@include file="../includes/footer.jsp"%>