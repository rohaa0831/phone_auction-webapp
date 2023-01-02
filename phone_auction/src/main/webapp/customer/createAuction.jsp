<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.time.*, java.time.format.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}
.topnav {
  overflow: hidden;
  background-color: #698474;
}
.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}
.topnav a:hover {
  background-color: #ddd;
  color: black;
}
.topnav a.active {
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>

<div class="topnav">
  <a href='index.jsp'>Home</a>
  <a class="active" href='makebid.jsp'>Make Bid</a>
  <a href='alerts.jsp'>Alerts</a>
  <a href='logout_customer.jsp'>Logout</a>
</div>

<head>
  <title>Customer Make Auction</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="main_index.css">
  <link rel="icon" href="images/phone_emblem.png">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>


<h2 align='center'> Create an Auction</h2>
<div align='center'>
<br>
	<form method="get" action="createAuction2.jsp">
		<table>
			<tr>
				<td><h4>Username</h4></td><td><input type="text" name="sellerID"></td>
			</tr>
			<tr>
				<td><h4>modelNum</h4></td><td><input type="text" name="modelNum"></td>
			</tr>
			<tr>    
				<td><h4>color:</h4></td><td><input type="text" name="color"></td>
			</tr>
			<tr>
				<td><h4>model:</h4></td><td><input type="text" name="model"></td>
			</tr>
			<tr>
				<td><h4>brand:</h4></td><td><input type="text" name="brand"></td>
			</tr>
			<tr>
				<td><h4>Reserve Price:</h4></td><td><input type="text" name="minPrice"></td>
			</tr>
			<tr>
				<td><h4>Start Price:</h4></td><td><input type="text" name="currentPrice"></td>
			</tr>
			
			<tr>
				<td><h4>End date:</h4></td><td><input type="date" name="endDate"></td>
				<td>Date format: yyyy-mm-dd</td><td>
			</tr>
			
		</table>
		<div class="alert alert-success" role="alert" align='center'> 
			<input type="submit" value="Create Auction">
		</div>
	</form>
<br>
</div>

<h4 align='center'> How to create an Auction. </h4>
<div align='center'> 

<ul class="list-group">
  <li class="list-group-item">1. Input color, model, brand, and the end date of the auction. </strong> </li>
  <li class="list-group-item">2. Set the Initial price.</li>
  <li class="list-group-item">3. Set the Reserve Price. If the bidding does not exceed the reserve price we will not sell the item. </strong></li>
  <li class="list-group-item">3. Set the Start Price. Price Bidding will start at. </strong></li>
  
</ul>

</div>

</body>
</html>