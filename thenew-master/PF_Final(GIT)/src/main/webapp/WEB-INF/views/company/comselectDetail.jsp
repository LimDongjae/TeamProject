<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h2><spring:message code="company.detail.title" arguments="${company.compid}"/></h2>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
		<div class="panel-body">
		<div class="form-group">
		<label>사업자아이디</label>
			<input class="form-control" value='${company.compid}' readonly="readonly">
		</div>
		<div class="form-group">
		<label>상호</label>
			<input class="form-control" value='${company.compname}' readonly="readonly">
		</div>
		<div class="form-group">
		<label>설립일자</label>
			<input class="form-control" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${company.compdate}" />' readonly="readonly">
		</div>
		<div class="form-group">
		<label>업종</label>
			<input class="form-control" value='${company.compcontent}' readonly="readonly">
		</div>
		<div class="form-group">
		<label>연락처</label>
			<input class="form-control" value='${company.compphone}' readonly="readonly">
		</div>
		<div class="form-group">
		<label>홈페이지</label>
			<input class="form-control" value='${company.compdomain}' readonly="readonly">
		</div>
		<div class="form-group">
		<label>등록일자</label>
			<input class="form-control" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${company.regdate}" />' readonly="readonly">
		</div>
		<a href="cupdate?compid=${company.compid}"><button class="btn btn-default">수정</button></a>
		<a href="cdelete?compid=${company.compid}"><button class="btn btn-danger">삭제</button></a>
</div>
	</div>
</div>
</div>

<%@include file="../includes/footer.jsp"%>