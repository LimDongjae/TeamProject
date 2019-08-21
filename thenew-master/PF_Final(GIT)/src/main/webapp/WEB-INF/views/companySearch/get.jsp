<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">기업 상세 정보</h1>	
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			
			<div class="panel-heading">기업 정보 페이지</div>
			<div class="panel-body">
			
								
					<div class="form-group">
						<label>기업 이름</label>
						<input class="form-control" name='CompName' value='${company.compName }' readonly="readonly">
					</div>
			
			
					<div class="form-group">
						<label>기업 ID</label>
						<input class="form-control" name='CompId' value='<c:out value="${company.compId }"/>' readonly="readonly">
					</div>
					
				
					
					<div class="form-group">
							<label>기업 도메인</label>
							<input class="form-control" name='CompDomain' value='<c:out value="${company.compDomain }"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
							<label>기업 전화번호</label>
							<input class="form-control" name='CompPhone' value='<c:out value="${company.compPhone }"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>기업 업종</label>
						<textarea class="form-control" rows="3" name='CompContent' readonly="readonly"><c:out value="${company.compContent}" /></textarea>
					</div>
					
					<div class="form-group">
							<label>기업 설립일</label>
							<input class="form-control" name='CompDate' value='<c:out value="${company.compDate }"/>' readonly="readonly">
					</div>
				
					
					<button data-oper='list' class="btn btn-info" onclick="location.href='${pageContext.request.contextPath}/companySearch/list'">목록</button>
					<form id='operForm' action="/companySearch/list" method="get">
						<input type='hidden' id='compId' name='compName' value='<c:out value="${company.compId }"/>'>
						<input type='hidden'  name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
						<input type='hidden'  name='amount' value='<c:out value="${cri.amount }"/>'>
						<input type='hidden'  name='keyword' value='<c:out value="${cri.keyword }"/>'>
						<input type='hidden'  name='type' value='<c:out value="${cri.type }"/>'>
					</form>
			</div>
		</div>
	</div>
</div>

 <%@ include file="../includes/footer.jsp" %>