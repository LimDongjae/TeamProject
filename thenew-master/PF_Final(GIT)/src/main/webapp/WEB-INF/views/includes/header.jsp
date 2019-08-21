<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<!DOCTYPE html>
<html lang="kr">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>중앙24</title>

<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/">중앙24</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						회사소개
					</a>
					<ul class="dropdown-menu dropdown-messages">
						<li>
							<a href="${pageContext.request.contextPath}/main/aboutCompany">
								<div>
									<strong>중앙24?</strong>
								</div>
							</a>
						</li>
						<li class="divider"></li>
						<li>
							<a href="${pageContext.request.contextPath}/main/aboutMember">
								<div>
									<strong>팀원 소개</strong>
								</div>
							</a>
						</li>
						<li class="divider"></li>
						<li>
							<a href="${pageContext.request.contextPath}/main/aboutHistory">
								<div>
									<strong>연혁</strong>
								</div>
							</a>
						</li>
						<li class="divider"></li>
						<li>
							<a href="${pageContext.request.contextPath}/main/aboutLocation">
								<div>
									<strong>오시는 길</strong>
								</div>
							</a>
						</li>
					</ul>
					<!-- /.dropdown-messages -->
				</li>
				<!-- /.dropdown -->
				<li class="dropdown">
					<a href="${pageContext.request.contextPath}/estimate/estimatelist">
						견적게시판
					</a>
				<!-- /.dropdown-tasks -->
				</li>
				<!-- /.dropdown -->
				
				<li class="dropdown">
					<a href="${pageContext.request.contextPath}/companySearch/list">
						업체검색
					</a>
				<!-- /.dropdown-tasks -->
				</li>
				<!-- /.dropdown -->
				
				<li class="dropdown">
					<a href="${pageContext.request.contextPath}/board/list">
						후기게시판
					</a>
				<!-- /.dropdown-alerts -->
				</li>
				<!-- /.dropdown -->
				
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-edit fa-fw"></i>
						<i class="fa fa-caret-down"></i>
					</a>
					<ul class="dropdown-menu dropdown-user">
						<sec:authorize access="isAuthenticated()">
							<li>
								<form role="form" method='post' action="${pageContext.request.contextPath}/customLogout" id="logout">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<a href="#" class="sub">
										<i class="fa fa-sign-out fa-fw"></i> 로그아웃
									</a>
								</form>
							</li>
						</sec:authorize>
						
						<sec:authorize access="hasRole('ROLE_USER')">
							<li>
								<a href="${pageContext.request.contextPath}/member/detail?userid=<sec:authentication property="principal.username"/>">
									<i class="fa fa-user fa-fw"></i> 회원정보
								</a>
							</li>
						</sec:authorize>
						
						<sec:authorize access="hasRole('ROLE_COMPANY')">
							<li>
								<a href="${pageContext.request.contextPath}/company/cdetail?compid=<sec:authentication property="principal.username"/>">
									<i class="fa fa-building fa-fw"></i> 기업회원정보
								</a>
							</li>
						</sec:authorize>
						
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li>
								<a href="${pageContext.request.contextPath}/member/list">
									<i class="fa fa-users fa-fw"></i> 회원관리
								</a>
							</li>
						</sec:authorize>
						
						<sec:authorize access="isAnonymous()">
							<li>
								<a href="${pageContext.request.contextPath}/customLogin">
									<i class="fa fa-sign-in fa-fw"></i> 로그인
								</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/member/insert">
									<i class="fa fa-user-plus fa-fw"></i> 회원가입
								</a>
							</li>
						</sec:authorize>
					</ul>
				<!-- /.dropdown-user -->
				</li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->

		</nav>
	</div>
		<div id="page-wrapper">
		
	
			<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			
	<script>
		$(".sub").on("click", function(e) {
			var a = confirm("로그아웃 하시겠습니까?");
			if(a == true) {
				e.preventDefault();
				$("#logout").submit();
			}
		});
	</script>