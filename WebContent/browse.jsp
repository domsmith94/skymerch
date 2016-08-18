<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<script src="js/jquery-3.1.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Browse Products - Sky Merchandise</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='css/fonts.css'
	rel='stylesheet'>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container sky-font">

		<!-- FILTER BANK -->
		<!-- <div class="col-xs-12 panel-group hidden-sm hidden-md hidden-lg">		
					<div class="container sky-font">
						<div class="col-xs-12 col-sm-3 col-md-2">
							<form method="POST" action="<% 	if (request.getRequestURL().toString().contains("localhost")) { %>/skymerch<% }%>/filtered_results">
								<div class="col-xs-4 col-sm-12">
									<h4>Category</h4>
									<div class="checkbox">
										<label> <input type="checkbox" name="HOUSEHOLD"
											value="">Household
										</label>
									</div>
									<div class="checkbox">
										<label> <input type="checkbox" name="MEDIA" value="">Media
										</label>
									</div>
									<div class="checkbox">
										<label> <input type="checkbox" name="ELECTRONICS"
											value="">Electronics
										</label>
									</div>
									<div class="checkbox">
										<label> <input type="checkbox" name="CLOTHING"
											value="">Clothing
										</label>
									</div>
									<div class="checkbox">
										<label> <input type="checkbox" name="TOYS" value="">Toys
										</label>
									</div>
								</div>
								<div class="col-xs-4 col-sm-12">
									<h4>Price</h4>
									<div class="radio">
										<label> <input type="radio" name="optradio"
											value="0-5">£0- £5
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="optradio"
											value="5-10">£5- £10
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="optradio"
											value="10-20">£10- £20
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="optradio"
											value="20-30">£20- £30
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="optradio"
											value="30-40">£30- £50
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="optradio"
											value="50-10000000000">£50+
										</label>
									</div>
								</div>
								<div class="col-xs-4 col-sm-12">
									<button id="btnSubmit" type="submit" class="btn btn-default filterbutton">Filter</button>
								</div>
							</form>
							<form action="<% 	if (request.getRequestURL().toString().contains("localhost")) { %>/skymerch<% }%>/browse">
								<div class="col-xs-4 col-sm-12">
									<button id="btnSubmit" type="submit"
										class="btn btn-default filterbutton">Clear All</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div> -->

		<div class="col-xs-12 col-sm-3 col-md-2">
			<form method="POST" action="<% 	if (request.getRequestURL().toString().contains("localhost")) { %>/skymerch<% }%>/filtered_results">
				<h3>Filters</h3>
				<div class="col-xs-4 col-sm-12">
					<h4>Category</h4>
					<div class="checkbox">
						<label> <input type="checkbox" name="HOUSEHOLD" value="">Household
						</label>
					</div>
					<div class="checkbox">
						<label> <input type="checkbox" name="MEDIA" value="">Media
						</label>
					</div>
					<div class="checkbox">
						<label> <input type="checkbox" name="ELECTRONICS" value="">Electronics
						</label>
					</div>
					<div class="checkbox">
						<label> <input type="checkbox" name="CLOTHING" value="">Clothing
						</label>
					</div>
					<div class="checkbox">
						<label> <input type="checkbox" name="TOYS" value="">Toys
						</label>
					</div>
				</div>
				<div class="col-xs-4 col-sm-12">
					<h4>Price</h4>
					<div class="radio">
						<label> <input type="radio" name="optradio" value="0-5">£0-
							£5
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="optradio" value="5-10">£5-
							£10
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="optradio" value="10-20">£10-
							£20
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="optradio" value="20-30">£20-
							£30
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="optradio" value="30-40">£30-
							£50
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="optradio"
							value="50-10000000000">£50+
						</label>
					</div>
				</div>
				<div class="col-xs-4 col-sm-12 text-center">
					<button id="btnSubmit" type="submit" class="btn btn-default">Filter</button>
				</div>
			</form>
			<form action="<% 	if (request.getRequestURL().toString().contains("localhost")) { %>/skymerch<% }%>/browse">
				<div class="col-xs-4 col-sm-12 text-center top-buffer">
					<button id="btnSubmit" type="submit" class="btn btn-default">Clear
						All</button>
				</div>
			</form>
		</div>

		<!-- MAIN BODY -->
		<div class=" col-xs-12 col-sm-9 col-md-10">
			<div class="page-header">
				<h1>
					Products <small>Sold by Sky Merchandise</small>
				</h1>
			</div>
			<div class="row">
				<%
					List<Product> tiledAllProducts = (ArrayList<Product>) session.getAttribute("allProducts");
					if (tiledAllProducts == null) {
				%>
				<p>There are no products to display</p>
				<%
					} else {
						for (Product p : tiledAllProducts) {
				%>
				<div class="col-sm-6 col-md-3">
				
					<div class="thumbnail thumbnail_small shadowfilter">

						<div class="grow" id="inner">
							<a href="product?id=<%=p.getProdId()%>"> 
							<img src="images/product/product<%=p.getProdId()%>.jpeg" alt="..." width="242px" height="240px">
							</a>
						</div>
						
						<!--  <div class="hover_shine"></div> -->
						<div class="caption">
							<h3>
								<a href="product?id=<%=p.getProdId()%>"><%=p.getProdName()%></a>
							</h3>
							<h4><%="£" + p.getPrice()%></h4>

						</div>
					</div>
				</div>
				<%
					}
					}
				%>
			</div>
		</div>
	</div>
	<script src="js/browse.js"></script>
	<script>
		$(window).scroll(function() {
			$(".slideanim").each(function() {
				var pos = $(this).offset().top;

				var winTop = $(window).scrollTop();
				if (pos < winTop + 600) {
					$(this).addClass("slide");
				}
			});
		});
	</script>
</body>

</html>