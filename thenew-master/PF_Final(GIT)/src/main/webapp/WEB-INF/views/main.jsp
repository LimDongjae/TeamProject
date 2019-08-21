<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<style>
@import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro);
@import url(http://weloveiconfonts.com/api/?family=fontawesome);

/* fontawesome */
[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sans-serif;
}

html,
body {
  width: 100%;
  height: 100%;
  overflow: hidden;
}

p {
  text-decoration: none; 
  color: white;
  font-size: 3.2em;
  font-family: "Source Sans Pro", Lato, sans-serif;
  font-weight: 400;
}

p span {
  position: absolute;
  top: -1.5em;
  left: 50%;
  margin-left: -0.5em;
  font-size: 1.5em;
}

#main-wrapper {
  width: 100%;
  height: 100%;
}

.box {
  width: 50%;
  height: 50%;
  position: absolute;
  text-align: center;
  transition: all ease-out 0.3s;
  user-select: none;
  cursor: pointer;
}
.box:hover .box-content {
  margin-top: -2em;
}
.box .box-content {
  height: 100%;
  position: relative;
  top: 50%;
  margin-top: -1em;
  text-transform: uppercase;
  transition: margin-top 0.2s;
  -webkit-transition: margin-top 0.2s ease-in-out;
}

.box.clicked {
    left: 0;
    top: 0;
    right: 0;
    bottom: 0;
    width: 100%;
    height: 100%;
    z-index: 2;
}
.work {
  top: 0;
  left: 0;
  background-color: #ed4a0d;
}
.projects {
  top: 0;
  left: 50%;
  background-color: #35aa69;
}
.about {
  top: 50%;
  left: 0;
  background-color: #3567aa;
}
.contact {
  top: 50%;
  left: 50%;
  background-color: orange;
}
</style>

<div id="container">
  <section class="box work" data-class="has-work">	
	<div class="box-content">
		
    <p><span class="fontawesome-truck"></span>쉽다</p>
	</div>
</section> 

<section class="box projects">
	<div class="box-content">
		<p><span class="fontawesome-desktop"></span>직관적</p>
	</div>
</section>

<section class="box about">
	<div class="box-content">

		<p><span class="fontawesome-comments-alt"></span>소통</p>
	</div>
</section>

<section class="box contact">
	<div class="box-content">
		<!-- Waving hand! -->
		<p><span class="fontawesome-fullscreen"></span>경쟁</p>
	</div>
</section>
</div>

<script>
$(document).ready(function() {
	//contextPath를 세션에 저장한다
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
	$('.box').click( function() {
    	$(this).toggleClass('clicked');
	});
});
</script>

<%@include file="includes/footer.jsp"%>