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



<!-- Head of thr project  -->
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

   	<!-- Links for the JSP FILES-->
  	<ul class="navbar-nav">
    	<li class="nav-item">
           <a class="nav-link" href="../login.jsp">Home</a>
    	</li>
    	<!-- <li class="nav-item">
      		<a class="nav-link" href="customerfunction.jsp">Search Phone</a>
    	</li> -->
    	<li class="nav-item">
      		<a class="nav-link" href="makebid.jsp">Make Bid</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link" href="makebid.jsp">Bid History</a>
		</li>    		
		
		<li class="nav-item">
      		<a class="nav-link" href="submit_question.jsp"> Ask Question</a>
		</li>  
		
		<li class="nav-item">
      		<a class="nav-link" href="createAuction.jsp">Create Auction</a>
		</li>
		
		<li class="nav-item">
      		<a class="nav-link" href="alerts.jsp">Alerts</a>
		</li>
		
		<li class="nav-item">
      		<a class="nav-link" href="../login.jsp">Logout</a>
		</li>    	
 
 
  </ul>

</nav>	
</div>

<br> 
<br>
<% 
String username = (String)session.getAttribute("user"); 
out.println(" <h1 align='center'> Welcome " + username + "</h1>");%>
<div align='center' >
<div class="alert alert-info" align='center'>
  <strong>Search Phones, make Bids, keep updated on bids!</strong>
</div>
</div>
<div align='center'> 

<table> 
<thead>
<tr>

<!-- Look Up A Phone -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">Search and Flag Phones.</h5>
    <h6 class="card-subtitle mb-2 text-muted">Search Phones and Create alerts</h6>
    <!-- <p class="card-text">Search Phones and place bids</p> -->
    <a href="customerfunction.jsp" class="card-link">Search Phone and Place Bids</a>
  </div>
</div>
</th> 

<!-- Make Bid -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">Make a Bid!</h5>
    <h6 class="card-subtitle mb-2 text-muted">Click Here to make a Bid!</h6>
    <a href="makebid.jsp" class="card-link">Make a Bid!</a>
  </div>
</div>
</th> 


<!-- Check Previous Bids -->
<th>
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title"> Bidding History</h5>
    <h6 class="card-subtitle mb-2 text-muted">Check Item's Bidding History</h6>
    <!-- <p class="card-text">Check your previous Bids!</p> -->
    <a href="makebid.jsp" class="card-link">Bidding History</a>
  </div>
</div>
</th> 

<!--  Alerts-->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title"> Alerts </h5>
    <h6 class="card-subtitle mb-2 text-muted">Check Alerts Here. </h6>
    <a href="alerts.jsp" class="card-link">Alerts Page</a>
  </div>
</div>
</th> 
<!-- Auctions -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title"> Want to Sell a Phone? </h5>
    <h6 class="card-subtitle mb-2 text-muted">Sell Here!!</h6>
    <!-- <p class="card-text">Check on your active Auctions</p> -->
    <a href="createAuction.jsp" class="card-link">Auctions Page</a>
  </div>
</div>
</th>

<!-- Questions 
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title"> Want to ask a question? </h5>
    <h6 class="card-subtitle mb-2 text-muted">Ask Here!</h6>
    <a href="submit_question.jsp" class="card-link">Questions Page</a>
  </div>
</div>
</th>

<!-- FAQ 
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title"> FAQ </h5>
    <h6 class="card-subtitle mb-2 text-muted">Frequently Asked Question Here!</h6>
    <a href="displayQuestion.jsp" class="card-link">FAQ Page</a>
  </div>
</div>
</th> -->

</tr>
</thead>
</table>
</div>

<br>

<div align = center>
<thead>
<table>
<tr>
<!-- Questions -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title"> Want to ask a question? </h5>
    <h6 class="card-subtitle mb-2 text-muted">Ask Here!</h6>
    <a href="submit_question.jsp" class="card-link">Questions Page</a>
  </div>
</div>
</th>

<!-- FAQ -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title"> FAQ </h5>
    <h6 class="card-subtitle mb-2 text-muted">Frequently Asked Question Here!</h6>
    <a href="displayQuestions.jsp" class="card-link">FAQ Page</a>
  </div>
</div>
</th>
</tr>
</thead>
</table>
</div>

<br> 
<h2 align='center'> Buy a Phone Today!</h2>
<br> 
<!-- <div align='center'> 

<ul class="list-group">
  <li class="list-group-item">1.  </strong> </li>
  <li class="list-group-item">2. </li>
  <li class="list-group-item">3. </strong></li>
  <li class="list-group-item">4. </strong></li>
  <li class="list-group-item">5. </li>
  <li class="list-group-item">6. </li>
  <li class="list-group-item"><strong></strong></li>
  

</ul>

</div> -->



<!-- Stats -->

<!-- <div align='center'> 
	<table class="meme" >
		<thead>
			<tr class="main"> 
				<div align="center"> 
					<th scope="col" style="vertical-align:bottom"><button type="button" class="btn btn-success" align="center"><span class="label label-success"></span></button>
					</th>	
				</div>
				<div> 
					<th scope="col"><button type="button" class="btn btn-success"><span class="label label-success"></span> </button>
					</th>	
				</div>
				
			</tr>
		</thead>
		
		<tbody>
		<tr>
			<td align="left"><img class="img-responsive" src="images/" height="280"></td>
		<br>
			<td align="center"><img class="img-responsive" src="images/" height="290"></td>
		<br> 
		
		</tr> 
		</tbody>	
	</table>
</div> -->  


<!-- Logs out of page -->
<div align="center"> 
<form action="logout_customer.jsp">
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