<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- Styling -->


<!-- head  -->
<head>

	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Links.. -->
	<link rel="icon" href="images/main_ticket.svg">
	<link rel="stylesheet" href="style_customer_register_REAL.css">
	<!-- Website Title -->
	<title>Customer Representative Registration </title>
</head>

<!-- Body -->
<body> 

	<!-- Log In  -->
<div class="wrapper fadeInDown">

  	<div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
    	<h2> Customer Representative Registration </h2>
    </div>
	
	<!--  Where you register  -->
    <!-- Login Form Fields -->
    <form action="adLoginDetails.jsp" method="POST" align="center">
    
      <input type="text" id="login" class="fadeIn second" name="username" placeholder="username" autocomplete="off">
      <input type="text" id="login" class="fadeIn second" name="password" placeholder="password" autocomplete="off">
      <br> 

      <input type="submit" class="fadeIn fourth" value="Register Here">

    </form>
    
    <br> 

  

  </div>

</div>

<br>
<br>
<form method="post" action="indexAd.jsp"> 
<input type="submit" value="Back to Homepage">
</form>
</body>
</html>