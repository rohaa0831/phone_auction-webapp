<!-- alter other buyers a higher bid has been placed -->
<!-- alter other buyers when bid has been placed above their upper limit -->
<!-- alert if user has won any auctions -->
<!-- set alert about item -->
<!-- alert about specific items user is interested in -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.time.*, java.time.format.*"%>
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

<%
try{
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();

	//String username = (String)session.getAttribute("user");
	String modelNum = request.getParameter("modelNum");
	String sellerID = request.getParameter("sellerID");
	
	long millis = System.currentTimeMillis();
	java.sql.Date today = new java.sql.Date(millis);
	
	LocalDate current = today.toLocalDate();
	LocalDate newDate = current.minusMonths(1);
	java.sql.Date today2 = java.sql.Date.valueOf(newDate);
	
	String query = "SELECT * FROM auction WHERE sellerID = ? and modelNum = ?";
	PreparedStatement pstmt = con.prepareStatement(query);
	
	pstmt.setString(1, sellerID);
	pstmt.setString(2, modelNum);
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
		
		String model = rs.getString(5);
		String query2 = "select * from auction where model = ? and startDate > ? and enddate > ?";
		PreparedStatement pstmt2 = con.prepareStatement(query2);
		pstmt2.setString(1, model);
		pstmt2.setDate(2, today2);
		pstmt2.setDate(3, today);
	
		ResultSet rs2 = pstmt2.executeQuery();
		
		out.print("<table>");
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Seller ID&nbsp&nbsp&nbsp&nbsp&nbsp");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Model Num &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
		out.print("</td>");
		
		out.print("<td>");
		out.print("BuyerID &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Color &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Model &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Brand &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
		out.print("</td>");
		out.print("<td>");
		out.print("Start Date &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
		out.print("</td>");
			
		out.print("<td>");
		out.print("End Date &nbsp&nbsp");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Current Price &nbsp&nbsp");
		out.print("</td>");
		out.print("</tr>");
		
			//parse out the results
			while (rs2.next()) {
				
				sellerID = rs2.getString(1);
				String modelNum2 = rs2.getString(2);
				String buyerID = rs2.getString(3) ;   
				String color = rs2.getString(4) ;
				String model2 = rs2.getString(5)  ;
				String brand = rs2.getString(6) ;
				java.sql.Date startDate = rs2.getDate(7);
				java.sql.Date endDate = rs2.getDate(8);
				Float currentPrice = rs2.getFloat(9);   
				
			 	if(!modelNum.equals(modelNum2)){
					out.print("<tr>");
					//make a column
					out.print("<td>");
					//Print out current bar name:
					out.print(sellerID + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					//Print out current beer name:
					out.print(modelNum2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(buyerID + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					
					out.print(color + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					
					//Print out current price
					out.print(model2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(brand + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(startDate + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(endDate + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(currentPrice + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("</tr>");
					
					/*
					out.print(rs.getString(8));
					out.print("</td>");
					out.print("<td>");
					out.print(rs.getString(9));
					out.print("</td>");
					out.print("</tr>");*/
					
			 	}
			
			 }
		out.print("</table>");
	}
}
catch (Exception ex) {
	out.print(ex);
	out.print("/n create auction failed :()");
}

%>
<br>
<%  
out.println(" <h3 align='center'> Similar Items! </h3>");
out.println(" <h4 align='center'> You can place your bid below </h4>");
%>
<br>
<div align = "center">
<form method="get" action="createbid.jsp">
		<table>
			<tr>
				<td><h4>Your Username</h4></td><td><input type="text" name="username"></td>
			</tr>
			<tr>    
				<td><h4>Bid Increment:</h4></td><td><input type="text" name="bidIncrement"></td>
			</tr>
			<tr>
				<td><h4>Current Price (Right Now):</h4></td><td><input type="text" name="currentPrice"></td>
			</tr>
			<tr>
				<td><h4>Bid Price:</h4></td><td><input type="text" name="bidPrice"></td>
			</tr>
			<tr>
				<td><h4>Auto:</h4></td><td><input type="text" name="auto"></td>
			</tr>
			<tr>
				<td><h4>Upper Limit:</h4></td><td><input type = "text" name="upperLimit"></td>
			</tr>
			
		</table>
		<div class="alert alert-success" role="alert" align='center'> 
			<input type="submit" value="Place Bid">
		</div>
	</form>
</div>
<br>
<br>

<h4 align='center'> How to place a Bid. </h4>
<div align='center'> 

<ul class="list-group">
  <li class="list-group-item">1. Input Your Username and bid Price if you would like to do a manual bid. </li>
  <li class="list-group-item">2. If you would like to input an auto bid we need you to input your bid increment, upper limit, and mark auto True.</li>
  <li class="list-group-item">3. We also ask you write down the current price you see on your screen for our records.</li>
  <li class="list-group-item"><strong> 4. IF YOU ARE PLACING A MANUAL BID WE ASK YOU LEAVE AUTO, UPPER LIMIT AND BID INCREMENT BLANK </strong></li>
</ul>

</div>
</body>
</html>