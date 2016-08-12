<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*,skymerch.entities.*;"%>
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
<title>Product - Sky Merchandise</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://assets.sky.com/dist/latest/css/fonts.css'
	rel='stylesheet'>
</head>

<body>
	<div class="sky-font">

		<%@ include file="navbar.jsp"%>
		<div class="container sky-font">
			<div class="page-header">
				<h1 class="sky-text">
					<b>Search Results </b> <small>Showing results for ' <%= session.getAttribute("searchString") %>'</small>
				</h1>
				</div>
			<div class="col-md-8 col-md-offset-2">
				<% List<Product> listedResults = (ArrayList<Product>) session.getAttribute("resultsToDisplay");
					if (listedResults == null){
						%> <p> Sorry, there are no results to display. </p> <%
					}
					else {
					for (Product p : listedResults) {%>
			
				<div class="media bottom top-buffer">
					<div class="media-left media-top">
						<a href="product?id=<%= p.getProdId()%>"> <img class="media-object img-thumbnail"
							src="images/product/product3.jpeg" alt="..."
							style="width: 128px; height: 128px;" border: 2pxsolidblack"">
						</a>
					</div>
					<div class="media-body">
						<a href="product?id=<%= p.getProdId() %>" class="nounderline">	
							<h4 class="media-heading"><%=p.getProdName() %></h4>
							<p><%=p.getProdDesc() %></p>
						</a>
						<div class="top-buffer"></div>
					</div>
					</div>
					<% }
					}%>
					
					
					
			</div>
		</div>
</body>

</html>




</body>
</html>