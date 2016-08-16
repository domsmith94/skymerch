<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import = "java.util.*,skymerch.entities.*;" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Site Admin - Stock Level</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<body>



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
	<meta charset="ISO-8859-1">
	<title>Sign In - Sky Merchandise</title>
	<script src="js/jquery-3.1.0.min.js"></script>
	<link rel="stylesheet" type="text/css" href="style.css">
	<link href='https://assets.sky.com/dist/latest/css/fonts.css'
		rel='stylesheet'>
</head>
<body>
	<div class="sky-font">
		<%@ include file="navbar.jsp"%>

		<div class="container col-sm-10 col-sm-offset-1">
			<div class="page-header">
				<h1>
					<b>Stock Level</b>
				</h1>
			</div>
		</div>
		<div class="container">
			<div class="panel-heading col-sm-12 col-sm-offset-0">
			<p></p>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Product ID</th>
						<th>Product Name</th>
						<th>Warehouse Location</th>
						<th>Quantity</th>
						<th>Reorder Level</th>
					</tr>
				</thead>
				<tbody>
				
				<% 
List<Product> allProducts = (ArrayList<Product>)session.getAttribute("allProducts"); 
for (Product p: allProducts){  %>
					<tr>
						<td><%= p.getProdId() %></td>
						<td><%= p.getProdName() %></td>
						<td><%= p.getLocation() %></td>
						<td><%= p.getStockLevel() %></td>
						<td><%= p.getReorderLevel() %></td>
					</tr>
					
					<% } %>
					

				</tbody>
			</table>
		</div>
	</div>
</body>
</html>