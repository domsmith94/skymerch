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
<title>Browse Products - Sky Merchandise</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://assets.sky.com/dist/latest/css/fonts.css'
	rel='stylesheet'>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<% Customer customer = (Customer) session.getAttribute("signedInUser");
	Address address = customer.getAddress();%>
	
<div class="container col-sm-10 col-sm-offset-1">
		<div class="page-header">
			<h1 class="sky-text"><b><%=customer.getFirstName() + " " + customer.getLastName() %>'s Account</b></h1>
		</div>
		
		
		
			<div class="panel panel-default">
			<div class="panel-heading col-m-12 col-sm-offset-0">
				User ID Number: <%=customer.getCustId() %>
			</div>
			

			<table class="table table-hover">
				<thead>

					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email Address</th>
						<th>House Name/Number</th>
						<th>Address Line 1</th>
						<th>Address Line 2</th>
						<th>Town City</th>
						<th>Postcode</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><%=customer.getFirstName()%></td>
						<td><%=customer.getLastName()%></td>
						<td><%=customer.getEmail()%></td>
						<td><%=address.getHouseNameNum() %></td>
						<td><%=address.getAddressLineOne() %></td>
						<td><% if (address.getAddressLineTwo() != null) {%><%=address.getAddressLineTwo()%><%}%></td>
						<td><%=address.getTownOrCity()%></td>
						<td><%=address.getPostcode()%></td>
					</tr>
					
				</tbody>
			</table>
		</div>
	
	<a href="order_history"
					class="btn btn-default" role="button">View order history</a>
	
	</div>	

</body>
</html>