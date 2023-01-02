<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<!-- head of program  -->
       <meta charset="UTF-8">
       <meta name="viewprrt" content="width=device-width, initial-scale=1">
	   <title>Customer Look Up</title>
   	   
   	   <!-- Icon -->
       <link rel="icon" href="images/main_ticket.svg">
    	<link rel="stylesheet" href="main_index.css">

   	   <!-- Bootstrap CSS -->
   	   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
   	   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
	
	
<!-- body  -->
<body>

<!-- NAV BAR! -->
<!-- NAV BAR! -->
<div class="bar"> 
	<nav class="navbar navbar-expand-sm bg-blue navbar-dark" style="background-color: #698474;">
	   <!-- Brand -->
	   <a class="navbar-brand" href="#"><img src="..\images\phone_emblem.png" height="40"></a>

   	<!-- Links for the JSP FILES-->
  	<ul class="navbar-nav">
    	<li class="nav-item">
           <a class="nav-link" href="index.jsp">Home</a>
    	</li>
    	<!-- <li class="nav-item">
      		<a class="nav-link" href="customerfunction.jsp">Search Phone</a>
    	</li> -->
    	<li class="nav-item">
      		<a class="nav-link" href="makebid.jsp">Make Bid</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link" href="makebid.jsp">Bidding History</a>
		</li>    		
		
		<li class="nav-item">
      		<a class="nav-link" href="submit_questions.jsp"> Ask Question</a>
		</li>  
		
		<li class="nav-item">
      		<a class="nav-link" href="createAuction.jsp">Create Auction</a>
		</li>
		
		<li class="nav-item">
      		<a class="nav-link" href="login_customer.jsp">Logout</a>
		</li>    	
 
 
  </ul>

</nav>	
</div>
<br>
<h4 align='center'> Look up a Phone or create Alert a Phone you'd like! </h4>
									  

 <!-- Show html form to i) display something, ii) choose an action via a 
  | radio button -->
<!-- forms are used to collect user input 
	The default method when submitting form data is GET.
	However, when GET is used, the submitted form data will be visible in the page address field-->

<div align='center'>
<br>
	<form method="get"> <!-- action="auctionshow.jsp" -->
	<!-- method="get" action="schedulesort.jsp"-->
		<table>
			<tr>    
				<td><h5>Color:</h5></td><td><input type="text" name="color"></td>
			</tr>
			<tr>
				<td><h5>Brand:</h5></td><td><input type="text" name="brand"></td>
				
			</tr>
			<tr>
				<td><h5>Model:</h5></td><td><input type="text" name="model"></td>
				
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<p> Sort Parameter</p>
				<select name="sort" size=1>
					<option value="none">None</option>
					<option value="color">Color</option>
					<option value="model">Model</option>
					<option value="brand">Brand</option>
					<option value="endDate">End Date</option>
				</select> 
			</tr>
		</table>
		<br> 
		<div class="alert alert-primary" role="alert" align='center'> 
			<input type="submit" formaction = "auctionshow.jsp" value="Search Item!">
			<input type="submit" formaction = "createAlert.jsp" value="Make Alert">
		</div>
	</form>
<br>

<h4 align='center'> Look up a question by keyword. </h4>
<form method="get" action="questionSearch.jsp">
	<!-- method="get" action="schedulesort.jsp"-->
		<table>
			<tr>    
				<td><h5>keyword:</h5></td><td><input type="text" name="keyword"></td>
			</tr>
			
		</table>
		<br> 
		<div class="alert alert-primary" role="alert" align='center'> 
			<input type="submit" value="Search Question">
		</div>
		
	</form>
</div>


<br>

</body>
</html>