<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/angular.js"></script>
<script src="js/angular-validation-match.js"></script>
<script src="js/app.js"></script>
<script src="js/registerController.js"></script>
<script src="js/wizValidation.js"></script>

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
		<div ng-app="myApp">
			<div class="text-center">
				<h1 class="sky-big-text">Sign Up</h1>
			</div>
			<div class="row big-top-buffer" ng-controller="registerController">
				<div class="container sky-font">
					<div class="col-md-12">
						<form method="POST" action="<% 	if (request.getRequestURL().toString().contains("localhost")) { %>/skymerch<% }%>/sign-up" class="form-horizontal" role="form" id="signUpForm" name='signUpForm', novalidate=''>
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-sm-4" for="title">Title</label>
									<div class="col-sm-8">
										<select class="form-control" name="title" id="title" ng-model="title" required>
											<option>Mr</option>
											<option>Miss</option>
											<option>Ms</option>
											<option>Mrs</option>
										</select>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : signUpForm.firstName.$invalid && !signUpForm.firstName.$pristine }">
									<label class="control-label col-sm-4" for="firstName">First
										Name </label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="firstName"
											id="firstName" ng-model="firstName" required>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : signUpForm.lastName.$invalid && !signUpForm.lastName.$pristine }">
									<label class="control-label col-sm-4" for="lastName">Last
										Name </label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="lastName"
											id="lastName" ng-model="lastName" required>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : signUpForm.email.$invalid && !signUpForm.email.$pristine }">
									<label class="control-label col-sm-4" for="email">Email</label>
									<div class="col-sm-8">
										<input type="email" class="form-control" name="email"
											id="email" ng-model="email" required>
										<!-- Name for email added -->
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : signUpForm.password.$invalid && !signUpForm.password.$pristine }">
									<label class="control-label col-sm-4" for="password">Password</label>
									<div class="col-sm-8">
										<input type="password" placeholder="6 Characters including one number and Capital" class="form-control" name="password"
											id="password" ng-model="password" required>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : signUpForm.confirmPassword.$invalid && !signUpForm.confirmPassword.$pristine }">
									<label class="control-label col-sm-4" for="confirmPassword">Confirm
										password </label>
									<div class="col-sm-8">
										<input type="password" class="form-control"
											name="confirmPassword" placeholder="Passwords must match" id="confirmPassword" ng-model="confirmPassword" required match="password">
										<p class="help-block text-center" ng-show="signUpForm.confirmPassword.$error.match && !signUpForm.confirmPassword.$pristine"> Password entered does not match </p>
									</div>

								</div>
							</div>
							<!-- Repeat - to be changed -->
							<div class="col-md-6">
									<div class="form-group" ng-class="{ 'has-error' : signUpForm.houseNum.$invalid && !signUpForm.houseNum.$pristine }">
										<label class="control-label col-sm-4" for="houseNum">House Name/Number
											</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" name="houseNum"
												id="houseNum" ng-model="houseNum" required>
										</div>
									</div>
									<div class="form-group" ng-class="{ 'has-error' : signUpForm.firstAddr.$invalid && !signUpForm.firstAddr.$pristine }">
										<label class="control-label col-sm-4" for="firstAddr">Address Line One </label>
										<div class="col-sm-8">
											<input type="text" class="form-control" name="firstAddr"
												id="firstAddr" ng-model="firstAddr" required>
										</div>
									</div>
									<div class="form-group" ng-class="{ 'has-error' : signUpForm.secondAddr.$invalid && !signUpForm.secondAddr.$pristine }" >
										<label class="control-label col-sm-4" for="secondAddr">Address Line Two</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" placeholder="Optional" name="secondAddr"
												id="secondAddr" ng-model="secondAddr">
										</div>
									</div>
									<div class="form-group" ng-class="{ 'has-error' : signUpForm.townCity.$invalid && !signUpForm.townCity.$pristine }">
										<label class="control-label col-sm-4" for="townCity">Town
											or City</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" name="townCity"
												id="townCity" ng-model="townCity" required>
										</div>
									</div>
									<div class="form-group" ng-class="{ 'has-error' : signUpForm.postcode.$invalid && !signUpForm.postcode.$pristine }">
										<label class="control-label col-sm-4" for="postcode">Postcode</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" name="postcode"
												id="postcode" ng-model="postcode" required wiz-val-postcode>
										</div>
									</div>
								</div>
							<!-- Submit button -->
							<div class="col-md-12 top-buffer">
								<div class="row text-center">
									<div class="form-group text-center">
										<button id="btnSubmit" type="submit" class="btn btn-default" ng-disabled='signUpForm.$invalid'>Sign
											Up</button>
									</div>
									<div class="link">
						<a href="sign-in">Already got an account?</a>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
</body>

</html>