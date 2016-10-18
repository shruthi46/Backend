<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<title>Bootstrap Case</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.17/angular.min.js"></script>

<style>
div.gap {
	margin: -25px 0px 0px 0px;
}

table {
	border-collapse: collapse;
	width: 70%;
}

th, td {
	border: 1px solid grey;
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

tr:hover {
	background-color: #f5f5f5
}

th {
	background-color: black;
	color: white;
}

body {
	background-image:
		url("http://hdwallpaperbackgrounds.net/wp-content/uploads/2016/07/white-background-1.jpg");
	background-repeat: no-repeat;
	background-position: left bottom;
}
</Style>
<script>
	var app = angular.module('myApp', []);
	function MyController($scope, $http) {
		$scope.sortType = 'name'; // set the default sort type
		$scope.sortReverse = false; // set the default sort order
		$scope.search = '';
		$scope.getDataFromServer = function() {
			$http({
				method : 'GET',
				url : 'suppliergson'
			}).success(function(data, status, headers, config) {
				$scope.suppliers = data;// alert(data); 
			}).error(function(data, status, headers, config) {
			});
		};
	};
</script>

</head>

<body
	background="http://hdwallpaperbackgrounds.net/wp-content/uploads/2016/07/white-background-1.jpg">


	<div class="text-center">
		<h1 style="font-family: Georgia; font-size: 40px;">
			<i>DigiCart </i> <img src=" https://www.sitewelder.com/art2012/logo-big-shopping.png" alt="logo" width="60px" height="60px" align="center"> 
			<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/F_icon.svg/768px-F_icon.svg.png" alt="fb" width="30px" height="30px" align="right"> 
			<img src="https://upload.wikimedia.org/wikipedia/en/thumb/9/9f/Twitter_bird_logo_2012.svg/1259px-Twitter_bird_logo_2012.svg.png" alt="twitter" width="30px" height="30px" align="right"> 
			<img src="http://icons.iconarchive.com/icons/danleech/simple/1024/linkedin-icon.png" alt="linkedin" width="30px" height="30px" align="right">
		</h1>

	</div>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<ul class="nav navbar-nav navbar-right">

				<sec:authorize access="isAuthenticated()">
					<li><a href="">Welcome <sec:authentication
								property="principal.username" /></a></li>
					<li><a href="<c:url value="/perform_logout" />">LOGOUT</a></li>

				</sec:authorize>
				<li><a href="Home"> HOME</a></li>
				<li><a href="ABOUTUS"> ABOUT US</a></li>
				<li><a href="CONTACTUS"> CONTACT US</a></li>
				<sec:authorize access="!isAuthenticated()">
					<li><a href="login">LOGIN</a></li>

				</sec:authorize>
			</ul>
		</div>


	</nav>


	<c:url var="addAction" value="addsupplier"></c:url>
	<form:form action="${addAction}" modelAttribute="supplier"
		name="btn-add">
		<h3>
			<c:if test="$(supplier.id==0}">

			</c:if>
			<c:if test="${!empty supplier.id}">
	            Add New Item
		       Update Item for Id: <c:out value="${supplier.id}" />
				<%--  <form:hidden path="id"/> --%>
			</c:if>
		</h3>
		<div class="container">
			<div class="clearfix"></div>
			<div class="Product_Content tab-content">
				<div id="supplier" class="tab-pane active">
					<form class="form-horizontal">

						<br>
						<div
							class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
							<c:if test="${supplier.id!=0}">
								<label class="col-md-4 form-group" for="id">Id</label>
								<div class="col-md-6">
									<form:input type="text" placeholder="supplier id"
										class="form-control name" path="id" />
								</div>
							</c:if>
						</div>

						<div
							class="col-xs-8 col-sm-8  col-md-6 col-sm-offset-2 col-md-offset-3">
							<label class="col-md-4 form-group" for="name">Name</label>
							<div class="col-md-6">
								<form:input type="text" placeholder="supplier name"
									class="form-control name" path="name" />
							</div>
						</div>
						<div
							class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
							<label class="col-md-4 form-group" for="address">Address</label>
							<div class="col-md-6 ">
								<form:input type="text" placeholder="address"
									class="form-control name" path="address" />
							</div>
						</div>


						<div
							class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
							<div class="col-md-6 ">
								<c:if test="${supplier.id==0}">
									<input type="submit" value="Add" class="btn btn-primary">
								</c:if>
								<c:if test="${supplier.id!=0}">
									<input type="submit" value="Update" class="btn btn-primary">
								</c:if>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="container" data-ng-app="myApp"
			data-ng-controller="MyController" data-ng-init="getDataFromServer()"
			style="overflow: auto; height: 400px; width: 70%">
			<form>
				<input class="w3-input w3-animate-input w3-border w3-round w3-small"
					data-ng-model="search" type="text" placeholder=" Search Supplier"
					style="width: 20%">
			</form>
			<br>


			<div align="center">
				<table>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Address</th>

						<th colspan="2">Action</th>
					</tr>
					<%-- <c:forEach var="obj" items="${allSupplier}"> --%>
					<tr
						data-ng-repeat="supplier in suppliers | orderBy:sortType:sortReverse | filter:search">
						>
						<td>{{supplier.id}}</td>
						<td>{{supplier.name}}</td>
						<td>{{supplier.address}}</td>


						<td><a href="deleteBysupplier/{{supplier.id}}">Delete </a> |
							<a href="ItemBysupplier/{{supplier.id}}">Edit</a></td>
					</tr>
					<%--  </c:forEach> --%>
				</table>
			</div>
		</div>
	</form:form>
	<script
		src="${pageContext.request.contextPath}/app-resources/js/lib/jquery-2.2.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/app-resources/js/myapp.js"></script>
	<%--  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-resources/css/style.css"/> --%>
</body>
</html>
