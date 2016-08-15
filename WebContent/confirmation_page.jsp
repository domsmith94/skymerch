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
<title>Product - Sky Merchandise</title>
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
				
			<div class="container col-sm-10 col-sm-offset-1">
		        <form>
		            <div class="page-header">
		                <h1 class="sky-text">
		                    <b>Thank you for your order!</b>
		                </h1>
		            </div>

		            <div></div>

		            <div class="container col-sm-10 col-sm-offset-1">
		                <div class= "text-center">
		                <div class= "greentick">
		                        <h1> <span class="glyphicon glyphicon-ok"></span></h1> 
		                    </div>
		                    <h3>Your Order Number is 202364</h3>
		            <h4>Please check your email inbox shortly, a confirmation email is on the way.</h4>
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
		                            <tr>
		                                <td>Shrek Mug</td>
		                                <td>£4.99</td>
		                                <td>1</td>
		                                <td>£4.99</td>
		                            </tr>
		                            <tr>
		                                <td>Game of Thrones T-Shirt</td>
		                                <td>£9.99</td>
		                                <td>2</td>
		                                <td>£19.98</td>
		                            </tr>
		                            <tr>
		                                <td>Ghostbusters Top Trumps</td>
		                                <td>£2.99</td>
		                                <td>2</td>
		                                <td>£5.99</td>
		                            </tr>
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
		                                <b>£20.97</b>
		                            </p>
		                            <p>
		                                <b>£1.00</b>
		                            </p>
		                            <p>
		                                <b>£21.97</b>
		                            </p></td>
		                    </tr>
		                        </tbody>
		                    </table>
		                     <div class="text-center">
		                        <div class="top-buffer">
		                            <button type="button" class="btn btn-info">Continue shopping</button>
		                        </div>
		                    </div>
		                </div>
		            </div>
		    </form>     
		</div>
		</div>
	</body>
</html>