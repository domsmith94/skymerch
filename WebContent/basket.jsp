<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*,skymerch.entities.*,java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Basket Page - Sky Merchandise</title>

    <script src="js/jquery-3.1.0.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link href='https://assets.sky.com/dist/latest/css/fonts.css' rel='stylesheet'>
</head>

<body>
<%@ include file="navbar.jsp" %>

<!-- <form method="post" action="/skymerch/updateBasket" class="form-horizontal" role="form">

<button type="submit" class="btn btn-default">Update basket</button>
 -->
<%  
	Basket basket = new Basket();
	List<BasketLine> linesInBasket = new ArrayList<BasketLine>();
	try{
		basket = (Basket)session.getAttribute("basket"); 
		linesInBasket = basket.getBasketLines();
	} catch(Exception e){
		session.setAttribute("basket", basket);
	}
	
	DecimalFormat df = new DecimalFormat();
	df.setMaximumFractionDigits(2);
	df.setMinimumFractionDigits(2);
	Double totalPrice = 0.0;
	//for (BasketLine bl: linesInBasket){  
	%>
<%-- 	<br />
	
	
 	<a href= "product?id=<%= bl.getProduct().getProdId() %>"><%= bl.getProduct().getProdName() %> 	</a> 
	
	Quantity: <%= bl.getQuantity() %>
	Item Price: £<%= bl.getProduct().getPrice() %>
	Price: £<%= df.format(bl.getQuantity()*bl.getProduct().getPrice()) %>
	Change Quantity: <input type="number" class="form-control" name="quantityProduct<%= bl.getProduct().getProdId() %>" value=<%= bl.getQuantity() %> id="quantityProduct<%= bl.getProduct().getProdId() %>">
	
<% totalPrice =  bl.getQuantity()*bl.getProduct().getPrice() + totalPrice;

	} %>
	<br />
	Total Price: = £<%= df.format(totalPrice) %>



</form> --%>
<form method="post" action="/skymerch/updateBasket" class="form-horizontal" role="form">
<div class="container">
            <div class="col-md-10 col-md-offset-1">
                <div class="col-md-6">
                    <h1 class="text-left">My basket</h1>
                </div>
                <div class="col-md-5">
                    <div class="text-right">
                        <div class="top-buffer">
                            <button type="submit" method="post" action="/skymerch/updateBasket" class="btn btn-info">Update basket</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-1">
                    <h4>
                    <div class="row big-top-buffer">
                        <span class="glyphicon glyphicon-refresh"></span> 
                    </div>
                </h4>
                </div>
                <div class="huge-top-buffer">
                    <div class="col-md-12">
                        <div class="sky-medium-font">
                            <table class="table borderless">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Item</th>
                                        <th class="text-center">Unit Price</th>
                                        <th class="text-center">Quantity</th>
                                        <th class="text-center">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <% for (BasketLine bl: linesInBasket){  %>
                                    <tr>
                                        <td><img src="images/product/product<%= bl.getProduct().getProdId() %>.jpeg" alt="<%= bl.getProduct().getProdName() %> Picture"></td>
                                        <td><a href= "product?id=<%= bl.getProduct().getProdId() %>"><%= bl.getProduct().getProdName() %> 	</a> </td>
                                        <td class="text-center">£<%= bl.getProduct().getPrice() %></td>
                                        <td class="text-center">
                                            
                                                <input type="number" class="form-control" name="quantityProduct<%= bl.getProduct().getProdId() %>" value=<%= bl.getQuantity() %> id="quantityProduct<%= bl.getProduct().getProdId() %>">
                                            
                                        </td>
                                        <td class="text-center">£<%= df.format(bl.getQuantity()*bl.getProduct().getPrice()) %></td>
                                    </tr>
                                <% totalPrice =  bl.getQuantity()*bl.getProduct().getPrice() + totalPrice;
                                } %>    
                                </tbody>
                            </table>
                            <div class="row">
                                <div class = "col-md-12">
                                    <h3 class="text-right">Subtotal: £<%= df.format(totalPrice) %></h3>
                                </div>
                            </div>
                            <div class="row">
                                <div class = "col-md-12">
                                    <h4 class="text-right"><i>VAT: £<%= df.format(totalPrice*(1-1/1.2)) %> </i></h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-right">
                    <div class="huge-top-buffer">
                        <a href="/skymerch/checkout" type="button" class="btn btn-info">
                            <h4>Checkout</h4></a>
                    </div>
                </div>
            </div>
        </div>
</form>
</body>
</html>