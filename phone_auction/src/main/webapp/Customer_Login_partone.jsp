<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- Styling -->


<!-- head  -->
<head>

	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Links.. -->
	<link rel="icon" href="images/main_ticket.svg">
	<link rel="stylesheet" href="style_customer_login.css">
	<!-- Website Title -->
	<title>Customer Log In</title>
</head>

<!-- Body -->
<body> 

	<!-- Log In  -->
<div class="wrapper fadeInDown">

  	<div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
    	<h2> Customer Log In </h2>
    </div>

    <!-- Login Form Fields -->
    <form action="checkLoginDetails_Customer_login.jsp" method="POST" align="center">
    
      <input type="text" id="login" class="fadeIn second" name="username" placeholder="username" autocomplete="off">
      <input type="text" id="password" class="fadeIn third" name="password" placeholder="password" autocomplete="off">
      <br> 
      <input type="submit" class="fadeIn fourth" value="Log In">

    </form>
   
    <br> 
	
	  <form action="Customer_Register_part_two.jsp" method="POST" align="center">
    
   
      <input type="submit" class="fadeIn fourth" value="Register">

    </form>
  

  </div>

</div>



</body>
</html>