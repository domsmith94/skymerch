<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "java.util.*, com.sky.database.stuff.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<% 
		String name = (String)session.getAttribute("userName");
		String betterWebsite = (String)session.getAttribute("betterWebsite");
		String reasonWhy = (String)session.getAttribute("reasonWhy");
	%>

you have been reported to the police for lying you liear<br />

your name <br />
<p><%= name %></p>
the people who paid you to lie <br />
<p><%= betterWebsite %></p>
the evidence of the lies you said <br />
<p><%= reasonWhy %></p>

we hope to have you locked up in 2-4 weeks

<a href="/MyWebsite1/byebye">OK</a>

<p>as a consolation prize pelase have a list fo salesleople innit</p>

<%  
	List<Salesperson> allSalespersons = (ArrayList<Salesperson>)session.getAttribute("salespeople"); 
		int i=0;
	for (Salesperson s: allSalespersons){  %>
	<br />
	<%= s.getFirstName() %>	
	
<% } %>



</body>
</html>