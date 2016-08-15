<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<meta charset="utf-8">
<title>Browse Products - Sky Merchandise</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://assets.sky.com/dist/latest/css/fonts.css'
	rel='stylesheet'>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<div class="col-md-2">
			<form method="POST" action="/skymerch/filtered_results">
				<h3>Filters</h3>
				<div class="col-xs-12">
					<h4>Category</h4>
					<div class="checkbox">
						<label> <input type="checkbox" name="HOUSEHOLD"
							<%if(request.getParameter("HOUSEHOLD") != null){%>
							checked="checked" <%} %>>Household
						</label>
					</div>
					<div class="checkbox">
						<label> <input type="checkbox" name="MEDIA"
							<%if(request.getParameter("MEDIA") != null){%> checked="checked"
							<%} %>>Media
						</label>
					</div>
					<div class="checkbox">
						<label> <input type="checkbox" name="ELECTRONICS"
							<%if(request.getParameter("ELECTRONICS") != null){%>
							checked="checked" <%} %>>Electronics
						</label>
					</div>
					<div class="checkbox">
						<label> <input type="checkbox" name="CLOTHING"
							<%if(request.getParameter("CLOTHING") != null){%>
							checked="checked" <%} %>>Clothing
						</label>
					</div>
					<div class="checkbox">
						<label> <input type="checkbox" name="TOYS"
							<%if(request.getParameter("TOYS") != null){%> checked="checked"
							<%} %>>Toys
						</label>
					</div>
				</div>
				<div class="col-xs-12">
					<h4>Price</h4>
					<div class="radio">
						<label> <% String priceRange = request.getParameter("optradio");
                        if (priceRange == null){ priceRange = "noValue";}%>
							<input type="radio" name="optradio" value="0-5"
							<%if(priceRange.equals("0-5")){%> checked="checked" <%} %>>£0-
							£5
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="optradio" value="5-10"
							<%if(priceRange.equals("5-10")){%> checked="checked" <%} %>>£5-
							£10
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="optradio" value="10-20"
							<%if(priceRange.equals("10-20")){%> checked="checked" <%} %>>£10-
							£20
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="optradio" value="20-30"
							<%if(priceRange.equals("20-30")){%> checked="checked" <%} %>>£20-
							£30
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="optradio" value="30-40"
							<%if(priceRange.equals("30-40")){%> checked="checked" <%} %>>£30-
							£50
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="optradio"
							value="50-10000000000"
							<%if(priceRange.equals("50-10000000000")){%> checked="checked"
							<%} %>>£50+
						</label>
					</div>
				</div>
				<div class="col-xs-12 text-center">
					<button id="btnSubmit" type="submit" class="btn btn-default">Filter</button>
				</div>
			</form>
			<form action="/skymerch/browse">
			<p align="center">
				<br />
				<br />
				<button id="btnSubmit" type="submit" class="btn btn-default">Clear
					All</button>
					</p>
			</form>
		</div>

		<div class="col-md-10">
			<div class="page-header">
				<h1>
					Products <small>Sold by Sky Merchandise</small>
				</h1>
			</div>
			<div class="row">
				<%    List<Product> tiledResults = (ArrayList<Product>) session.getAttribute("resultsToDisplay");
if (tiledResults == null) {
	%>
				<p>There are no products to display</p>
				<%
}
else {
	for (Product p : tiledResults) {
		%>
				<div class="col-md-3">
					<div class="thumbnail">
						<a href="product?id=<%= p.getProdId() %>"> <img
							src="images/product/product10.jpeg" alt="...">
						</a>
						<div class="caption">
							<h3>
								<a href="product?id=<%= p.getProdId() %>"><%= p.getProdName() %></a>
							</h3>
							<h4><%= "£" + p.getPrice() %></h4>

						</div>
					</div>
				</div>
				<% } 
	} %>
			</div>
		</div>
	</div>
	<script src="js/browse.js"></script>
</body>

</html>