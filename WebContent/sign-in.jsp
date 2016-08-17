<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,skymerch.entities.*"%>
	
<%
	boolean invalidLogin = false;

	if (!(null == session.getAttribute("invalidLogin"))) {
		invalidLogin = true;
	} 
%>
	
<!DOCTYPE html>
<html>
<head>
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
<script src="js/jquery-3.1.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<meta charset="UTF-8"/>
<title>Sign In - Sky Merchandise</title>
<link rel="stylesheet" type="text/css" href="style.css">
 <link href='css/fonts.css'
	rel='stylesheet'>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>

<body>
	<!-- Nav Bar -->
	<%@ include file="navbar.jsp"%>

	<div class="text-center">
		<h1 class="sky-big-text">Sign In</h1>
	</div>

	<% if (invalidLogin) { %>
	<div class="col-sm-4 col-sm-offset-4">
		<div class="col-m-10 col-sm-offset-1">
			<div class="alert alert-danger text-center">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				Invalid email or password
			</div>
		</div>
	</div>
	<%	} %>

	<div class="row">
		<div class="container sky-font">
			<div class="col-sm-6 col-sm-offset-3">
				<form method="POST" action="<% 	if (request.getRequestURL().toString().contains("localhost")) { %>/skymerch<% }%>/sign-in"
					class="form-horizontal" role="form">
					<div class="form-group">
						<label class="control-label col-sm-4" for="email">Email</label>
						<div class="col-sm-8">
							<input type="email" class="form-control" name="email" id="email">
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
						<div class="row text-center">
							<button type="submit" class="btn btn-default">Sign In</button>
						</div>
					</div>
					<div class="link row text-center">
						<a href="sign-up">Haven't got an account?</a>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>