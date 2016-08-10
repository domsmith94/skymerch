<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
import = "java.util.*,skymerch.entities.*;" 
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <script src="js/jquery-3.1.0.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <meta charset="ISO-8859-1">
    <title>Product - Sky Merchandise</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link href='https://assets.sky.com/dist/latest/css/fonts.css' rel='stylesheet'>
</head>

<body>
    <nav class="navbar navbar-default">
        <div class="col-sm-1 col-sm-offset-0">
            <img src="images/logo.png" class="img-responsive" alt="Logo" width="70px" height="70px">
        </div>
        <div class="navbar-header"></div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#">Browse</a></li>
            <li><a href="#">Orders</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span
					class="glyphicon glyphicon-shopping-cart"></span> Basket</a></li>
            <li><a href="sign-up.html"><span
					class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li><a href="sign-in.html"><span class="glyphicon glyphicon-log-in"></span>
					Sign In</a></li>
            <li>
                <a></a>
            </li>
        </ul>
    </nav>
<%

Integer productId = (Integer)session.getAttribute("id"); 

Product product = (Product)session.getAttribute("product");
//boolean result = ProductValidator.validate(product);
%>
<%= productId %><br />
<h1> <%= product.getProdName() %> �<%= product.getPrice() %> </h1>
<img src="images/placeholder.jpg"><br />
<%= product.getProdDesc() %>
</body>
</html>


