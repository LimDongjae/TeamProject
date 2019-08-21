<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header"><spring:message code="member.list.title"/></h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<a href="${pageContext.request.contextPath}/company/clist"><button type="button" class="btn btn-xs pull-right">기업 회원 보기</button></a>
			</div>
			
			<div class="panel-body">
				<!-- count가 0보다 크면 뿌림 -->
				<c:if test="${count == 0}">
					<div align="center">출력할 내용이 없습니다.</div>
				</c:if>
				<c:if test="${count > 0}">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>연락처</th>
								<th>이메일</th>
								<th>가입일자</th>
							</tr>
						</thead>
						<c:forEach var="member" items="${list}">
							<tr>
								<td width="100"><a href="detail?userid=${member.userid}">${member.userid}</a></td>
								<td width="200">${member.username}</td>
								<td width="200">${member.userphone}</td>
								<td width="200">${member.useremail}</td>
								<td width="200">${member.regdate}</td>
							</tr>
						</c:forEach>
					</table>
					<div class='pull-right'>
						<ul class="pagination">
							${pagingHtml}
						</ul>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</div>
<%@include file="../includes/footer.jsp"%>