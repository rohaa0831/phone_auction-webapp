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
  background-color: #333;
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

form {
  margin: 0 auto; 
  width:500px;
}
</style>
</head>
<body>

<div class="topnav">
  <a href='index.jsp'>Home</a>
  <a class="active" href='makebid.jsp'>Make Bids</a>
  <a href='mybids.jsp'>My Bids</a>
  <a href='logout_customer.jsp'>Logout</a>
</div>

<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

	
 <%
try{
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();

	String sellerID = request.getParameter("sellerID");
	String modelNum = request.getParameter("modelNum");
	session.setAttribute("sellerID", sellerID);  
	session.setAttribute("modelNum", modelNum);
	Statement stmt = con.createStatement();
	
	if(modelNum.equals("")){
		
		String query2 = "Select Distinct modelNum from bids where username = ? or sellerID = ?";
		PreparedStatement pstmt2 = con.prepareStatement(query2);

		pstmt2.setString(1, sellerID);
		pstmt2.setString(2, sellerID);
		ResultSet rs2;
		rs2 = pstmt2.executeQuery();
		
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
		
		
		while(rs2.next()){
		String modelNum2 = rs2.getString(1);
		String query3 = "SELECT * FROM auction WHERE modelNum = ?";
		PreparedStatement pstmt3 = con.prepareStatement(query3);

		pstmt3.setString(1, modelNum2);
		ResultSet rs3;
		rs3 = pstmt3.executeQuery();
		
		while(rs3.next()){
		
		sellerID = rs3.getString(1);
		String modelNum3 = rs3.getString(2);
		String buyerID = rs3.getString(3) ;   
		String color = rs3.getString(4) ;
		String model = rs3.getString(5)  ;
		String brand = rs3.getString(6) ;
		java.sql.Date startDate = rs3.getDate(7);
		java.sql.Date endDate = rs3.getDate(8);
		Float currentPrice = rs3.getFloat(9);   
		 
		
		
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//Print out current bar name:
		out.print(sellerID + "&nbsp&nbsp&nbsp");
		out.print("</td>");
		out.print("<td>");
		//Print out current beer name:
		out.print(modelNum3 + "&nbsp&nbsp&nbsp");
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
		out.print("</table>");
	}
	else{
	
		String query = "SELECT * FROM bids WHERE sellerID = ? and modelNum = ? ORDER BY DatePosted DESC";
		PreparedStatement pstmt = con.prepareStatement(query);

		pstmt.setString(1, sellerID);
		pstmt.setString(2, modelNum);
		ResultSet rs;
		rs = pstmt.executeQuery();
	
		out.print("<table>");
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Buyer ID&nbsp&nbsp&nbsp&nbsp&nbsp");
		out.print("</td>");
	
		out.print("<td>");
		out.print("Seller ID &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("Model Num &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
		out.print("</td>");
	
		out.print("<td>");
		out.print("Bid Increment &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
		out.print("</td>");
	
		out.print("<td>");
		out.print("Current Price &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
		out.print("</td>");
	
		//make a column
		out.print("<td>");
		out.print("Bid Price &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
		out.print("</td>");
	
		out.print("<td>");
		out.print("auto &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
		out.print("</td>");
		out.print("<td>");
		out.print("Date Posted &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Upper Limit &nbsp&nbsp");
		out.print("</td>");
	
		//out.print("<td>");
		//out.print("Date Posted &nbsp&nbsp");
		//out.print("</td>");
		//out.print("</tr>");
		//parse out the results
			while (rs.next()) {
			
				sellerID = rs.getString(1);
   				modelNum = rs.getString(2);
   				String buyerID = rs.getString(3) ;   
   				Float color = rs.getFloat(4) ;
   				Float model = rs.getFloat(5)  ;
   				Float brand = rs.getFloat(6) ;
   				Boolean startDate = rs.getBoolean(7);
   				java.sql.Date endDate = rs.getDate(9);
   				Float currentPrice = rs.getFloat(8);   
  			 
   			
   			
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(sellerID + "&nbsp&nbsp&nbsp");
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(modelNum + "&nbsp&nbsp&nbsp");
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
			
				/*
				out.print(rs.getString(8));
				out.print("</td>");
				out.print("<td>");
					out.print(rs.getString(9));
				out.print("</td>");
				out.print("</tr>");*/
			
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
<br>
<%  
out.println(" <h3 align='center'> Here is the bidding history of this Item. </h3>");
%>
<br>
<div align = 'center'>
	<form method="post" action="index.jsp"> 
		<input type="submit" value="Back to Homepage">
	</form>
</div>
</body>
</html>