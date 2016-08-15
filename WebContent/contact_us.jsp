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
<meta charset="utf-8">
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
			<div class="page-header">
				<h1 class="sky-text">
					<b>Contact Us</b>
				</h1>
			</div>



			<div class="container">
				<h2>Our Sky Merchandise experts can help solve your issue!</h2>
				<h3>Contact Details</h3>
				<p>If you need to contact us for any reason please use the below
					contact details</p>
				<table class="table table-condensed">
					<thead>
						<tr>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span class="glyphicon glyphicon-earphone"></span></td>
							<td>Customer services</td>
							<td>0208 311 8111</td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-envelope"></span></td>
							<td>Customer Services</td>
							<td>customer.services@sky.uk</td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-earphone"></span></td>
							<td>Support</td>
							<td>0208 311 8222</td>
						</tr>

						<tr>
							<td><span class="glyphicon glyphicon-envelope"></span></td>
							<td>Support</td>
							<td>support@sky.uk</td>
						</tr>

						<tr>
							<td><span class="glyphicon glyphicon-earphone"></span></td>
							<td>Complaints</td>
							<td>0208 311 8333</td>
						</tr>

						<tr>
							<td><span class="glyphicon glyphicon-envelope"></span></td>
							<td>Complaints</td>
							<td>complaints@sky.uk</td>
						</tr>

					</tbody>
				</table>
			</div>

			<div class="container">
				<h2>Issue with you TV, broadband or other sky product?</h2>
				<p>If you are having an issue with your TV, broadband or other
					sky product please follow the below link to the Sky Help & Support
					site.</p>
				<a href="https://www.sky.com/help/home/sky-plus"
					class="btn btn-default" role="button">Sky Help & Support</a>
			</div>
		</div>
	</div>

</body>
</html>