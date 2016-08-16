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
<meta charset="UTF-8">
<title>Manage Orders - Sky Staff</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://assets.sky.com/dist/latest/css/fonts.css'
	rel='stylesheet'>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<%@ include file="adminNav.jsp"%>

<body>
	<div class="sky-font">

		<%
			Order orderToDisplay = (Order) session.getAttribute("order");
			Address address = (Address) session.getAttribute("address");
			Customer customer = (Customer) session.getAttribute("customer");
		%>

		<div class="container col-sm-10 col-sm-offset-1">
			<div class="page-header">
			
			<div>
			<a href="wh-order-history"><button id="btnSubmit" type="submit" class="btn btn-info">
				<span class="glyphicon glyphicon-chevron-left glyphicon"></span>
				<span class="glyphicon glyphicon-chevron-left glyphicon"></span>
				Back to view all orders</button></a>
				</div>
					
					
				<h1 class="sky-text">				
					<b>Order #<%=orderToDisplay.getOrderId()%></b> for customer <b><%=customer.getFirstName() + " " + customer.getLastName()%></b>
					(Id#<%=customer.getCustId()%>)
				</h1>
			</div>
			<div class="panel-heading col-sm-12 col-sm-offset-0"></div>

			<div class="page-header text-left">
				<h3>Order Details</h3>
			</div>
			<form method="GET"
				action="wh-update-status?id=<%=orderToDisplay.getOrderId()%>">
				<table class="table table-hover">
					<thead>
						<tr>
							<th class="text-center">Date Placed</th>
							<th class="text-center">Shipping Method</th>
							<th class="text-center">Current Status</th>
							<th class="text-center">Update Status</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-center"><%=orderToDisplay.getOrderTime()%></td>
							<td class="text-center"><%=String.valueOf(orderToDisplay.getShippingType())%></td>
							<td><div class="text-center">
									<span
										class="label label-<%if (orderToDisplay.getStatus() == Status.ORDERED) {%>danger<%}
			if (orderToDisplay.getStatus() == Status.PROCESSING || orderToDisplay.getStatus() == Status.DISPATCHED) {%>warning<%}
			if (orderToDisplay.getStatus() == Status.DELIVERED) {%>success<%}%>
								success biggerlabel"><%=String.valueOf(orderToDisplay.getStatus())%>
									</span>
								</div></td>
							<td class="text-center"><select class="form-control"
								name="status-update" id="status-update">
									<option value="ordered"
										<%if (orderToDisplay.getStatus() == Status.ORDERED) {%>
										selected="selected" <%}%>>Ordered</option>
									<option value="processing"
										<%if (orderToDisplay.getStatus() == Status.PROCESSING) {%>
										selected="selected" <%}%>>Processing</option>
									<option value="dispatched"
										<%if (orderToDisplay.getStatus() == Status.DISPATCHED) {%>
										selected="selected" <%}%>>Dispatched</option>
									<option value="delivered"
										<%if (orderToDisplay.getStatus() == Status.DELIVERED) {%>
										selected="selected" <%}%>>Delivered</option>
							</select></td>
						</tr>
						<tr>
							<th class="text-center"></th>
							<th class="text-center"></th>
							<th class="text-center"></th>
							<th class="text-center">
								<button id="btnSubmit" type="submit" class="btn btn-info">Update
									status</button>
							</th>
						</tr>

					</tbody>
				</table>
			</form>
		</div>
	</div>

	<div class="container col-sm-10 col-sm-offset-1">
		<div class="page-header">
			<h3>Order Summary</h3>
		</div>

		<div class="panel">
			<div class="panel-heading col-sm-12 col-sm-offset-0"></div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Product Name</th>
						<th>Unit Price</th>
						<th>Quantity</th>
						<th>Price</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (OrderLine ol : orderToDisplay.getOrderLines()) {
					%>
					<tr>
						<td><%=ol.getProduct().getProdName()%></td>
						<td>£<%=ol.getItemPrice()%></td>
						<td><%=ol.getQuantity()%></td>
						<td>£<%=ol.getOrderLinePrice()%></td>
					</tr>
					<%
						}
					%>

					<tr>
						<td></td>
						<td></td>
						<td><p>
								<b>Subtotal</b>
							</p>
							<p>
								<b>Delivery</b>
							</p>
							<p>
								<b>Total</b>
							</p></td>
						<td><p>
								<%
									DecimalFormat df = new DecimalFormat();
									double shippingCost = 0.0;
									if (orderToDisplay.getShippingType() == Shipping.STANDARD) {
										shippingCost = 3.99;
									} else if (orderToDisplay.getShippingType() == Shipping.NEXT_DAY) {
										shippingCost = 5.99;
									}
									double subtotal = orderToDisplay.getTotalCost() - shippingCost;
								%>
								<b>£<%=df.format(subtotal)%></b>
							</p>
							<p>
								<b>£<%=df.format(shippingCost)%></b>
							</p>
							<p>
								<b>£<%=df.format(orderToDisplay.getTotalCost())%></b>
							</p></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div class="container col-sm-10 col-sm-offset-1 bottom-buffer">
		<div class="container col-sm-4 col-sm-offset-4">
			<div class="noprint">
				<div class="page-header text-centre">
					<h3>Shipping Address</h3>
				</div>
			</div>
			<div>
				<p><%=customer.getFirstName() + " " + customer.getLastName()%></p>
				<p><%=address.getHouseNameNum() + " " + address.getAddressLineOne()%></p>
				<%
					if (address.getAddressLineTwo() != null) {
				%>
				<p><%=address.getAddressLineTwo()%></p>
				<%
					}
				%>
				<p><%=address.getTownOrCity()%></p>
				<p><%=address.getPostcode()%></p>

			</div>
			<div class="noprint">
				<div class="row">
					<button onclick="myFunction()">Print Shipping Label</button>
					<script>
						function myFunction() {
							window.print();
						}
					</script>
				</div>
			</div>
		</div>
	</div>



</body>
</html>