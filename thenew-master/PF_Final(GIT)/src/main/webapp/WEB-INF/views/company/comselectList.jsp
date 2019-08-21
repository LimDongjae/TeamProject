<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header"><spring:message code="company.list.title"/></h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
			
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
            <th width="100">사업자아이디</th>
            <th width="200">상호</th>
            <th width="200">설립일자</th>
            <th width="200">업종</th>
            <th width="200">연락처</th>
            <th width="200">홈페이지</th>
            <th width="200">등록일자</th>
         </tr>
         </thead>
         <c:forEach var="company" items="${list}">
            <tr>
            <td width="100"><a href="cdetail?compid=${company.compid}">${company.compid}</a></td>
            <td width="200">${company.compname}</td>
            <td width="200">
            <fmt:formatDate pattern="yyyy-MM-dd" value="${company.compdate}" /></td>
            <td width="200">${company.compcontent}</td>
            <td width="200">${company.compphone}</td>
            <td width="200">${company.compdomain}</td>
            <td width="200">${company.regdate}</td>
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