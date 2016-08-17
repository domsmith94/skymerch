<%@ page language="java" contentType="text/html; charset=UTF-8"
import = "java.util.*,skymerch.entities.*" 
pageEncoding="UTF-8"%>
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
    <meta charset="UTF-8">
    <title>Product - Sky Merchandise</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
 <link href='css/fonts.css'
	rel='stylesheet'>
    	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>

<body>

    <%@ include file="navbar.jsp" %>
<%

Integer productId = (Integer)session.getAttribute("id"); 

Product product = (Product)session.getAttribute("product");
//boolean result = ProductValidator.validate(product);
%>


<div class = "sky-font">

<div class="container bottom-buffer">
        <div class="col-md-10 col-md-offset-1">
            <div class = "col-md-6">
               
                    <div class="col-md-12">
                        <div class="thumbnail">
                            <img src="images/product/product<%= productId %>.jpeg" alt="<%= product.getProdName() %> Picture">
                            <div class="caption">
                                <p> <%= product.getProdDesc() %></p>
                            </div>
                        </div>
                    </div>
             </div>
                    <div class="col-md-6">
                    	<div class="page-header">
                        	<h1 class="text-center"><%= product.getProdName() %></h1>
                        </div>
                        <h4 class="text-center">Product ID: <%= productId %></h4>
                            <div class="row top-buffer">
                                 <h3 class = "text-center">£<%= product.getPrice() %></h3>
                            </div>
                            <div class="row top-buffer">
                            <div class="rating">
                             <p class = "text-center">Customer Rating: <% 
                                 double rating = product.getRating() ;
                                 if (rating >= 4.8) { %> 
                                 <i class="glyphicon glyphicon-star"></i>
                                 <i class="glyphicon glyphicon-star"></i>
                                 <i class="glyphicon glyphicon-star"></i>
                                 <i class="glyphicon glyphicon-star"></i>
                                 <i class="glyphicon glyphicon-star"></i>
                                                                	
                               	<% } else if (rating >= 4.3) { %>
                               	<i class="glyphicon glyphicon-star"></i>
                                 <i class="glyphicon glyphicon-star"></i>
                                 <i class="glyphicon glyphicon-star"></i>
                                 <i class="glyphicon glyphicon-star"></i>
                                 <i class="glyphicon glyphicon-star half"></i>
                                                                                           
                                 <% } else if (rating >= 3.8) { %>
                                	<i class="glyphicon glyphicon-star"></i>
                                  <i class="glyphicon glyphicon-star"></i>
                                  <i class="glyphicon glyphicon-star"></i>
                                  <i class="glyphicon glyphicon-star"></i>
                                  <i class="glyphicon glyphicon-star-empty"></i>
                                  
                                  <% } else if (rating >= 3.3) { %>
                                	<i class="glyphicon glyphicon-star"></i>
                                  <i class="glyphicon glyphicon-star"></i>
                                  <i class="glyphicon glyphicon-star"></i>
                                  <i class="glyphicon glyphicon-star half"></i>
                                  <i class="glyphicon glyphicon-star-empty"></i>
                                  
                                  <% } else if (rating >= 2.8) { %>
                                	<i class="glyphicon glyphicon-star"></i>
                                  <i class="glyphicon glyphicon-star"></i>
                                  <i class="glyphicon glyphicon-star"></i>
                                  <i class="glyphicon glyphicon-star-empty"></i>
                                  <i class="glyphicon glyphicon-star-empty"></i>
                                  
                                  <% } else if (rating >= 2.3) { %>
                                	<i class="glyphicon glyphicon-star"></i>
                                  <i class="glyphicon glyphicon-star"></i>
                                  <i class="glyphicon glyphicon-star half"></i>
                                  <i class="glyphicon glyphicon-star-empty"></i>
                                  <i class="glyphicon glyphicon-star-empty"></i>
                                  
                                  <% } else if (rating >= 1.8) { %>
                                	<i class="glyphicon glyphicon-star"></i>
                                  <i class="glyphicon glyphicon-star"></i>
                                  <i class="glyphicon glyphicon-star-empty"></i>
                                  <i class="glyphicon glyphicon-star-empty"></i>
                                  <i class="glyphicon glyphicon-star-empty"></i>
                                  
                                  <% } else if (rating >= 1.3) { %>
                                	<i class="glyphicon glyphicon-star"></i>                                
                                  <i class="glyphicon glyphicon-star half"></i>
                                  <i class="glyphicon glyphicon-star-empty"></i>
                                  <i class="glyphicon glyphicon-star-empty"></i>
                                  <i class="glyphicon glyphicon-star-empty"></i>
                                  
                                  <% } else if (rating >= 0.8) { %>
                                	<i class="glyphicon glyphicon-star"></i>   
                                	<i class="glyphicon glyphicon-star-empty"></i>
                                	<i class="glyphicon glyphicon-star-empty"></i>
                                	<i class="glyphicon glyphicon-star-empty"></i>
                                	<i class="glyphicon glyphicon-star-empty"></i>                             
                                  
                                  <% } else if (rating <= 0.8) { %>
                                	<i class="glyphicon glyphicon-star half"></i> 
                                	<i class="glyphicon glyphicon-star-empty"></i>
                                	<i class="glyphicon glyphicon-star-empty"></i>
                                	<i class="glyphicon glyphicon-star-empty"></i>
                                	<i class="glyphicon glyphicon-star-empty"></i>   
                                  
                                  <% } else { %>
                                	<i class="glyphicon glyphicon-star-empty"></i> 
                                	<i class="glyphicon glyphicon-star-empty"></i>
                                	<i class="glyphicon glyphicon-star-empty"></i>
                                	<i class="glyphicon glyphicon-star-empty"></i>
                                	<i class="glyphicon glyphicon-star-empty"></i> 
                                  
                                  <% }  
                                 
                                 %>
                                </p><p class = "text-center">Average <%=(product.getRating())%>/5 from <b><%=product.getNumOfRatings()%></b> ratings.</p>
                               </div>
                            </div>
                                <div class="row top-buffer">
                                     <div class = "text-center">
                                     		<% if (product.getStockLevel()>=5){%>
                                     		
                                           <h4> <span class="glyphicon glyphicon-ok"></span> <span class="label label-success">Item in stock</span></h4> 
                                           <% } else if (product.getStockLevel()>0 && product.getStockLevel()<=4){ %>
                                           <h4> <span class="glyphicon glyphicon-hourglass"></span> <span class="label label-warning">Only <%= product.getStockLevel() %> left!</span></h4>
                                           <% } else if (product.getStockLevel()==0){ %>
                                           <h4> <span class="glyphicon glyphicon-remove"></span> <span class="label label-danger">Item is out of stock</span></h4>
                                           <% } else  { %> stock error <% } %>
                                    </div>  
                                </div>
                    <form name="productsOrdered" method="POST" action="<% 	if (request.getRequestURL().toString().contains("localhost")) { %>/skymerch<% }%>/addToBasket">
                    <input type="hidden" name="id" value="<%= productId %>">
                        <div class="row top-buffer">
                            <div class="col-md-6 col-md-offset-3">
                                    <select class="form-control" name="quantity" id="quantity">
                                        <option selected="selected">Select quantity</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                        <option>9</option>
                                        <option>10</option>
                                    </select>
                            </div>
    					</div>
							<div class="row top-buffer">
								<div class="text-center">
									<button type="submit" class="btn btn-default">Add to basket</button>
								</div>
							</div>
                    </form>
				</div>
		</div>			
	</div>
	</div>
</body>
</html>


