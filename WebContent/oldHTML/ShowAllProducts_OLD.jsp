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
	List<Product> allProducts = (ArrayList<Product>)session.getAttribute("product_list"); 
	for (Product p: allProducts){  %>
	<br />
	
	
	<a href= "product?id=<%= p.getProdId() %>"><%= p.getProdName() %> 	</a>
	
	
	
	
<% } %>

</body>
</html>