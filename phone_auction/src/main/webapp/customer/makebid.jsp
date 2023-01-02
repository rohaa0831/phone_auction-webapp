<!--  insert new bid. , if there is autobids, 

automaitcally place that above the current bid placed. 
out.print(you have been beat by an autobid, this is the price you need to go over to beat the autobid. diplay max price. )-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
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
  <a href='alerts.jsp'>alerts</a>
  <a href='logout_customer.jsp'>Logout</a>
</div>

<head>
  <title>Customer Make Bid</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="main_index.css">
  <link rel="icon" href="images/phone_emblem.png">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>


<h2 align='center'> Start to Place bid</h2>
<div align='center'>
<br>
	<form method="get"> <!-- action="auctionpage.jsp" -->
		<table>
			<tr>    
				<td><h4>sellerID:</h4></td><td><input type="text" name="sellerID"></td>
			</tr>
			<tr>
				<td><h4>modelNum:</h4></td><td><input type="text" name="modelNum"></td>
			</tr>
		</table>
		<div class="alert alert-success" role="alert" align='center'> 
			<input type="submit" formaction = "auctionpage.jsp" value="Find Item">
			<input type="submit" formaction = "similarItems.jsp" value="Search Similar Items">
			<br>
			<input type="submit" formaction = "biddingHistory.jsp" value="View Item/User Bidding/Auction History">
		</div>
	</form>
<br>
</div>
<br>
<br>

<%  
out.println(" <h2 align='center'> We need the sellerId, and modelNum of the Item you want to place a bid on. </h2>");%>




</body>
</html>