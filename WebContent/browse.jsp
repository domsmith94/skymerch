<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <script src="js/jquery-3.1.0.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <meta charset="utf-8">
    <title>Product - Sky Merchandise</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link href='https://assets.sky.com/dist/latest/css/fonts.css' rel='stylesheet'>
</head>

<body>
    <div class = "sky-font">
   
<%@ include file="navbar.jsp" %>
<form method="POST" action="/skymerch/filtered_results">
        <div class="container">
            <div class="col-md-2">
                <h3> Filters </h3>
                <div class="col-xs-12">
                    <h4>Category</h4>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="HOUSEHOLD" value="">Household</label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="MEDIA" value="">Media</label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="ELECTRONICS" value="">Electronics</label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="CLOTHING" value="">Clothing</label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="TOYS" value="">Toys</label>
                    </div>
                </div>
                <div class="col-xs-12">
                    <h4>Price</h4>
                    <div class="radio">
                        <label>
                            <input type="radio" name="optradio" value="0-5">£0- £5</label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="optradio" value="5-10">£5- £10</label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="optradio" value="10-20">£10- £20</label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="optradio" value="20-30">£20- £30</label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="optradio" value="30-40">£30- £50</label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="optradio" value="50-10000000000">£50+</label>
                    </div>
                    
             
                </div>
                <div class="col-xs-12 text-center">
                    <button id="btnSubmit" type="submit" class="btn btn-default">Filter</button>
               </form>
               <form action="/skymerch/browse.jsp">
               <button id="btnSubmit" type="submit" class="btn btn-default">Refresh</button>
               </form>
                </div>
                                
                
                
            </div>
            <div class="col-md-10">
                <div class="page-header">
                    <h1>Products <small>Sold by Sky Merchandise</small></h1>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="images/product/product10.jpeg" alt="...">
                            <div class="caption">
                                <h3>Ghostbusters Phone Case</h3>
                                <h4>£6.99</h4>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="images/product/product2.jpeg" alt="...">
                            <div class="caption">
                                <h3>James Bond Top Trumps</h3>
                                <h4>£2.99</h4>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="images/product/product3.jpeg" alt="...">
                            <div class="caption">
                                <h3>Shrek Mug</h3>
                                <h4>£4.99</h4>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="images/product/product4.jpeg" alt="...">
                            <div class="caption">
                                <h3>Minion Bag</h3>
                                <h4>£9.99</h4>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="images/product/product5.jpeg" alt="...">
                            <div class="caption">
                                <h3>Ghostbusters Hat</h3>
                                <h4>£12.99</h4>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="images/product/product6.jpeg" alt="...">
                            <div class="caption">
                                <h3>Game of Thrones Pin</h3>
                                <h4>£2.99</h4>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="images/product/product7.jpeg" alt="...">
                            <div class="caption">
                                <h3>Game of Thrones Babygrow</h3>
                                <h4>£14.99</h4>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="images/product/product8.jpeg" alt="...">
                            <div class="caption">
                                <h3>Sky Cycling Jersey</h3>
                                <h4>£59.99</h4>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="images/product/product9.jpeg" alt="...">
                            <div class="caption">
                                <h3>Sky Remote</h3>
                                <h4>£24.99</h4>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="images/product/product9.jpeg" alt="...">
                            <div class="caption">
                                <h3>Sky Remote</h3>
                                <h4>£24.99</h4>
                            </div>

                        </div>
                    </div>                    
                </div>
            </div>
        </div>
    </div>
</body>
    <script src="js/browse.js"></script>
</html>
