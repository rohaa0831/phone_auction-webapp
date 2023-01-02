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
	<link rel="stylesheet" href="style_customer_register_REAL.css">
	<!-- Website Title -->
	<title>Customer Log In | Registration </title>
</head>

<!-- Body -->
<body> 

	<!-- Log In  -->
<div class="wrapper fadeInDown">

  	<div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
    	<h2> Customer Registration </h2>
    </div>
	
	<!--  Where you register  -->
    <!-- Login Form Fields -->
    <form action="displayLoginDetails.jsp" method="POST" align="center">
    
      <input type="text" id="login" class="fadeIn second" name="fName" placeholder="First Name" autocomplete="off">
      <input type="text" id="password" class="fadeIn third" name="lName" placeholder="Last Name" autocomplete="off">
      <br> 
      <input type="text" id="login" class="fadeIn second" name="email" placeholder="Email" autocomplete="off">
      <input type="text" id="login" class="fadeIn second" name="username" placeholder="username" autocomplete="off">
      <input type="text" id="login" class="fadeIn second" name="password" placeholder="password" autocomplete="off">

      <input type="submit" class="fadeIn fourth" value="Register Here">

    </form>
    
    <br> 

  

  </div>

</div>



</body>
</html>