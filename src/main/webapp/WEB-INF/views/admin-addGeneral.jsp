<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.list-group-item {
	width: 200px;
}

li {
	list-style: none;
}
</style>

<title>Admin Management</title>
  <script type="text/javascript">
	function createTable() {
		var num = document.getElementById('rows').value;
		var theader ="<table border='1'><tr><th>Name</th>"
			+ "<th width=100>Picture</th>" + "<th width=100>Quantity</th>"
			+ "<th width=100>Price/per</th>" + "<th width=100>Sale Price</th>"
			+ "<th width=100>Description</th></tr>";
		var tbody="";
		
		for (i = 0; i < num; i++) {
			tbody += "<tr><td><input name='name' id='name' size='10' required='required' /></td>"
					+ "<td><input type='file' name='img' id='img'size='10' required='required'/></td>"
					+ "<td><input name='quantity' id='quantity' size='10' required='required' /></td>"
					+ "<td><input name='price' id='price' size='10' required='required' /></td>"
					+ "<td><input name='saleprice' id='saleprice' size='10' required='required' /></td>"
					+ "<td><input name='description' id='description' size='10' required='required' /></td></tr>";
		}
		var tfooter = "</table>";
		var sub = "<br /><input type='submit' name='btn_submit' id='btn_submit' value='Submit' />";
		//  document.getElementById("txtHint").innerHTML = table;
	//	document.getElementById("txtHint1").innerHTML = theader + tbody + tfooter;// + sub;
//		$('#txtHint1').append(theader + tbody + tfooter+sub);
		var elem = document.getElementById("action");
		elem.parentNode.removeChild(elem);
		document.getElementById("txtHint1").innerHTML = theader + tbody + tfooter+sub;
	}
	
</script>
</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<div class="container-fluid"
		style="background-color: #2196F3; color: #fff; height: 113px;">
		<h2>Admin Website</h2>
		<nav class="navbar">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<div class="collapse navbar-collapse" id="myNavbar">

					<ul class="nav navbar-nav navbar-right">
						<li><a style="font-size: 2ex; color: #fff" href="#section1">
								<i class="fa fa-users"></i>Messages
						</a></li>
						<li class="dropdown"><a style="font-size: 2ex; color: #fff"
							class="dropdown-toggle" data-toggle="dropdown"
							href="${contextPath}/admin/profile.htm">Account <span
								class="caret"></span>
						</a> <c:if test="${adm.adminName != null}">
								<ul class="dropdown-menu">
									<li><a href="${contextPath}/admin/profile.htm"><c:out
												value="${adm.adminName}" /></a></li>
									<li><a href="${contextPath}/admin/logout.htm">Logout</a></li>
								</ul>
							</c:if></li>
					</ul>
				</div>
			</div>
		</div>
		</nav>
	</div>
	<br>
	<br>
	<div class="container-fluid">
		<!-- Right Contents Show -->

		<div class="row-fluie">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar" style="margin-top: 10ex">
					<!-- 1-level menu -->
					<li><a class="btn btn-info" href="#userMeun"
						class="nav-header menu-first" data-toggle="collapse"> <i
							class="fa fa-user"></i>&nbsp;Manage Account
					</a></li>

					<li><a class="btn btn-info" href="#productMenu"
						class="nav-header menu-first collapsed" data-toggle="collapse">
							<i class="fa fa-globe"></i>&nbsp;Manage</span>
					</a></li>
					<ul id="productMenu" class="nav nav-list collapse menu-second">
						<li><a class="btn-success" href="${contextPath}/general/addGeneral"> <i
								class="fa fa-list-alt"></i>General Items
						</a></li>

						<li><a name="bok" class="btn" href="${contextPath}/book/addBook"><i
								class="fa fa-list-alt"></i>Book</a></li>
						<li><a class="btn-success" href="${contextPath}/food/addFood"><i
								class="fa fa-list-alt"></i>Food</a></li>
						<li><a name="mam" class="btn" href="${contextPath}/admin/manage"><i
								class="fa fa-list-alt"></i>Manage All</a></li>
					</ul>

					<li><a class="btn btn-info" href="#recordMeun"
						class="nav-header menu-first collapsed" data-toggle="collapse">
							<i class="fa fa-file-text"></i>&nbsp;Reports<span class="sr-only">(current)</span>
					</a></li>
					<ul id="recordMeun" class="nav nav-list collapse menu-second">
						<li><a class="btn" href="###"
							onclick="showAtRight('${contextPath}/admin/addTable')"><i class="fa fa-list"></i>Best
								Seller</a></li>

						<li><a class="btn-success" href="###"
							onclick="showAtRight('recordList.jsp')"><i class="fa fa-list"></i>Curv</a></li>

						<li><a class="btn" href="###"
							onclick="showAtRight('recordList.jsp')"><i class="fa fa-list"></i>Food</a></li>
					</ul>

				</ul>

			</div>
		</div>
		<div class="col-sm-9 col-md-10 main">
			<h1 class="page-header">
				<i class="fa fa-cog fa-spin"></i>&nbsp;Management <small>&nbsp;&nbsp;&nbsp;Welcome</small>
			</h1>
		
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<h3>How many Items do you want to add?</h3>
	 <form method='post' action='${contextPath}/general/addsuccess'  enctype="multipart/form-data">
		<label>Enter: <input type="text" name="rows" id="rows" /></label><br />
	
	<div id="txtHint1"><input type="submit" id="action" value="Submit" onclick='createTable();'></div>
	
	</form> 
	</div>
	</div>
</body>

</html>