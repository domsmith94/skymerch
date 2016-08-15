<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,skymerch.entities.*, skymerch.dao.*, skymerch.enums.*, java.text.DecimalFormat"%>
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
<meta charset="utf-8">
<title>Order History - Sky Merchandise</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://assets.sky.com/dist/latest/css/fonts.css'
	rel='stylesheet'>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<%	
		Customer currentCust = (Customer) session.getAttribute("signedInUser");
	%>
	<div class="container col-sm-10 col-sm-offset-1">
		<div class="page-header">
			<h1 class="sky-text">
				<b><%=currentCust.getFirstName()%>'s Order History</b>
			</h1>
		</div>
		<div class="text-right">
			<button onclick="myFunction()">Print Order History</button>

			<script>
				function myFunction() {
					window.print();
				}
			</script>
		</div>

		<div>
			<br />
		</div>

		<%
			if (auth) {

				DecimalFormat df = new DecimalFormat();
				df.setMaximumFractionDigits(2);
				df.setMinimumFractionDigits(2);
				TreeSet<Order> fullHistory = (TreeSet<Order>) session.getAttribute("orderHistory");
				if (fullHistory == null) {
		%>
		<p>Your order history is empty.</p>
		<%
			} 
		else
					for (Order o : fullHistory) {
		%>
		if (o.getStatus() == Category.DELIVERED) {
		<div class="panel panel-default">
			<div class="panel-heading col-sm-7 col-sm-offset-0">
				<th><p>
						<em>Order Number: <%=o.getOrderId()%></em>
					</p>
					<p>
						<em>Order Date: <%=o.getOrderTime()%></em>
					</p></th>
			</div>
			<div class="panel-heading col-sm-5 col-sm-offset-0">
				<th><p>
						<em>Delivery Method: <%=String.valueOf(o.getShippingType()).toLowerCase()%></em>
					</p>
					<p>
						<em>Order Status: <%=String.valueOf(o.getStatus()).toLowerCase()%></em>
					</p></th>
			</div>

			<table class="table table-hover">
				<thead>

					<tr>
						<th>Product ID</th>
						<th>Product Name</th>
						<th>Quantity</th>
						<th>Unit Price</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<OrderLine> orderLines = o.getOrderLines();
									int lineNum = 1;
									Double subtotal = 0.0;
									Double shippingCost = 0.0;
									for (OrderLine ol : orderLines) {
					%>
					<tr>
						<td><%=lineNum%>
							<%
								lineNum++;
							%></td>
						<td><%=ol.getProduct().getProdName()%></td>
						<td><%=ol.getQuantity()%></td>
						<td><%=ol.getItemPrice()%></td>
					</tr>
					<%
						subtotal = subtotal + ol.getOrderLinePrice();
									}
					%>
					<td></td>
					<td></td>
					<td><p>
							<b>Sub total:</b>
						</p>
						<p>
							<b>Delivery:</b>
						</p>
						<p>
							<b>Total:</b>
						</p></td>
					<td><p>
							<b>£<%=df.format(subtotal)%></b>
						</p>
						<p>
							<b>£ <%
								if (o.getShippingType() == Shipping.STANDARD) {
												shippingCost = 3.99;
							%>1.00<%
								} else if (o.getShippingType() == Shipping.NEXT_DAY) {
												shippingCost = 5.99;
							%>5.00<%
								}
							%></b>
						</p>
						<p>
							<b>£<%=df.format(subtotal + shippingCost)%></b>
						</p></td>
					</tr>

				</tbody>
			</table>
		</div>

		<%
			}
			}
			else {
				%>
				<p>Please sign in to view your order history.</p>
				<%
					}
		%>
	
</body>
</html>