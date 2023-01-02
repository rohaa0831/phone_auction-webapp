<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.time.*, java.time.format.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Auction</title>
</head>
<body>

<h3 align='left'> Search Results</h3>
<br>

<%
try{
	
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();

	Statement stmt = con.createStatement();
	
	String color = (String)request.getParameter("color");
	String model = (String)request.getParameter("model");
	String brand = (String)request.getParameter("brand");
	String sort = (String)request.getParameter("sort");
	
	if(sort.equals("none")){
		
		if(color.equals("") && (model.equals("")) && (brand.equals(""))){
			
			String query = "SELECT * FROM auction";
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet rs;
			rs = pstmt.executeQuery();
			
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
				while (rs.next()) {
					
					String sellerID = rs.getString(1);
		   			String modelNum = rs.getString(2);
		   			String buyerID = rs.getString(3) ;   
		   			String color2 = rs.getString(4) ;
		   			String model2 = rs.getString(5)  ;
		   			String brand2 = rs.getString(6) ;
		   			java.sql.Date startDate = rs.getDate(7);
		   			java.sql.Date endDate = rs.getDate(8);
		   			Float currentPrice = rs.getFloat(9);   
		  			 
		   			
		   			
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
					
					out.print(color2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					
					//Print out current price
					out.print(model2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(brand2 + "&nbsp&nbsp&nbsp");
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
		else if( (!color.equals("")) && (model.equals("")) && (brand.equals(""))){
			
			String query = "SELECT * FROM auction WHERE color = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, color);
			ResultSet rs;
			rs = pstmt.executeQuery();
			
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
				while (rs.next()) {
					
					String sellerID = rs.getString(1);
		   			String modelNum = rs.getString(2);
		   			String buyerID = rs.getString(3) ;   
		   			String color2 = rs.getString(4) ;
		   			String model2 = rs.getString(5)  ;
		   			String brand2 = rs.getString(6) ;
		   			java.sql.Date startDate = rs.getDate(7);
		   			java.sql.Date endDate = rs.getDate(8);
		   			Float currentPrice = rs.getFloat(9);   
		  			 
		   			
		   			
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
					
					out.print(color2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					
					//Print out current price
					out.print(model2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(brand2 + "&nbsp&nbsp&nbsp");
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
		else if((!color.equals("")) && (!model.equals("")) && (brand.equals("")) ){
			String query = "SELECT * FROM auction WHERE color = ? and model = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, color);
			pstmt.setString(2, model);
			ResultSet rs;
			rs = pstmt.executeQuery();
			
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
				while (rs.next()) {
					
					String sellerID = rs.getString(1);
		   			String modelNum = rs.getString(2);
		   			String buyerID = rs.getString(3) ;   
		   			String color2 = rs.getString(4) ;
		   			String model2 = rs.getString(5)  ;
		   			String brand2 = rs.getString(6) ;
		   			java.sql.Date startDate = rs.getDate(7);
		   			java.sql.Date endDate = rs.getDate(8);
		   			Float currentPrice = rs.getFloat(9);   
		  			 
		   			
		   			
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
					
					out.print(color2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					
					//Print out current price
					out.print(model2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(brand2 + "&nbsp&nbsp&nbsp");
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
		else if((!color.equals("")) && (model.equals("")) && (!brand.equals(""))){
			String query = "SELECT * FROM auction WHERE color = ? and brand = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, color);
			pstmt.setString(2, brand);
			ResultSet rs;
			rs = pstmt.executeQuery();
			
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
				while (rs.next()) {
					
					String sellerID = rs.getString(1);
		   			String modelNum = rs.getString(2);
		   			String buyerID = rs.getString(3) ;   
		   			String color2 = rs.getString(4) ;
		   			String model2 = rs.getString(5)  ;
		   			String brand2 = rs.getString(6) ;
		   			java.sql.Date startDate = rs.getDate(7);
		   			java.sql.Date endDate = rs.getDate(8);
		   			Float currentPrice = rs.getFloat(9);   
		  			 
		   			
		   			
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
					
					out.print(color2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					
					//Print out current price
					out.print(model2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(brand2 + "&nbsp&nbsp&nbsp");
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
		else if((!color.equals("")) && (!model.equals("")) && (!brand.equals("")) ){
			String query = "SELECT * FROM auction WHERE color = ? and brand = ? and model = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, color);
			pstmt.setString(2, brand);
			pstmt.setString(3, model);
			ResultSet rs;
			rs = pstmt.executeQuery();
			
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
				while (rs.next()) {
					
					String sellerID = rs.getString(1);
		   			String modelNum = rs.getString(2);
		   			String buyerID = rs.getString(3) ;   
		   			String color2 = rs.getString(4) ;
		   			String model2 = rs.getString(5)  ;
		   			String brand2 = rs.getString(6) ;
		   			java.sql.Date startDate = rs.getDate(7);
		   			java.sql.Date endDate = rs.getDate(8);
		   			Float currentPrice = rs.getFloat(9);   
		  			 
		   			
		   			
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
					
					out.print(color2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					
					//Print out current price
					out.print(model2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(brand2 + "&nbsp&nbsp&nbsp");
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
		else if((color.equals("")) && (!model.equals("")) && (brand.equals(""))  ){
			String query = "SELECT * FROM auction WHERE model = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, model);
			ResultSet rs;
			rs = pstmt.executeQuery();
			
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
				while (rs.next()) {
					
					String sellerID = rs.getString(1);
		   			String modelNum = rs.getString(2);
		   			String buyerID = rs.getString(3) ;   
		   			String color2 = rs.getString(4) ;
		   			String model2 = rs.getString(5)  ;
		   			String brand2 = rs.getString(6) ;
		   			java.sql.Date startDate = rs.getDate(7);
		   			java.sql.Date endDate = rs.getDate(8);
		   			Float currentPrice = rs.getFloat(9);   
		  			 
		   			
		   			
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
					
					out.print(color2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					
					//Print out current price
					out.print(model2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(brand2 + "&nbsp&nbsp&nbsp");
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
		else if((color.equals("")) && (!model.equals("")) && (!brand.equals("")) ){
			String query = "SELECT * FROM auction WHERE brand = ? and model = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, brand);
			pstmt.setString(2, model);
			ResultSet rs;
			rs = pstmt.executeQuery();
			
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
				while (rs.next()) {
					
					String sellerID = rs.getString(1);
		   			String modelNum = rs.getString(2);
		   			String buyerID = rs.getString(3) ;   
		   			String color2 = rs.getString(4) ;
		   			String model2 = rs.getString(5)  ;
		   			String brand2 = rs.getString(6) ;
		   			java.sql.Date startDate = rs.getDate(7);
		   			java.sql.Date endDate = rs.getDate(8);
		   			Float currentPrice = rs.getFloat(9);   
		  			 
		   			
		   			
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
					
					out.print(color2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					
					//Print out current price
					out.print(model2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(brand2 + "&nbsp&nbsp&nbsp");
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
		else if((color.equals("")) && (model.equals("")) && (!brand.equals("")) ){
			String query = "SELECT * FROM auction WHERE brand = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, brand);
			ResultSet rs;
			rs = pstmt.executeQuery();
			
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
				while (rs.next()) {
					
					String sellerID = rs.getString(1);
		   			String modelNum = rs.getString(2);
		   			String buyerID = rs.getString(3) ;   
		   			String color2 = rs.getString(4) ;
		   			String model2 = rs.getString(5)  ;
		   			String brand2 = rs.getString(6) ;
		   			java.sql.Date startDate = rs.getDate(7);
		   			java.sql.Date endDate = rs.getDate(8);
		   			Float currentPrice = rs.getFloat(9);   
		  			 
		   			
		   			
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
					
					out.print(color2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					
					//Print out current price
					out.print(model2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(brand2 + "&nbsp&nbsp&nbsp");
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
	else{
		
		if((color.equals("")) && (model.equals("")) && (brand.equals(""))){ //sort begins
			String query = "SELECT * FROM auction ORDER BY " + sort + " DESC";
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet rs;
			rs = pstmt.executeQuery();
			
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
				while (rs.next()) {
					
					String sellerID = rs.getString(1);
		   			String modelNum = rs.getString(2);
		   			String buyerID = rs.getString(3) ;   
		   			String color2 = rs.getString(4) ;
		   			String model2 = rs.getString(5)  ;
		   			String brand2 = rs.getString(6) ;
		   			java.sql.Date startDate = rs.getDate(7);
		   			java.sql.Date endDate = rs.getDate(8);
		   			Float currentPrice = rs.getFloat(9);   
		  			 
		   			
		   			
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
					
					out.print(color2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					
					//Print out current price
					out.print(model2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(brand2 + "&nbsp&nbsp&nbsp");
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
		else if((!color.equals("")) && (model.equals("")) && (brand.equals(""))){
			
			String query = "SELECT * FROM auction WHERE color = ? ORDER BY " + sort + " DESC;";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, color);
			ResultSet rs;
			rs = pstmt.executeQuery();
			
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
				while (rs.next()) {
					
					String sellerID = rs.getString(1);
		   			String modelNum = rs.getString(2);
		   			String buyerID = rs.getString(3) ;   
		   			String color2 = rs.getString(4) ;
		   			String model2 = rs.getString(5)  ;
		   			String brand2 = rs.getString(6) ;
		   			java.sql.Date startDate = rs.getDate(7);
		   			java.sql.Date endDate = rs.getDate(8);
		   			Float currentPrice = rs.getFloat(9);   
		  			 
		   			
		   			
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
					
					out.print(color2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					
					//Print out current price
					out.print(model2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(brand2 + "&nbsp&nbsp&nbsp");
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
		else if((!color.equals("")) && (!model.equals("")) && (brand.equals(""))){
			String query = "SELECT * FROM auction WHERE color = ? and model = ? ORDER BY " + sort + " DESC;";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, color);
			pstmt.setString(2, model);

			ResultSet rs;
			rs = pstmt.executeQuery();
			
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
				while (rs.next()) {
					
					String sellerID = rs.getString(1);
		   			String modelNum = rs.getString(2);
		   			String buyerID = rs.getString(3) ;   
		   			String color2 = rs.getString(4) ;
		   			String model2 = rs.getString(5)  ;
		   			String brand2 = rs.getString(6) ;
		   			java.sql.Date startDate = rs.getDate(7);
		   			java.sql.Date endDate = rs.getDate(8);
		   			Float currentPrice = rs.getFloat(9);   
		  			 
		   			
		   			
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
					
					out.print(color2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					
					//Print out current price
					out.print(model2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(brand2 + "&nbsp&nbsp&nbsp");
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
		else if((!color.equals("")) && (model.equals("")) && (!brand.equals(""))){
			String query = "SELECT * FROM auction WHERE color = ? and brand = ? ORDER BY " + sort + " DESC;";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, color);
			pstmt.setString(2, brand);
			
			ResultSet rs;
			rs = pstmt.executeQuery();
			
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
				while (rs.next()) {
					
					String sellerID = rs.getString(1);
		   			String modelNum = rs.getString(2);
		   			String buyerID = rs.getString(3) ;   
		   			String color2 = rs.getString(4) ;
		   			String model2 = rs.getString(5)  ;
		   			String brand2 = rs.getString(6) ;
		   			java.sql.Date startDate = rs.getDate(7);
		   			java.sql.Date endDate = rs.getDate(8);
		   			Float currentPrice = rs.getFloat(9);   
		  			 
		   			
		   			
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
					
					out.print(color2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					
					//Print out current price
					out.print(model2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(brand2 + "&nbsp&nbsp&nbsp");
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
		else if((!color.equals("")) && (!model.equals("")) && (!brand.equals(""))){
			String query = "SELECT * FROM auction WHERE color = ? and brand = ? and model = ? ORDER BY " + sort + " DESC";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, color);
			pstmt.setString(2, brand);
			pstmt.setString(3, model);
			
			ResultSet rs;
			rs = pstmt.executeQuery();
			
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
				while (rs.next()) {
					
					String sellerID = rs.getString(1);
		   			String modelNum = rs.getString(2);
		   			String buyerID = rs.getString(3) ;   
		   			String color2 = rs.getString(4) ;
		   			String model2 = rs.getString(5)  ;
		   			String brand2 = rs.getString(6) ;
		   			java.sql.Date startDate = rs.getDate(7);
		   			java.sql.Date endDate = rs.getDate(8);
		   			Float currentPrice = rs.getFloat(9);   
		  			 
		   			
		   			
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
					
					out.print(color2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					
					//Print out current price
					out.print(model2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(brand2 + "&nbsp&nbsp&nbsp");
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
		else if((color.equals("")) && (!model.equals("")) && (brand.equals(""))){
			String query = "SELECT * FROM auction WHERE model = ? ORDER BY " +sort + " DESC;";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, model);
			
			ResultSet rs;
			rs = pstmt.executeQuery();
			
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
				while (rs.next()) {
					
					String sellerID = rs.getString(1);
		   			String modelNum = rs.getString(2);
		   			String buyerID = rs.getString(3) ;   
		   			String color2 = rs.getString(4) ;
		   			String model2 = rs.getString(5)  ;
		   			String brand2 = rs.getString(6) ;
		   			java.sql.Date startDate = rs.getDate(7);
		   			java.sql.Date endDate = rs.getDate(8);
		   			Float currentPrice = rs.getFloat(9);   
		  			 
		   			
		   			
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
					
					out.print(color2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					
					//Print out current price
					out.print(model2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(brand2 + "&nbsp&nbsp&nbsp");
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
		else if((color.equals("")) && (!model.equals("")) && (!brand.equals(""))){
			String query = "SELECT * FROM auction WHERE brand = ? and model = ? ORDER BY " +sort+ " DESC";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, brand);
			pstmt.setString(2, model);
			
			ResultSet rs;
			rs = pstmt.executeQuery();
			
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
				while (rs.next()) {
					
					String sellerID = rs.getString(1);
		   			String modelNum = rs.getString(2);
		   			String buyerID = rs.getString(3) ;   
		   			String color2 = rs.getString(4) ;
		   			String model2 = rs.getString(5)  ;
		   			String brand2 = rs.getString(6) ;
		   			java.sql.Date startDate = rs.getDate(7);
		   			java.sql.Date endDate = rs.getDate(8);
		   			Float currentPrice = rs.getFloat(9);   
		  			 
		   			
		   			
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
					
					out.print(color2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					
					//Print out current price
					out.print(model2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(brand2 + "&nbsp&nbsp&nbsp");
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
		else if((color.equals("")) && (model.equals("")) && (!brand.equals(""))){
			String query = "SELECT * FROM auction WHERE brand = ? ORDER BY " + sort+ " DESC";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, brand);
			
			ResultSet rs;
			rs = pstmt.executeQuery();
			
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
				while (rs.next()) {
					
					String sellerID = rs.getString(1);
		   			String modelNum = rs.getString(2);
		   			String buyerID = rs.getString(3) ;   
		   			String color2 = rs.getString(4) ;
		   			String model2 = rs.getString(5)  ;
		   			String brand2 = rs.getString(6) ;
		   			java.sql.Date startDate = rs.getDate(7);
		   			java.sql.Date endDate = rs.getDate(8);
		   			Float currentPrice = rs.getFloat(9);   
		  			 
		   			
		   			
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
					
					out.print(color2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					
					//Print out current price
					out.print(model2 + "&nbsp&nbsp&nbsp");
					out.print("</td>");
					out.print("<td>");
					out.print(brand2 + "&nbsp&nbsp&nbsp");
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
	
}

catch (Exception ex) {
	out.print(ex);
	out.print("/n create auction failed :()");
}

out.print(" <h4 align='center'> Want to Place Bid or see Bidding History of item?</h4>");
%>
<div align='center'>
	<form method="get"> <!-- action="auctionpage.jsp" -->
		<table>
			<tr>    
				<td><h4>sellerID:</h4></td><td><input type="text" name="sellerID"></td>
				<td><h4>modelNum:</h4></td><td><input type="text" name="modelNum"></td>
			</tr>
		</table>
		<div class="alert alert-success" role="alert" align='center'> 
			<input type="submit" formaction = "auctionpage.jsp" value="Find Item">
		</div>
		<br>
		<div class="alert alert-success" role="alert" align='center'> 
			<input type="submit" formaction = "biddingHistory.jsp" value="View Item's Bidding History">
		</div>
	</form>

	<br>
</div>
<form method="post" action="index.jsp"> 
<input type="submit" value="Back to Homepage">
</form>
</body>
</html>