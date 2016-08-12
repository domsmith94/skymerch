<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.1.0.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
	
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Sky Merchandise Store</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://assets.sky.com/dist/latest/css/fonts.css'
	rel='stylesheet'>
</head>

<body>
	<!-- Nav Bar -->
	<%@ include file="navbar.jsp"%>
	<div class="container col-sm-10 col-sm-offset-1">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>

			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="images/banner1.jpeg" alt="Chania" width="1600"
						height="300">
				</div>
				<div class="item">
					<img src="images/banner2.png" alt="Chania" width="1600"
						height="300">
				</div>
				<div class="item">
					<img src="images/banner3.png" alt="Chania" width="1600"
						height="300">
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
	<div class="container col-sm-10 col-sm-offset-1">
		<div class="row">
			<br>
			<div class="container col-sm-4 col-sm-offset-0">
				<a
					href="http://www.sky.com/shop/tv/sky-q/overview/?DCMP=knc-GOOGLE-ec-SKY-Q-sky+q&gclid=Cj0KEQjwoau9BRDMvsnv5MCh24UBEiQAKOqcfbAMGkocpOUYLEPOTQKO46M69V3yqQ-NbxGrOSpFLvkaAlOx8P8HAQ"
					class="thumbnail"> <img src="images/skynews.png" width="265"
					height="200" alt="...">
				</a>
			</div>
			<div class="container col-sm-2 col-sm-offset-0">
				<a href="#" class="thumbnail"> <img
					src="images/product/product1.jpeg" width="242" height="200"
					alt="...">
				</a>
			</div>
			<div class="container col-sm-2 col-sm-offset-0">
				<a href="#" class="thumbnail"> <img
					src="images/product/product2.jpeg" width="242" height="200"
					alt="...">
				</a>
			</div>
			<div class="container col-sm-2 col-sm-offset-0">
				<a href="#" class="thumbnail"> <img
					src="images/product/product3.jpeg" width="242" height="200"
					alt="...">
				</a>
			</div>
			<div class="container col-sm-2 col-sm-offset-0">
				<a href="#" class="thumbnail"> <img
					src="images/product/product4.jpeg" width="242" height="200"
					alt="...">
				</a>
			</div>
		</div>
		<div class="row">

			<div class="container col-sm-4 col-sm-offset-0">
				<a href="#" class="thumbnail"> <img src="images/skyq.jpg"
					"
					width="330" height="300" alt="...">
				</a>
			</div>

			<div class="container col-sm-2 col-sm-offset-0">
				<a href="#" class="thumbnail"> <img
					src="images/product/product5.jpeg" width="242" height="200"
					alt="...">
				</a>
			</div>

			<div class="container col-sm-2 col-sm-offset-0">
				<a href="#" class="thumbnail"> <img
					src="images/product/product6.jpeg" width="242" height="200"
					alt="...">
				</a>
			</div>

			<div class="container col-sm-2 col-sm-offset-0">
				<a href="#" class="thumbnail"> <img
					src="images/product/product7.jpeg" width="242" height="200"
					alt="...">
				</a>
			</div>

			<div class="container col-sm-2 col-sm-offset-0">
				<a href="#" class="thumbnail"> <img
					src="images/product/product8.jpeg" width="242" height="200"
					alt="...">
				</a>
			</div>
		</div>
		<div class="row">

			<div class="container col-sm-4 col-sm-offset-0">
				<a href="#" class="thumbnail"> <img src="images/fibre.png"
					width="242" height="200" alt="...">
				</a>
			</div>

			<div class="container col-sm-2 col-sm-offset-0">
				<a href="#" class="thumbnail"> <img
					src="images/product/product10.jpeg" width="242" height="200"
					alt="...">
				</a>
			</div>

			<div class="container col-sm-2 col-sm-offset-0">
				<a href="#" class="thumbnail"> <img
					src="images/product/product11.png" width="242" height="200"
					alt="...">
				</a>
			</div>
			<div class="container col-sm-2 col-sm-offset-0">
				<a href="#" class="thumbnail"> <img
					src="images/product/product12.png" width="242" height="200"
					alt="...">
				</a>
			</div>
			<div class="container col-sm-2 col-sm-offset-0">
				<a href="#" class="thumbnail"> <img
					src="images/product/product9.jpeg" width="242" height="200"
					alt="...">
				</a>
			</div>
		</div>
	</div>
</body>
</html>