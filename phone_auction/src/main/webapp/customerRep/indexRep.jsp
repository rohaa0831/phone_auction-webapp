<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- If user is NULl -->
<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in
<br/>

<a href="../login.jsp">Please Login</a>
<%} else { %>



<!-- Head of the project  -->
<head>
	   <!-- head of program  -->
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1">
       
	   <!-- title  -->       
       <title> Customer Dashboard</title>
       
   	   <!-- Icon -->
       <link rel="icon" href="../images/phone_emblem.png">
       <link rel="stylesheet" href="main_index.css">

   	   <!-- Bootstrap CSS -->
   	   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
   	   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   	    
</head>
<body>

<!-- NAV BAR! -->
<div class="bar"> 
	<nav class="navbar navbar-expand-sm bg-blue navbar-dark" style="background-color: #698474;">
	   <!-- Brand -->
	   <a class="navbar-brand" href="#"><img src="..\images\phone_emblem.png" height="40"></a>
    		
		
		<li class="nav-item">
      		<a class="nav-link" href="submit_response.jsp">Help Customers</a>
		</li>  
		
		<li class="nav-item">
      		<a class="nav-link" href="deleteBid.jsp">Delete Bid</a>
		</li> 
		
		<li class="nav-item">
      		<a class="nav-link" href="deleteAuction.jsp">Delete Auction</a>
		</li>   
		
		<li class="nav-item">
      		<a class="nav-link" href="alterCust.jsp">Alter Information</a>
		</li>
		
		<li class="nav-item">
      		<a class="nav-link" href="../login.jsp">Logout</a>
		</li>    	
 

	</nav>	
</div>

<br> 
<br>
<% 
String username = (String)session.getAttribute("user"); 
out.println(" <h1 align='center'> Welcome " + username + "</h1>");%>
<div align='center' >
<div class="alert alert-info" align='center'>
  <strong>Alter, Delete, and Monitor Customer activity and data!</strong>
</div>
</div>
<div align='center'> 

<table> 
<thead>
<tr>


<!-- Submit Questions -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title"> Help Customers with their questions. </h5>
    <h6 class="card-subtitle mb-2 text-muted">Fill Here!</h6>
    <a href="submit_response.jsp" class="card-link">Submit Page</a>
  </div>
</div>


<!-- Delete Bids -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title"> Delete Bids Page </h5>
    <h6 class="card-subtitle mb-2 text-muted">Click Here.</h6>
    <a href="deleteBid.jsp" class="card-link">Remove Bids</a>
  </div>
</div>


<!-- Delete Auction -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title"> Delete Auction Page </h5>
    <h6 class="card-subtitle mb-2 text-muted">Click Here.</h6>
    <a href="deleteAuction.jsp" class="card-link">Remove Auction</a>
  </div>
</div>

<!-- Alter Information -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title"> Alter Information </h5>
    <h6 class="card-subtitle mb-2 text-muted">Click Here.</h6>
    <a href="alterCust.jsp" class="card-link">Change Data</a>
  </div>
</div>

</tr>
</thead>
</table>
</div>

<br> 
<br> 
<h2 align='center'> Help Customers!</h2>
<br> 

<!-- Logs out of page -->
<div align="center"> 
<form action="../login.jsp">
    <input type="submit" value="Log Out"/>
</form>
<br>
<br> 
<br> 
</div>

</body>


<%
    }
%>