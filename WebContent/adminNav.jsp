<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, skymerch.entities.*;"%>

<%
	boolean auth;
	String name = null;

	if (null == session.getAttribute("auth")) {
		auth = false;
	} else {
		auth = true;
		Customer customer = (Customer) session.getAttribute("signedInUser");
		name = customer.getFirstName() + " " + customer.getLastName();
	}
%>

<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class="sr-only"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand"><img src="images/logo.png" alt="Logo"
			height="100%" id="navlogo"></a>
	</div>

	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li><a href="wh-order-history">Orders</a></li>
			<li><a href="stocklevel">Stock Level</a></li>

		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#"><span
					class="glyphicon glyphicon-user"></span> <%=name%></a></li>

			<li>
			<li>
				<form method="POST"
					action="<% 	if (request.getRequestURL().toString().contains("localhost")) { %>/skymerch<% }%>/sign-out"
					class="form-horizontal" role="form">
					<!-- <input type="hidden" name="action" value="logout"> -->
					<button class="btn btn-link navbar-btn nounderline" type="submit">
						Sign Out</button>
				</form>
			</li>
		</ul>
	</div>
</nav>