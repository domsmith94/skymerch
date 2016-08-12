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
<title>Sign Up - Sky Merchandise</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://assets.sky.com/dist/latest/css/fonts.css'
	rel='stylesheet'>
</head>

<body>
	<div class="sky-font">
	<!-- Nav Bar -->
	<%@ include file="navbar.jsp"%>
		<div>
			<div class="text-center">
				<h1 class="sky-big-text">Sign Up</h1>
			</div>
			<div class="row">
				<div class="container sky-font">
					<div class="col-sm-6 col-sm-offset-3">
						<form method="POST" action="/skymerch/sign-up"
							class="form-horizontal" role="form">
							<div class="form-group">
								<label class="control-label col-sm-4" for="title">Title</label>
								<div class="col-sm-8">
									<select class="form-control" name="title" id="title">
										<option>Please Select..</option>
										<option>Mr</option>
										<option>Miss</option>
										<option>Ms</option>
										<option>Mrs</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="firstName">First
									Name </label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="firstName"
										id="firstName">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="lastName">Last
									Name </label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="lastName"
										id="lastName">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Email</label>
								<div class="col-sm-8">
									<input type="email" class="form-control" name="email"
										id="email">
									<!-- Name for email added -->
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="password">Password</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" name="password"
										id="password">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="confirmPassword">Confirm
									password </label>
								<div class="col-sm-8">
									<input type="password" class="form-control"
										name="confirmPassword" id="confirmPassword">
								</div>
							</div>
							<!-- Repeat - to be changed -->
							<div class="form-group">
								<label class="control-label col-sm-4" for="houseNum">House
									Number or Name </label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="houseNum"
										id="houseNum">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="firstAddr">First
									Line of Address </label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="firstAddr"
										id="firstAddr">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="secondAddr">Second
									Line of Address</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="secondAddr"
										id="secondAddr">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="townCity">Town
									or City</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="townCity"
										id="townCity">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="postcode">Postcode</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="postcode"
										id="postcode">
								</div>
							</div>
							<!-- Submit button -->
							<div class="row text-center">
								<div class="form-group">
									<button id="btnSubmit" type="submit" class="btn btn-default">Sign
										Up</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="row text-center">
					<div class="link">
						<a href="sign-in.html">Already got an account?</a>
					</div>
				</div>
			</div>
		</div>
		<script src="js/sign-up.js"></script>
</body>

</html>