<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>HOME PAGE</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 100%;
	height: 400px;
	margin: auto;
}

footer {
	margin-top: 50px;
}

body {
	width: 100%;
}
</style>
</head>


<body
	background="http://hdwallpaperbackgrounds.net/wp-content/uploads/2016/07/white-background-1.jpg">


	<div class="text-center">
		<h1 style="font-family: Georgia; font-size: 40px;">
			<i>DigiCart </i> <img
				src=" https://www.sitewelder.com/art2012/logo-big-shopping.png"
				alt="logo" width="60px" height="60px" align="center"> <img
				src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/F_icon.svg/768px-F_icon.svg.png"
				alt="fb" width="30px" height="30px" align="right"> <img
				src="https://upload.wikimedia.org/wikipedia/en/thumb/9/9f/Twitter_bird_logo_2012.svg/1259px-Twitter_bird_logo_2012.svg.png"
				alt="twitter" width="30px" height="30px" align="right"> <img
				src="http://icons.iconarchive.com/icons/danleech/simple/1024/linkedin-icon.png"
				alt="linkedin" width="30px" height="30px" align="right">
		</h1>

	</div>

	<nav class="navbar navbar-inverse">
	<div class="container-fluid">

		<ul class="nav navbar-nav navbar-right"
			style:backgroundcolor="w3-blue">
			<sec:authorize access="isAuthenticated()">

				<li><a href="">Welcome <sec:authentication
							property="principal.username" /></a></li>
				<li><a href="<c:url value="/perform_logout" />">LOGOUT</a></li>
			</sec:authorize>
			<!-- <li><a href="Home.jsp"> HOME</a></li> -->

			<li><a href="ABOUTUS"> ABOUT US</a></li>
			<li><a href="CONTACTUS"> CONTACT US</a></li>
			<sec:authorize access="!isAuthenticated()">
				<li><a href="register">SIGN UP</a>
				<li><a href="login">LOGIN</a></li>

			</sec:authorize>
		</ul>



		<%-- <form class="navbar-form navbar-left" role="search">
			<div class="form-group">


				<div class="dropdown">
					<button class="btn btn-default dropdown-toggle" type="button"
						id="menu1" data-toggle="dropdown">
						click here <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">

						<li><c:forEach items="${allData}" var="category">
								<a href="navproduct/${category.id }"><c:out
										value="${category.name}" /><span
									class="glyphicon glyphicon-menu-right"></span></a>
								<br>

							</c:forEach></li>
					</ul>
				</div>
			</div>
		</form> --%>
	</nav>
	<c:choose>
		<c:when test="${!Hideothers}">

		 <div class="container-fluid">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
					</ol>

					<div class="carousel-inner" role="listbox">
						<div class="item">
							<img
								src="http://cheaplaptop.in/wp-content/uploads/2016/05/laptop-with-full-HD-in-India.jpg"
								alt="hp">
						</div>


						<div class="item active">
							<img
								src="http://blog.snapdeal.com/wp-content/uploads/2015/08/VD_mobile_WinHDJRLTE_Blog_ver_1_13Aug.jpg"
								alt="mobile">
						</div>


						<div class="item">
							<img
								src="http://downloadwallpaper.org/wp-content/uploads/2016/09/wallpaper-for-mobile-phone-HD10.jpg"
								alt="mobile">
						</div>

						<div class="item">
							<img
								src="http://blogs-images.forbes.com/geoffreymorrison/files/2016/05/Acer-Switch-V-10-Opener.jpg"
								alt="mobile">
						</div>
					</div>
					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div> 

		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${UserClickedCart}">
			<c:import url="/WEB-INF/views/Cart1.jsp"></c:import>
		</c:when>
		<c:when test="${UserClickedlogin}">
			<c:import url="/WEB-INF/views/login.jsp"></c:import>
		</c:when>
		<c:when test="${UserClickeduser}">
			<c:import url="/WEB-INF/views/register.jsp"></c:import>
		</c:when>
		<c:when test="${IfPaymentClicked}">
			<c:import url="/WEB-INF/views/Payment.jsp"></c:import>
		</c:when>
		<c:when test="${IfViewCartClicked}">
			<c:import url="/WEB-INF/views/Cart1.jsp"></c:import>
		</c:when>
		<c:when test="${UserClickedContactUs}">
			<c:import url="/WEB-INF/views/CONTACTUS.jsp"></c:import>
		</c:when>
		<c:when test="${UserClickedAboutus}">
			<c:import url="/WEB-INF/views/ABOUTUS.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:forEach items="${allproduct}" var="product">

		<!-- <div class="row"> -->
		<div class="col-xs-3">

			<a href="ShowProduct/${product.id}" class="thumbnail"> <img
				height="200px" width="200px" alt="${product.id }"
				src="<c:url value="/resources/images/Product/${product.id }.jpg"></c:url>"></a>
			<div class="desc">
				Product Id:
				<c:out value="${product.id}" />
				<br> Product Name:
				<c:out value="${product.name }"></c:out>
				<br>
				<c:url var="action" value="addtocart/${product.id}"></c:url>
				<form:form action="${action}" commandName="cart">
					<input type="submit" class="btn btn-primary" value="Add To Cart" />

				</form:form>


			</div>

		</div>


	</c:forEach>




</body>
</html>
