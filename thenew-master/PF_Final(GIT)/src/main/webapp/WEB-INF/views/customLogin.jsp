<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="includes/header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">로그인 페이지</h3>
					</div>
					<div class="panel-body">
						<form role="form" method='post' action="${pageContext.request.contextPath}/login">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="userid"
										name="username" type="text" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Password"
										name="password" type="password" value="">
								</div>
								<div class="checkbox">
									<label> <input name="remember-me" type="checkbox">Remember Me </label>
								</div>
								<!-- Change this to a button or input when using this as a form -->
								<a href="index.html" class="btn btn-lg btn-success btn-block">로그인</a>
							</fieldset>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
					</div>
					<div class="panel-footer">
					<a href="${pageContext.request.contextPath}/member/insert">
						<button type="button" class="btn btn-xs btn-block">회원 가입</button>
					</a>
				</div>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>
  	
  	<script>
  		$(".btn-success").on("click", function(e) {
  			e.preventDefault();
  			$("form").submit();
  		});
  	</script>
  
	<c:if test="${param.logout != null}">
		<script>
			$(document).ready(function() {
				alert("로그아웃하였습니다.");
			});
      	</script>
	</c:if>  
	
<%@include file="includes/footer.jsp"%>
