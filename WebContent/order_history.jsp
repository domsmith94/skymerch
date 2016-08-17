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
<meta charset="utf-8">
<title>Order History - Sky Merchandise</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
 <link href='css/fonts.css'
	rel='stylesheet'>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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
			<button onclick="myFunction()"><span class="glyphicon glyphicon-print"></span> Print Order History</button>

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
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyy HH:mm:ss");
				TreeSet<Order> fullHistory = (TreeSet<Order>) session.getAttribute("orderHistory");
				TreeSet<Order> openOrders = new TreeSet<Order>();
				TreeSet<Order> completedOrders = new TreeSet<Order>();
				if (fullHistory == null) 
				{
		%>
		<p>Your order history is empty.</p>
		<%
			} 
		else {
			for (Order n : fullHistory) {
			if (n.getStatus() != Status.DELIVERED) {
				openOrders.add(n);				
			}
			else {
				completedOrders.add(n);
			} 
			}
			
			
		
					%>
			<div class="page-header">
			<h3 class="sky-text">Open Orders</h3>
		</div> 
		<% if (openOrders.isEmpty()) {
			%><p>None to display.</p><%
		}
		else {
			for (Order o : openOrders) {
		%>
		<div class="panel panel-default">
			<div class="panel-heading col-sm-7 col-sm-offset-0">
				<th><p>
						<em>Order Number: <%=o.getOrderId()%></em>
					</p>
					<p>
						<em>Order Date: <%LocalDateTime in = (LocalDateTime) o.getOrderTime();%><%=in.format(formatter)%></em>
					</p></th>
			</div>
			<div class="panel-heading col-sm-5 col-sm-offset-0">
				<th><p>
						<em>Delivery Method: <%=String.valueOf(o.getShippingType())%></em>
					</p>
					<p>
						<em>Order Status: <%=String.valueOf(o.getStatus())%></em>
					</p></th>
			</div>

			<table class="table table-hover">
				<thead>

					<tr>
						<th>#</th>
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
									for (OrderLine ol : orderLines) {
					%>
					<tr>
						<td><%=lineNum%>
							<%
								lineNum++;
							%></td>
						<td><%=ol.getProduct().getProdId()%>
						<td><a href="product?id=<%=ol.getProduct().getProdId()%>"><%=ol.getProduct().getProdName()%></a></td>
						<td><%=ol.getQuantity()%></td>
						<td><%=ol.getItemPrice()%></td>
					</tr>
					<%
						}
					%>
					<td></td>
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
					<%
					double shippingCost = 0.0;
					if  (o.getShippingType() == Shipping.STANDARD) {
						shippingCost = 3.99;
					} else if (o.getShippingType() == Shipping.NEXT_DAY) {
						shippingCost = 5.99;
					}
					double subtotal = o.getTotalCost() - shippingCost; %>
							<b>£<%=df.format(subtotal)%></b>
						</p>
						<p>
							<b>£<%=df.format(shippingCost)%></b>
						</p>
						<p>
							<b>£<%=df.format(o.getTotalCost())%></b>
						</p></td>
					</tr>

				</tbody>
			</table>
		</div>
		

		<%					}
						}		
					}
				%>

				
			
			
			
			<% if (fullHistory != null ){ %>
			<div class="page-header">
				<h3 class="sky-text">Completed Orders</h3>
			</div> <%
			if (completedOrders.isEmpty()) {
				%>
				<p>None to display.</p><%
			}
			else {
				for (Order c : completedOrders) {
					%>
					<div class="panel panel-default">
						<div class="panel-heading col-sm-7 col-sm-offset-0">
							<th><p>
									<em>Order Number: <%=c.getOrderId()%></em>
								</p>
								<p>
									<em>Order Date: <%LocalDateTime in = (LocalDateTime) c.getOrderTime();%><%=in.format(formatter)%></em>
								</p></th>
						</div>
						<div class="panel-heading col-sm-5 col-sm-offset-0">
							<th><p>
									<em>Delivery Method: <%=String.valueOf(c.getShippingType())%></em>
								</p>
								<p>
									<em>Order Status: <%=String.valueOf(c.getStatus())%></em>
								</p></th>
						</div>

						<table class="table table-hover">
							<thead>

								<tr>
									<th>#</th>
									<th>Product ID</th>
									<th>Product Name</th>
									<th>Quantity</th>
									<th>Unit Price</th>
								</tr>
							</thead>
							<tbody>
								<%
									List<OrderLine> orderLines = c.getOrderLines();
												int lineNum = 1;
												for (OrderLine ol : orderLines) {
								%>
								<tr>
									<td><%=lineNum%>
										<%
											lineNum++;
										%></td>
									<td><%=ol.getProduct().getProdId()%>
									<td><a href="product?id=<%=ol.getProduct().getProdId()%>"><%=ol.getProduct().getProdName()%></a></td>
									<td><%=ol.getQuantity()%></td>
									<td><%=ol.getItemPrice()%></td>
								</tr>
								<%
									}
								%>
								<td></td>
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
								<%
								double shippingCost = 0.0;
								if  (c.getShippingType() == Shipping.STANDARD) {
									shippingCost = 3.99;
								} else if (c.getShippingType() == Shipping.NEXT_DAY) {
									shippingCost = 5.99;
								}
								double subtotal = c.getTotalCost() - shippingCost; %>
										<b>£<%=df.format(subtotal)%></b>
									</p>
									<p>
										<b>£<%=df.format(shippingCost)%></b>
									</p>
									<p>
										<b>£<%=df.format(c.getTotalCost())%></b>
									</p></td>
								</tr>

							</tbody>
						</table>
					</div>
			<%
						}
					}
				}
			}
		%>
		
		
		
		
		
</div>
</body>
</html>