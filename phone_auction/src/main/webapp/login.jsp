<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--
Contributors:
Rohan
General LogIn Page for the first users.
--> 

<!-- style of program -->
<style>
html{
height: 100%;
}
body{
font-family: Helvetica;
height: 100%;
}
.aligncenter {
    text-align: center;
    border-collapse: collapse;
}
.meme{
	margin-left: auto;
	margin-right: auto;
}
.main{
  font-family: Helvetica;
  margin-left: auto;
  margin-right: auto;
  font-size: 150%;
  color: #000000;
  align: center;
}
.testbruh {
  position: relative;
}
/* Bottom right text */
.text-block {
  position: absolute;
  bottom: 20px;
  right: 20px;
  background-color: black;
  color: white;
  padding-left: 20px;
  padding-right: 20px;
}
.bar{
  font-family: Helvetica;
}
</style>


<!-- head of program  -->
<head>
       
	   <!-- head of program  -->
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1">
       
	   <!-- title  -->       
       <title> Phone Auction | Group 18</title>
       
   	   <!-- Icon -->
       <link rel="icon" href="images/phone_emblem.png">

   	   <!-- Bootstrap CSS -->
   	   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
   	   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   	   
 
      <!--   <img src="images\temp1.jpg" alt="programming" style="width:400px;height=400px;"> --> 

</head>
   

<body>
   
<!-- NAV BAR! -->
<div class="bar"> 
	<nav class="navbar navbar-expand-sm bg-blue navbar-dark" style="background-color: #698474;">
	   <!-- Brand -->
	   <a class="navbar-brand" href="#"><img src="images\phone_emblem.png" height="40"></a>

   	<!-- Links for the JSP FILES-->
  	<ul class="navbar-nav">
    	<li class="nav-item">
           <a class="nav-link" href="Customer_Login_partone.jsp">Log in as a customer</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link" href="Admin/Admin_login.jsp">Log in as an Admin</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link" href="customerRep/repLogin.jsp">Log in as a Customer Rep</a>
		</li>    	
    <!-- Dropdown 
        <li class="nav-item dropdown">
         <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
         Dropdown link
        </a>
       <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Link 1</a>
        <a class="dropdown-item" href="#">Link 2</a>
        <a class="dropdown-item" href="#">Link 3</a>
      </div>
    </li>
    --> 
  </ul>

</nav>	
</div>
   <!-- RailWay System title on top -->
  <div class="container"> 
   <div class="page-header" align="center">
   	<h1 align="center"><img src="images/phone.ico" > Phone Auction!</h1>
   	<h2> Simply, the best way to explore your options.</h2>
   </div>
   </div>
   
   <!-- spaces  --> 
   <br> <br>
	
	<!-- Message above gifs -->
	<div align="center">
		<h3> Sell and Buy Phones at a fair Auction Price!</h3>
	</div>
	


<!-- Making table for the log in buttons -->


<br>
<br>

<div align='center'> 

<table> 
<thead>
<tr> 

<!-- Customer Log In -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">Customers</h5>
    <h6 class="card-subtitle mb-2 text-muted">Log In or Register!</h6>
    
    <!-- Log In Link  -->
    <a href="Customer_Login_partone.jsp" class="card-link">For Customers!</a>
  </div>
</div>
</th>


<!-- Admin Log In -->
<th>
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">Admins </h5>
    <h6 class="card-subtitle mb-2 text-muted">Log in as an Admin.</h6>
    <p class="card-text">Log in as an admin for administrator stuff.</p>
    <a href="Admin/Admin_login.jsp" class="card-link">Admins Only!</a>
  </div>
</div>
</th> 

<!-- Customer Representative -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">Customer Representative </h5>
    <h6 class="card-subtitle mb-2 text-muted">Log in as a Customer Rep.</h6>
    <p class="card-text">Log in as a customer representative.</p>
    <a href="customerRep/repLogin.jsp" class="card-link">Customer Rep. Link!</a>
  </div>
</div>
</th>
</tr>
</thead>
</table>
</div>
	
	
<!-- Image table  | Manhattan, California, Downtown NY-->
<div align='center'> 
	<table class="meme" >
		<thead>
			<tr class="main"> 
				<div align="center"> 
					<th scope="col" style="vertical-align:bottom"><button type="button" class="btn btn-success" align="center"><span class="label label-success">iPhone</span></button>
					</th>	
				</div>
				<div> 
					<th scope="col"><button type="button" class="btn btn-success"><span class="label label-success">Samsung</span></button>
					</th>	
				</div>
				
				<div> 
					<th scope="col"><button type="button" class="btn btn-success"><span class="label label-success">Google Pixel</span></button>
					</th>	
				</div>
				
			</tr>
		</thead>
		
		<tbody>
		<tr>
			<td align="left"><img class="img-responsive" src="images/apple-iphone.gif"></td>
		<br>
			<td align="center"><img class="img-responsive" src="images/samsung-android.gif" height="284"></td>
		<br> 
			<td align="right"><img class="img-responsive" src="images/pixel6.gif"> </td>
		</tr> 
		</tbody>	
	</table>
</div>
   
   <!-- Returning Customer -->

<br> 
<br>  
<br> 



<!-- Extra Spacing -->
<br> 
<br>
<br> 

</body>
</html>