<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*,skymerch.entities.*,java.text.DecimalFormat" %>

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
<title>Checkout - Sky Merchandise</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://assets.sky.com/dist/latest/css/fonts.css'
	rel='stylesheet'>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
	<div class="sky-font">
		<%@ include file="navbar.jsp" %>
		
		<%  
	Basket basket = new Basket();
	List<BasketLine> linesInBasket = new ArrayList<BasketLine>();
	try{
		basket = (Basket)session.getAttribute("basket"); 
		linesInBasket = basket.getBasketLines();
	} catch(Exception e){
		session.setAttribute("basket", basket);
	}
	
	DecimalFormat df = new DecimalFormat();
	df.setMaximumFractionDigits(2);
	df.setMinimumFractionDigits(2);
	Double totalPrice = 0.0;
	Customer customer = (Customer)session.getAttribute("signedInUser");
	
	//for (BasketLine bl: linesInBasket){  
	%>

		<div class="container col-sm-10 col-sm-offset-1">
		<form method="post" action="<% 	if (request.getRequestURL().toString().contains("localhost")) { %>/skymerch<% }%>/validateOrder" class="form-horizontal" role="form">
			<div class="page-header">
				<h1 class="sky-text">
					<b>Checkout</b>
				</h1>
			</div>

			<div></div>

			<div class="container col-sm-10 col-sm-offset-1">
				<div class="page-header">
					<h3>Order Summary</h3>
				</div>
			</div>
			<div class="container col-sm-10 col-sm-offset-1">
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
						<% for (BasketLine bl: linesInBasket){  %>
							<tr>
								<td><%= bl.getProduct().getProdName() %></td>
								<td>£<%= bl.getProduct().getPrice() %></td>
								<td><%= bl.getQuantity() %></td>
								<td>£<%= df.format(bl.getQuantity()*bl.getProduct().getPrice()) %></td>
							</tr>
							<% totalPrice =  bl.getQuantity()*bl.getProduct().getPrice() + totalPrice;
                                } %>    
							
								<td></td>
								<td></td>
								<td><p><b>Subtotal</b></p></td>
								<td><p>
										<b>£<%= df.format(totalPrice) %></b>
									</p></td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>

			<div class="container col-sm-10 col-sm-offset-1">
				<div class="page-header">
					<h3>Payment and Delivery</h3>
				</div>
				
				<div class="container col-sm-10 col-sm-offset-1">

					<div class="page-header text-center">
						<h4>
							<b>Shipping Address</b>
						</h4>
					</div>

					<div class="form-group">
						<form class="form-inline" role="form-horizontal">
						<label class="control-label col-sm-4" for="houseNumber">House Name/				Number </label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="houseNumber"
								id="houseNumber" value="<%= customer.getAddress().getHouseNameNum()%>"><br/>
						</div>
					</div>
					</form>
					<div class="form-group">
						<label class="control-label col-sm-4" for="firstLine"  >Address Line One </label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="firstLine"
								id="firstLine" value="<%= customer.getAddress().getAddressLineOne()%>"><br/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="secondLine">Address Line Two</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="secondLine"
								id="secondLine" value="<%= customer.getAddress().getAddressLineTwo()%>"><br/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="townOrCity">Town
							or City</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="townOrCity"
								id="townOrCity" value="<%= customer.getAddress().getTownOrCity()%>"><br/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="postcode">Postcode</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="postcode" id="postcode" value="<%= customer.getAddress().getPostcode()%>"><br/>
						</div>
					</div>


				</div>


				<div class="container col-sm-10 col-sm-offset-1">

					<div class="page-header text-center">
						<h4>
							<b>Billing Address</b>
						</h4>
					</div>


					<div class="form-group">
						<label class="control-label col-sm-4" for="houseNo">House
							Name/Number</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="bhouseNo"
								id="bhouseNo" value="<%= customer.getAddress().getHouseNameNum()%>"><br/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="firstAddress">Address Line One</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="bfirstAddress"
								id="bfirstAddress" value="<%= customer.getAddress().getAddressLineOne()%>"><br/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="secondAddress">Address Line Two</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="bsecondAddress"
								id="bsecondAddress" value="<%= customer.getAddress().getAddressLineTwo()%>"><br/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="town">Town or
							City</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="btown" id="btown" value="<%= customer.getAddress().getTownOrCity()%>"><br/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="postcodeSA">Postcode</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="bpostcodeSA"
								id="bpostcodeSA" value="<%= customer.getAddress().getPostcode()%>"><br/>
						</div>
					</div>

				</div>

				<div class="container col-sm-6 col-sm-offset-">

					<div class="page-header text-center">
						<h4>
							<b>Delivery Method</b>
						</h4>
					</div>

					<div class="radio">
						<label><input type="radio" name="shippingChoice" id="shippingChoice" value="STANDARD">Standard
							Delivery (3-5 days): £3.99</label><br />
					</div>
					<div class="radio">
						<br /><label><input type="radio" name="shippingChoice" id="shippingChoice" value="NEXT_DAY">Premium
							Delivery (Next working day): £5.99</label>
					</div>

				</div>

				<div class="container col-sm-6 col-sm-offset-0 sky-font">
					<div class="page-header text-center">
						<h4>
							<b>Card Details</b>
						</h4>
					</div>
					<div class="row">
						<div class="col-sm-12 col-sm-offset-">
							<div class="form-group">
								<label class="control-label col-sm-3" for="title">Card
									Type</label>
								<div class="col-sm-9">
									<select class="form-control" name="cardType" id="cardType">
										<option>Please Select..</option>
										<option>Visa</option>
										<option>Mastercard</option>
										<option>American Express</option>
									</select><br/>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-3" for="cardholderName">Cardholder
										Name </label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="cardholderName"
											id="cardholderName"><br/>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-3" for="cardholderName">Card
										Number </label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="cardNumber"
											id="cardNumber"><br/>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label" for="cvv">Card
										CVV</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="cvv" id="cvv"
											placeholder="Security Code"><br/>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="expiry-month">Expiration
									Date</label>
								<div class="col-sm-9">
									<div class="row">
										<div class="col-xs-5">
											<select class="form-control col-sm-4" name="expiry-month"
												id="expiry-month">
												<option value="01">Jan (01)</option>
												<option value="02">Feb (02)</option>
												<option value="03">Mar (03)</option>
												<option value="04">Apr (04)</option>
												<option value="05">May (05)</option>
												<option value="06">June (06)</option>
												<option value="07">July (07)</option>
												<option value="08">Aug (08)</option>
												<option value="09">Sep (09)</option>
												<option value="10">Oct (10)</option>
												<option value="11">Nov (11)</option>
												<option value="12">Dec (12)</option>
											</select>
										</div>
										<div class="col-xs-5">
											<select class="form-control" name="expiry-year">
												<option value="13">2016</option>
												<option value="14">2017</option>
												<option value="15">2018</option>
												<option value="16">2019</option>
												<option value="17">2020</option>
												<option value="18">2021</option>
												<option value="19">2022</option>
												<option value="20">2023</option>
												<option value="21">2024</option>
												<option value="22">2025</option>
												<option value="23">2026</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
					
				 <!-- Submit button -->
				 <div class="container col-sm-10 col-sm-offset-1">
				 
				 
                        <div class="row text-center">
                            <div class="form-group">
                            <input type="hidden" name="orderPrice" value=<%= df.format(totalPrice) %>>
                                <button id="btnSubmit" type="submit" method="post" class="btn btn-default huge-top-buffer bottom-buffer">Confirm</button>
                            </div>
                        </div>  
                        </div>             
			</div></body>
</html>