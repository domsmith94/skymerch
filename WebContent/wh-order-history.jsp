<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,skymerch.entities.*, skymerch.dao.*, skymerch.enums.*, java.text.DecimalFormat, java.time.LocalDateTime, java.time.format.DateTimeFormatter"%>
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
<title>Manage Orders - Sky Staff</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
 <link href='css/fonts.css'
	rel='stylesheet'>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<%@ include file="adminNav.jsp"%>

<body>

		<div class="container sky-font col-sm-10 col-sm-offset-1">
		<form>
			<div class="page-header">
				<h1 class="sky-text">
					<b>Orders</b>
				</h1>
			</div>

			<div></div>

			<div class="container sky-font col-sm-10 col-sm-offset-1">
				<div class="panel">
					<div class="panel-heading col-sm-12 col-sm-offset-0"></div>

					<table class="table table-hover">
						<thead>

							<tr>
								<th>Order ID</th>
								<th>Date Placed</th>
								<th>Shipping Method</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
						<% List<Order> allOrders = (List<Order>) session.getAttribute("allOrders");
						DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyy HH:mm:ss");
						
						
						for (Order print : allOrders) {
							System.out.println("Id: " + print.getOrderId());
						}
						for (Order o : allOrders) { %>
							<tr>
								<td><a href="wh-order-view?id=<%=o.getOrderId()%>"><%=o.getOrderId()%></a></td>
								<% LocalDateTime in = (LocalDateTime) o.getOrderTime();
								
								%>
								<td><%=in.format(formatter) %></td>
								<td><%=String.valueOf(o.getShippingType()) %></td>
								<td><span class="label label-<% 
								if (o.getStatus() == Status.ORDERED) {%>danger<%}
								if (o.getStatus() == Status.PROCESSING || o.getStatus() == Status.DISPATCHED) {%>warning<%}
								if (o.getStatus() == Status.DELIVERED) {%>success<%}%>
								biggerlabel"><%=String.valueOf(o.getStatus())%></span></td>
							</tr>
							<% } %>
							
							</tbody>
					</table>
					</form>
				</div>
		</body>
</html>