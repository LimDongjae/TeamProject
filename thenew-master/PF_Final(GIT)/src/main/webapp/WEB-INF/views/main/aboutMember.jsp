<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>

<style>
/*Now the CSS*/
* {
	margin: auto;
	padding: 0;
}

.tree {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 800px;
	height: 500px;
}

.tree ul {
	padding-top: 20px;
	position: relative;
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}

.tree li {
	float: left;
	text-align: center;
	list-style-type: none;
	position: relative;
	padding: 20px 5px 0 5px;
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}
/*We will use ::before and ::after to draw the connectors*/
.tree li::before, .tree li::after {
	content: '';
	position: absolute;
	top: 0;
	right: 50%;
	border-top: 3px solid #ccc;
	width: 50%;
	height: 20px;
}

.tree li:after {
	right: auto;
	left: 50%;
	border-left: 3px solid #ccc;
}
/*We need to remove left-right connectors from elements without 
any siblings*/
.tree li:only-child::after, .tree li:only-child::before {
	display: none;
}
/*Remove space from the top of single children*/
.tree li:only-child {
	padding-top: 0;
}
/*Remove left connector from first child and 
right connector from last child*/
.tree li:first-child::before, .tree li:last-child::after {
	border: 0 none;
}
/*Adding back the vertical connector to the last nodes*/
.tree li:last-child::before {
	border-right: 1px solid #ccc;
	border-radius: 0 5px 0 0;
	-webkit-border-radius: 0 5px 0 0;
	-moz-border-radius: 0 5px 0 0;
}

.tree li:first-child::after {
	border-radius: 5px 0 0 0;
	-webkit-border-radius: 5px 0 0 0;
	-moz-border-radius: 5px 0 0 0;
}
/*Time to add downward connectors from parents*/
.tree ul ul::before {
	content: '';
	position: absolute;
	top: 0;
	left: 50%;
	border-left: 3px solid #ccc;
	width: 0;
	height: 20px;
	margin-left: -1px;
}

.tree li a {
	border: 5px solid #ccc;
	padding: 5px 10px;
	text-decoration: none;
	color: #666;
	font-family: arial, verdana, tahoma;
	font-size: 20px;
	display: inline-block;
	border-radius: 5px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}

.tree li h1 {
	padding: 5px 10px;
	text-decoration: none;
	color: black;
	font-family: arial, verdana, tahoma;
	font-size: 40px;
	display: inline-block;
	border-radius: 5px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}

.tree li h2 {
	padding: 5px 10px;
	text-decoration: none;
	color: black;
	font-family: arial, verdana, tahoma;
	font-size: 30px;
	display: inline-block;
	border-radius: 5px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}
/*Time for some hover effects*/
/*We will apply the hover effect the the lineage of the element also*/
.tree li a:hover, .tree li a:hover+ul li a {
	background: #c8e4f8;
	color: #000;
	border: 5px solid #94a0b4;
}
/*Connector styles on hover*/
.tree li a:hover+ul li::after, .tree li a:hover+ul li::before, .tree li a:hover+ul::before,
	.tree li a:hover+ul ul::before {
	border-color: #94a0b4;
}

li a.just-line {
	display: none;
}

a.just-line+ul {
	padding-top: 74px;
}

a.just-line+ul:before {
	height: 74px;
}
</style>

<div class="tree">
	<h3>&#60;중앙24 조직도&#62;</h3>
	<ul>
		<li><a href="#"><h1>김현종</h1>
				<br />팀장 </a>

			<ul>
				<li><a href="#"><h2>남대영</h2>
						<br />팀원<br /> </a></li>
				<li><a href="#"><h2>민동혁</h2>
						<br />팀원<br /> </a></li>
				<li><a href="#"><h2>이강원</h2>
						<br />팀원<br /> </a></li>
				<li><a href="#"><h2>임동재</h2>
						<br />팀원<br /> </a></li>
				<li><a href="#"><h2>주홍섭</h2>
						<br />팀원<br /> </a></li>
			</ul></li>
	</ul>
</div>

<%@include file="../includes/footer.jsp"%>