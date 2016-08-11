<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "java.util.*,skymerch.entities.*;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

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