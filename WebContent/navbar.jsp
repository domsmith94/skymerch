<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,skymerch.entities.*;"%>

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
<nav class="navbar navbar-default">
<div class = "sky-font">
	<div class="col-sm-1 col-sm-offset-0">
		<img src="images/logo.png" class="img-responsive" alt="Logo"
			width="70px" height="70px">
	</div>

	<div class="navbar-header"></div>
	<ul class="nav navbar-nav">
		<li><a href="home">Home</a></li>
		<li><a href="browse">Browse</a></li>
		<li><a href="order_history">Orders</a></li>
		
	</ul>
	<ul class="nav navbar-nav navbar-right">
	
		<li> <form class="small-top-buffer small-right-buffer" method="POST" action="/skymerch/search_results">
				<input type="text" name="searchString" placeholder="Search...">
				<input type="submit" value="Go">
			</form> </li>
		
		
				
		<li><a href="basket"><span
				class="glyphicon glyphicon-shopping-cart"></span> Basket</a></li>
		<%
			if (!auth) {
		%>

		<li><a href="sign-up.jsp"><span
				class="glyphicon glyphicon-user"></span> Sign Up</a></li>
		<li><a href="sign-in.jsp"><span
				class="glyphicon glyphicon-log-in"></span> Sign In</a></li>
				
				<li><a href="contact_us"><span
				class="glyphicon glyphicon-earphone"></span> Contact Us</a></li>

		<%
			} else {
		%>
		<li><a href="user_account"><span class="glyphicon glyphicon-user"></span>
				<%=name%></a></li>

		<li>
			<form method="POST" action="/skymerch/sign-out" class="form-horizontal" role="form">
				<!-- <input type="hidden" name="action" value="logout"> -->
				<button class="btn btn-link navbar-btn nounderline" type="submit"> Sign Out </button>
			</form>
		</li>
		<!-- <li><a href="sign-up.html"> Sign Out</a></li> -->

			<%}%>
		<li><a></a></li>
	</ul>
	</div>
</nav>