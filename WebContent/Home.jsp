<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.1.0.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
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
	<div class="container col-md-10 col-md-offset-1">

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

	<!-- Page Border Div -->
	<div class="container col-md-10 col-md-offset-1">

		<!-- Page Break Line -->
		<div class="container col-md-12 top-buffer bottom "></div>

		<!-- Categories Container -->
		<div class="container col-md-4">

			<!-- Header/Title -->
			<div class="container col-md-12">
				<div class="page-header">
					<h3 class="text-center">
						<b>Categories</b>
					</h3>
				</div>
			</div>

			<!-- Categories -->
			<div class="container col-md-12 top-buffer">
				<div class="thumbnail shadowfilter">
					<a href="#"> <img src="images/product/test.png" width="540"
						height="200" alt="...">
					</a>
				</div>
				<div class="thumbnail shadowfilter">
					<a href="#"> <img src="images/product/clothing.png" width="540"
						height="200" alt="...">
					</a>
				</div>
				<div class="thumbnail shadowfilter">
					<a href="#"> <img src="images/media.png" width="540"
						height="200" alt="...">
					</a>
				</div>
				<div class="thumbnail shadowfilter">
					<a href="#"> <img src="images/household.png" width="540"
						height="200" alt="...">
					</a>
				</div>
				<div class="thumbnail shadowfilter">
					<a href="#"> <img src="images/electronics.png" width="540"
						height="200" alt="...">
					</a>
				</div>
			</div>
		</div>


		<!-- Top Rated Products Section -->
		<div class="container col-md-8">

			<!-- Header -->
			<div class="container col-md-12">
				<div class="page-header">
					<h3 class="text-center">
						<b>Top Rated</b>
					</h3>
				</div>
			</div>

			<!-- Products -->
			<div class="container col-md-12 top-buffer">

				<%
					TreeSet<Product> orderedProducts = (TreeSet<Product>) session.getAttribute("orderedProducts");
					List<Product> allProducts = (ArrayList<Product>) session.getAttribute("allProducts");
					for (int i = 0; i < 12; i++) {
						Product p = orderedProducts.last();
				%>
				<div class="col-md-3">
					<div class="thumbnail thumbnail_small shadowfilter">
						<div class="grow" id="inner">
							<a href="product?id=<%=p.getProdId()%>"> <img
								src="images/product/product<%=p.getProdId()%>.jpeg" alt="..."
								width="242px" height="240px">
							</a>
						</div>
						<div class="caption">
							<h3>
								<a href="product?id=<%=p.getProdId()%>"><%=p.getProdName()%></a>
							</h3>
							<p><%="£" + orderedProducts.pollLast().getPrice()%></p>
							<%
								System.out.println("SIZE = " + orderedProducts.size());
							%>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<script src="js/browse.js"></script>
</body>
</html>