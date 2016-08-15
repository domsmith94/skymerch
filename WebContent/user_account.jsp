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
<h1><%=customer.getFirstName() + " " + customer.getLastName() %></h1>
<h3>Customer Account no.: <%=customer.getCustId() %></h3>
<h4>Address</h4>
<p><%=address.getHouseNameNum() + " " + address.getAddressLineOne()%></p>
<p><%=address.getAddressLineTwo()%></p>
<p><%=address.getTownOrCity()%></p>
<p><%=address.getPostcode()%></p>

<form action="/skymerch/order_history">
				<p align="center">
				<button id="btnSubmit" type="submit" class="btn btn-default">View Order History</button>
					</p>
			</form>

</body>
</html>