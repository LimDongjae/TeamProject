<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Company Register</h1>	
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			
			<div class="panel-heading">Company Register</div>
			<div class="panel-body">
				<form role="form" action="/company/register" method="post">
					<div class="form-group">
						<label>기업 이름</label>
							<input class="form-control" name='compName'>
					</div>
					<div class="form-group">
						<label>기업 아이디</label>
							<input class="form-control" name='compId'>
					</div>
					<div class="form-group">
						<label>기업 도메인</label>
							<input class="form-control" name='compDomain'>
					</div>
					<div class="form-group">
						<label>기업 번호</label>
							<input class="form-control" name='compPhone'>
					</div>
					<div class="form-group">
						<label>기업 소개</label>
							<textarea class="form-control" rows="3" name='compContent'>
							</textarea>
					</div>
					<div class="form-group">
						<label>기업 설립일</label>
							<input class="form-control" name='compDate'>
					</div>
					
									
				</form>
			</div>
		</div>
	</div>
</div>

 <%@ include file="../includes/footer.jsp" %>