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
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();
String username = (String)session.getAttribute("user");

String query = "select DISTINCT modelNum from bids where username = ? and auto = false";

PreparedStatement pstmt = con.prepareStatement(query);
pstmt.setString(1, username);

ResultSet rs = pstmt.executeQuery();
boolean count = false;
boolean flag = false;
while(rs.next()){
	String modelNum = rs.getString(1);
	String query2 = "select * from auction where modelNum = ?";
	PreparedStatement pstmt2 = con.prepareStatement(query2);
	pstmt2.setString(1, modelNum);
	ResultSet rs2;
	rs2= pstmt2.executeQuery();
	
	rs2.next();
	String currentBuyer = rs2.getString(3);
	if(!currentBuyer.equals(username) && count == false){
		flag = true;
		count = true;
		out.print("<h4 align='left'> Manual Bids where you have been Outbid</h4>");
		
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
		
		String sellerID = rs2.getString(1);
		String modelNum2 = rs2.getString(2);
		String buyerID = rs2.getString(3) ;   
		String color = rs2.getString(4) ;
		String model = rs2.getString(5)  ;
		String brand = rs2.getString(6) ;
		java.sql.Date startDate = rs2.getDate(7);
		java.sql.Date endDate = rs2.getDate(8);
		Float currentPrice = rs2.getFloat(9);   
		 
		
		
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
		out.print(model + "&nbsp&nbsp&nbsp");
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
		continue;
	}
		
	if(!currentBuyer.equals(username) && count == true){
		String sellerID = rs2.getString(1);
		String modelNum2 = rs2.getString(2);
		String buyerID = rs2.getString(3) ;   
		String color = rs2.getString(4) ;
		String model = rs2.getString(5)  ;
		String brand = rs2.getString(6) ;
		java.sql.Date startDate = rs2.getDate(7);
		java.sql.Date endDate = rs2.getDate(8);
		Float currentPrice = rs2.getFloat(9);   
		 
		
		
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
		out.print(model + "&nbsp&nbsp&nbsp");
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
	}
}

if(count == true){
	out.print("</table>");
}

%>
<br>
<%

String query3 = "select DISTINCT modelNum from bids where username = ? and auto = true";

PreparedStatement pstmt3 = con.prepareStatement(query3);
pstmt3.setString(1, username);

ResultSet rs3 = pstmt3.executeQuery();
count = false;

while(rs3.next()){
	String modelNum = rs3.getString(1);
	String query4 = "select * from auction where modelNum = ?";
	PreparedStatement pstmt4 = con.prepareStatement(query4);
	pstmt4.setString(1, modelNum);
	ResultSet rs4;
	rs4= pstmt4.executeQuery();
	
	rs4.next();
	String currentBuyer = rs4.getString(3);
	
	if(!currentBuyer.equals(username) && count == false){
		flag = true;
		count = true;
		out.print("<h4 align='left'> Auto Bids where you have been Outbid</h4>");
		
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
		
		String sellerID = rs4.getString(1);
		String modelNum2 = rs4.getString(2);
		String buyerID = rs4.getString(3) ;   
		String color = rs4.getString(4) ;
		String model = rs4.getString(5)  ;
		String brand = rs4.getString(6) ;
		java.sql.Date startDate = rs4.getDate(7);
		java.sql.Date endDate = rs4.getDate(8);
		Float currentPrice = rs4.getFloat(9);   
		 
		
		
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
		out.print(model + "&nbsp&nbsp&nbsp");
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
		continue;
	}
		
	if(!currentBuyer.equals(username) && count == true){
		String sellerID = rs4.getString(1);
		String modelNum2 = rs4.getString(2);
		String buyerID = rs4.getString(3) ;   
		String color = rs4.getString(4) ;
		String model = rs4.getString(5)  ;
		String brand = rs4.getString(6) ;
		java.sql.Date startDate = rs4.getDate(7);
		java.sql.Date endDate = rs4.getDate(8);
		Float currentPrice = rs4.getFloat(9);   
		 
		
		
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
		out.print(model + "&nbsp&nbsp&nbsp");
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
	}
}

if(count == true){
	out.print("</table>");
}

%>
<br>
<% 

String query5 = "select * from wants where username = ?";

PreparedStatement pstmt5 = con.prepareStatement(query5);
pstmt5.setString(1, username);
count = false;
ResultSet rs5 = pstmt5.executeQuery();
while(rs5.next()){
	if(count == false){
		flag = true;
		count = true;
		out.print("<h4 align='left'> Items You've Flagged</h4>");
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
		
		String color5 = rs5.getString(2);
		String model5 = rs5.getString(3);
		String brand5 = rs5.getString(4);
		
		if(color5.equals("") && model5.equals("") && brand5.equals("") ){ 
			continue;
		}
		if(!color5.equals("") && model5.equals("") && brand5.equals("") ){ 
			String query6 = "select * from auction where color = ?";
			PreparedStatement pstmt6 = con.prepareStatement(query6);
			pstmt6.setString(1, color5);
			ResultSet rs6 = pstmt6.executeQuery();
			
			while(rs6.next()){
				String sellerID = rs6.getString(1);
				String modelNum2 = rs6.getString(2);
				String buyerID = rs6.getString(3) ;   
				String color = rs6.getString(4) ;
				String model = rs6.getString(5)  ;
				String brand = rs6.getString(6) ;
				java.sql.Date startDate = rs6.getDate(7);
				java.sql.Date endDate = rs6.getDate(8);
				Float currentPrice = rs6.getFloat(9);   
				 
				
				
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
				out.print(model + "&nbsp&nbsp&nbsp");
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
			}
		}
		if(color5.equals("") && !model5.equals("") && brand5.equals("") ){ 
			String query6 = "select * from auction where model = ?";
			PreparedStatement pstmt6 = con.prepareStatement(query6);
			pstmt6.setString(1, model5);
			ResultSet rs6 = pstmt6.executeQuery();
			
			while(rs6.next()){
				String sellerID = rs6.getString(1);
				String modelNum2 = rs6.getString(2);
				String buyerID = rs6.getString(3) ;   
				String color = rs6.getString(4) ;
				String model = rs6.getString(5)  ;
				String brand = rs6.getString(6) ;
				java.sql.Date startDate = rs6.getDate(7);
				java.sql.Date endDate = rs6.getDate(8);
				Float currentPrice = rs6.getFloat(9);   
				 
				
				
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
				out.print(model + "&nbsp&nbsp&nbsp");
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
			}
		}
		if(color5.equals("") && model5.equals("") && !brand5.equals("") ){ 
			String query6 = "select * from auction where brand = ?";
			PreparedStatement pstmt6 = con.prepareStatement(query6);
			pstmt6.setString(1, brand5);
			ResultSet rs6 = pstmt6.executeQuery();
			
			while(rs6.next()){
				String sellerID = rs6.getString(1);
				String modelNum2 = rs6.getString(2);
				String buyerID = rs6.getString(3) ;   
				String color = rs6.getString(4) ;
				String model = rs6.getString(5)  ;
				String brand = rs6.getString(6) ;
				java.sql.Date startDate = rs6.getDate(7);
				java.sql.Date endDate = rs6.getDate(8);
				Float currentPrice = rs6.getFloat(9);   
				 
				
				
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
				out.print(model + "&nbsp&nbsp&nbsp");
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
			}
		}
		if(!color5.equals("") && !model5.equals("") && brand5.equals("") ){ 
			String query6 = "select * from auction where color = ? and model = ?";
			PreparedStatement pstmt6 = con.prepareStatement(query6);
			pstmt6.setString(1, color5);
			pstmt6.setString(2, model5);
			ResultSet rs6 = pstmt6.executeQuery();
			
			while(rs6.next()){
				String sellerID = rs6.getString(1);
				String modelNum2 = rs6.getString(2);
				String buyerID = rs6.getString(3) ;   
				String color = rs6.getString(4) ;
				String model = rs6.getString(5)  ;
				String brand = rs6.getString(6) ;
				java.sql.Date startDate = rs6.getDate(7);
				java.sql.Date endDate = rs6.getDate(8);
				Float currentPrice = rs6.getFloat(9);   
				 
				
				
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
				out.print(model + "&nbsp&nbsp&nbsp");
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
			}
		}
		if(!color5.equals("") && model5.equals("") && !brand5.equals("") ){ 
			String query6 = "select * from auction where color = ? and brand = ?";
			PreparedStatement pstmt6 = con.prepareStatement(query6);
			pstmt6.setString(1, color5);
			pstmt6.setString(2, brand5);
			ResultSet rs6 = pstmt6.executeQuery();
			
			while(rs6.next()){
				String sellerID = rs6.getString(1);
				String modelNum2 = rs6.getString(2);
				String buyerID = rs6.getString(3) ;   
				String color = rs6.getString(4) ;
				String model = rs6.getString(5)  ;
				String brand = rs6.getString(6) ;
				java.sql.Date startDate = rs6.getDate(7);
				java.sql.Date endDate = rs6.getDate(8);
				Float currentPrice = rs6.getFloat(9);   
				 
				
				
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
				out.print(model + "&nbsp&nbsp&nbsp");
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
			}
		}
		if(color5.equals("") && !model5.equals("") && !brand5.equals("") ){ 
			String query6 = "select * from auction where model = ? and brand = ?";
			PreparedStatement pstmt6 = con.prepareStatement(query6);
			pstmt6.setString(1, color5);
			pstmt6.setString(2, brand5);
			ResultSet rs6 = pstmt6.executeQuery();
			
			while(rs6.next()){
				String sellerID = rs6.getString(1);
				String modelNum2 = rs6.getString(2);
				String buyerID = rs6.getString(3) ;   
				String color = rs6.getString(4) ;
				String model = rs6.getString(5)  ;
				String brand = rs6.getString(6) ;
				java.sql.Date startDate = rs6.getDate(7);
				java.sql.Date endDate = rs6.getDate(8);
				Float currentPrice = rs6.getFloat(9);   
				 
				
				
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
				out.print(model + "&nbsp&nbsp&nbsp");
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
			}
		}
		if(!color5.equals("") && !model5.equals("") && !brand5.equals("") ){ 
			String query6 = "select * from auction where color = ? and model = ? and brand = ?";
			PreparedStatement pstmt6 = con.prepareStatement(query6);
			pstmt6.setString(1, color5);
			pstmt6.setString(2, model5);
			pstmt6.setString(3, brand5);
			ResultSet rs6 = pstmt6.executeQuery();
			
			while(rs6.next()){
				String sellerID = rs6.getString(1);
				String modelNum2 = rs6.getString(2);
				String buyerID = rs6.getString(3) ;   
				String color = rs6.getString(4) ;
				String model = rs6.getString(5)  ;
				String brand = rs6.getString(6) ;
				java.sql.Date startDate = rs6.getDate(7);
				java.sql.Date endDate = rs6.getDate(8);
				Float currentPrice = rs6.getFloat(9);   
				 
				
				
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
				out.print(model + "&nbsp&nbsp&nbsp");
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
			}
		}
		continue;
	}
	
	if(count == true){
		
		String color5 = rs5.getString(2);
		String model5 = rs5.getString(3);
		String brand5 = rs5.getString(4);
		
		if(color5.equals("") && model5.equals("") && brand5.equals("") ){ 
			continue;
		}
		if(!color5.equals("") && model5.equals("") && brand5.equals("") ){ 
			String query6 = "select * from auction where color = ?";
			PreparedStatement pstmt6 = con.prepareStatement(query6);
			pstmt6.setString(1, color5);
			ResultSet rs6 = pstmt6.executeQuery();
			
			while(rs6.next()){
				String sellerID = rs6.getString(1);
				String modelNum2 = rs6.getString(2);
				String buyerID = rs6.getString(3) ;   
				String color = rs6.getString(4) ;
				String model = rs6.getString(5)  ;
				String brand = rs6.getString(6) ;
				java.sql.Date startDate = rs6.getDate(7);
				java.sql.Date endDate = rs6.getDate(8);
				Float currentPrice = rs6.getFloat(9);   
				 
				
				
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
				out.print(model + "&nbsp&nbsp&nbsp");
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
			}
		}
		if(color5.equals("") && !model5.equals("") && brand5.equals("") ){ 
			String query6 = "select * from auction where model = ?";
			PreparedStatement pstmt6 = con.prepareStatement(query6);
			pstmt6.setString(1, model5);
			ResultSet rs6 = pstmt6.executeQuery();
			
			while(rs6.next()){
				String sellerID = rs6.getString(1);
				String modelNum2 = rs6.getString(2);
				String buyerID = rs6.getString(3) ;   
				String color = rs6.getString(4) ;
				String model = rs6.getString(5)  ;
				String brand = rs6.getString(6) ;
				java.sql.Date startDate = rs6.getDate(7);
				java.sql.Date endDate = rs6.getDate(8);
				Float currentPrice = rs6.getFloat(9);   
				 
				
				
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
				out.print(model + "&nbsp&nbsp&nbsp");
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
			}
		}
		if(color5.equals("") && model5.equals("") && !brand5.equals("") ){ 
			String query6 = "select * from auction where brand = ?";
			PreparedStatement pstmt6 = con.prepareStatement(query6);
			pstmt6.setString(1, brand5);
			ResultSet rs6 = pstmt6.executeQuery();
			
			while(rs6.next()){
				String sellerID = rs6.getString(1);
				String modelNum2 = rs6.getString(2);
				String buyerID = rs6.getString(3) ;   
				String color = rs6.getString(4) ;
				String model = rs6.getString(5)  ;
				String brand = rs6.getString(6) ;
				java.sql.Date startDate = rs6.getDate(7);
				java.sql.Date endDate = rs6.getDate(8);
				Float currentPrice = rs6.getFloat(9);   
				 
				
				
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
				out.print(model + "&nbsp&nbsp&nbsp");
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
			}
		}
		if(!color5.equals("") && !model5.equals("") && brand5.equals("") ){ 
			String query6 = "select * from auction where color = ? and model = ?";
			PreparedStatement pstmt6 = con.prepareStatement(query6);
			pstmt6.setString(1, color5);
			pstmt6.setString(2, model5);
			ResultSet rs6 = pstmt6.executeQuery();
			
			while(rs6.next()){
				String sellerID = rs6.getString(1);
				String modelNum2 = rs6.getString(2);
				String buyerID = rs6.getString(3) ;   
				String color = rs6.getString(4) ;
				String model = rs6.getString(5)  ;
				String brand = rs6.getString(6) ;
				java.sql.Date startDate = rs6.getDate(7);
				java.sql.Date endDate = rs6.getDate(8);
				Float currentPrice = rs6.getFloat(9);   
				 
				
				
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
				out.print(model + "&nbsp&nbsp&nbsp");
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
			}
		}
		if(!color5.equals("") && model5.equals("") && !brand5.equals("") ){ 
			String query6 = "select * from auction where color = ? and brand = ?";
			PreparedStatement pstmt6 = con.prepareStatement(query6);
			pstmt6.setString(1, color5);
			pstmt6.setString(2, brand5);
			ResultSet rs6 = pstmt6.executeQuery();
			
			while(rs6.next()){
				String sellerID = rs6.getString(1);
				String modelNum2 = rs6.getString(2);
				String buyerID = rs6.getString(3) ;   
				String color = rs6.getString(4) ;
				String model = rs6.getString(5)  ;
				String brand = rs6.getString(6) ;
				java.sql.Date startDate = rs6.getDate(7);
				java.sql.Date endDate = rs6.getDate(8);
				Float currentPrice = rs6.getFloat(9);   
				 
				
				
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
				out.print(model + "&nbsp&nbsp&nbsp");
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
			}
		}
		if(color5.equals("") && !model5.equals("") && !brand5.equals("") ){ 
			String query6 = "select * from auction where model = ? and brand = ?";
			PreparedStatement pstmt6 = con.prepareStatement(query6);
			pstmt6.setString(1, color5);
			pstmt6.setString(2, brand5);
			ResultSet rs6 = pstmt6.executeQuery();
			
			while(rs6.next()){
				String sellerID = rs6.getString(1);
				String modelNum2 = rs6.getString(2);
				String buyerID = rs6.getString(3) ;   
				String color = rs6.getString(4) ;
				String model = rs6.getString(5)  ;
				String brand = rs6.getString(6) ;
				java.sql.Date startDate = rs6.getDate(7);
				java.sql.Date endDate = rs6.getDate(8);
				Float currentPrice = rs6.getFloat(9);   
				 
				
				
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
				out.print(model + "&nbsp&nbsp&nbsp");
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
			}
		}
		if(!color5.equals("") && !model5.equals("") && !brand5.equals("") ){ 
			String query6 = "select * from auction where color = ? and model = ? and brand = ?";
			PreparedStatement pstmt6 = con.prepareStatement(query6);
			pstmt6.setString(1, color5);
			pstmt6.setString(2, model5);
			pstmt6.setString(3, brand5);
			ResultSet rs6 = pstmt6.executeQuery();
			
			while(rs6.next()){
				String sellerID = rs6.getString(1);
				String modelNum2 = rs6.getString(2);
				String buyerID = rs6.getString(3) ;   
				String color = rs6.getString(4) ;
				String model = rs6.getString(5)  ;
				String brand = rs6.getString(6) ;
				java.sql.Date startDate = rs6.getDate(7);
				java.sql.Date endDate = rs6.getDate(8);
				Float currentPrice = rs6.getFloat(9);   
				 
				
				
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
				out.print(model + "&nbsp&nbsp&nbsp");
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
			}
		}
	}
}

if(count == true){
	out.print("</table>");
}

%>
<br>
<% 

long millis = System.currentTimeMillis();
java.sql.Date today = new java.sql.Date(millis);

String query8 = "Select * from auction where buyerID = ? and endDate < ?";
PreparedStatement pstmt8 = con.prepareStatement(query8);
pstmt8.setString(1, username);
pstmt8.setDate(2, today);

ResultSet rs8 = pstmt8.executeQuery();
count = false;

while(rs8.next()){
	if(count == false){
		flag = true;
		count = true;
		out.print("<h4 align='left'> Auctions You've won</h4>");

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
		
		String sellerID = rs8.getString(1);
		String modelNum2 = rs8.getString(2);
		String buyerID = rs8.getString(3) ;   
		String color = rs8.getString(4) ;
		String model = rs8.getString(5)  ;
		String brand = rs8.getString(6) ;
		java.sql.Date startDate = rs8.getDate(7);
		java.sql.Date endDate = rs8.getDate(8);
		Float currentPrice = rs8.getFloat(9);   
		 
		
		
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
		out.print(model + "&nbsp&nbsp&nbsp");
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
		
		continue;
		
	}
	
	else{
		String sellerID = rs8.getString(1);
		String modelNum2 = rs8.getString(2);
		String buyerID = rs8.getString(3) ;   
		String color = rs8.getString(4) ;
		String model = rs8.getString(5)  ;
		String brand = rs8.getString(6) ;
		java.sql.Date startDate = rs8.getDate(7);
		java.sql.Date endDate = rs8.getDate(8);
		Float currentPrice = rs8.getFloat(9);   
		 
		
		
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
		out.print(model + "&nbsp&nbsp&nbsp");
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
	}
}

if(count == true){
	out.print("</table>");
}

if(flag == false){
	
	out.print("<h4> You have no Alerts </h4>");
}
%>







</body>
</html>