<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
</div>
<!-- /#page-wrapper -->

<!-- footer -->
<style>
html,body {
  font-family: Arial, Helvetica, Sans-serif;
  
}
/* STYLES SPECIFIC TO FOOTER  */
.footer {
  width: 100%;
  position: static;
  height: 100%;
  margin-top: 5%;
  border-top: 1px solid #a6a6a6;
  background-color: #d9d9d9;
}
.footer .col {
  width: 490px;
  float: left;
  box-sizing: border-box;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  padding: 5px 20px 20px 20px;
}
.footer .col h1 {
  margin: 0px;
  padding: 5px;
  font-family: inherit;
  font-size: 17px;
  line-height: 14px;
  padding: 20px 0px 5px 0px;
  color: #070617;
  font-weight: bold;
  text-transform: uppercase;
  letter-spacing: 0.250em;
}
.footer .col ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}
.footer .col ul li{
  color: #999999;
  font-size: 14px;
  font-family: inherit;
  font-weight: bold;
  padding: 3px 0px 3px 0px;
  cursor: pointer;
  transition: .2s;
  -webkit-transition: .2s;
  -moz-transition: .2s;
  margin-top: 10px;
}
.footer .col ul li a{
  color: #999999;
  font-size: 14px;
  font-family: inherit;
  font-weight: bold;
  padding: 5px 0px 5px 0px;
  cursor: pointer;
  transition: .2s;
  text-decoration: none;
  -webkit-transition: .2s;
  -moz-transition: .2s;
  margin-top: 10px;
}
.social ul li {
  display: inline-block;
  padding-right: 5px !important;
}

.footer .col ul li a:hover {
  color: #070617;
  text-decoration: none;
  transition: .1s;
  -webkit-transition: .1s;
  -moz-transition: .1s;
}
.clearfix {
  clear: both;
}
@media only screen and (min-width: 1280px) {
  .contain {
    width: 1600px;
    margin: 0 auto;
  }
}
@media only screen and (max-width: 1139px) {
  .contain .social {
    width: 1000px;
    display: block;
  }
  .social h1 {
    margin: 0px;
  }
}
@media only screen and (max-width: 950px) {
  .footer .col {
    width: 33%;
  }
  .footer .col h1 {
    font-size: 14px;
  }
  .footer .col ul li {
    font-size: 13px;
  }
}
@media only screen and (max-width: 500px) {
    .footer .col {
      width: 50%;
    }
    .footer .col h1 {
      font-size: 14px;
    }
    .footer .col ul li {
      font-size: 13px;
    }
}
@media only screen and (max-width: 340px) {
  .footer .col {
    width: 100%;
  }
}
</style>

<!-- FOOTER START -->
<div class="footer">
  <div class="contain">
  <div class="col">
    <h1>회사소개</h1>
    <ul>
      <li><a href="${pageContext.request.contextPath}/main/aboutCompany">중앙24?</a></li>
      <li><a href="${pageContext.request.contextPath}/main/aboutMember">팀원 소개</a></li>
      <li><a href="${pageContext.request.contextPath}/main/aboutHistory">연혁</a></li>
    </ul>
  </div>
  <div class="col">
    <h1>서비스</h1>
    <ul>
      <li><a href="${pageContext.request.contextPath}/estimate/estimatelist">견적게시판</a></li>
      <li><a href="${pageContext.request.contextPath}/companySearch/list">업체검색</a></li>
      <li><a href="${pageContext.request.contextPath}/board/list">후기게시판</a></li>     
    </ul>
  </div>
  <div class="col">
    <h1>Contact Us</h1>
    <ul>
      <li><i class="fa fa-phone"></i> Phone: 02 - 242 - 2424</li>
      <li><i class="fa fa-mobile"></i> Mobile: 010 - 2424 - 2424</li>
      <li><i class="fa fa-envelope-o"></i> Email: 24welcome@gmail.com</li>
      <li><i class="fa fa-map-marker"></i> <a href="${pageContext.request.contextPath}/main/aboutLocation"> 오시는 길</a></li>
    </ul>
  </div>

<div class="clearfix"></div>
</div>
</div>
<!-- END OF FOOTER -->


</div>
<!-- /#wrapper -->
<!-- header에 존재하는 wrapper와 page-wrapper를 닫는다. -->




<!-- jQuery 주석처리 -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Bootstrap Core JavaScript -->
<script
	src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script
	src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script
	src="${pageContext.request.contextPath}/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

<!-- Custom Theme JavaScript -->
<script
	src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
	$(document).ready(
			function() {
				$('#dataTables-example').DataTable({
					responsive : true
				});
				$(".sidebar-nav").attr("class",
						"sidebar-nav navbar-collapse collapse").attr(
						"aria-expanded", 'false').attr("style", "height:1px");
			});
</script>

</body>



</html>
