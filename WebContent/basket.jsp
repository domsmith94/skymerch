<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "java.util.*,skymerch.entities.*;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

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
<%@ include file="navbar.jsp" %>

<%  
	Basket basket = new Basket();
	List<Product> productsInBasket = new ArrayList<Product>();
	try{
		basket = (Basket)session.getAttribute("basket"); 
		productsInBasket = basket.getBasketProducts();
	} catch(Exception e){
		// nothing
	}
	
	
	
	for (Product p: productsInBasket){  
	%>
	<br />
	
	
 	<a href= "product?id=<%= p.getProdId() %>"><%= p.getProdName() %> 	</a> 
	
	
	
	
<% } %>

</body>
</html>