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
	String username = (String)session.getAttribute("user");
	String query = "INSERT INTO wants VALUES (?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(query);
	
	pstmt.setString(1, username);
	pstmt.setString(2, color);
	pstmt.setString(3, model);
	pstmt.setString(4, brand);
	ResultSet rs;
	pstmt.execute();
}

catch (Exception ex) {
	out.print(ex);
	out.print("/n create alert failed :()");
}

out.print(" <h4 align='center'> Alert Created. Now Available in Alerts Page!</h4>");
%>

<form method="post" action="index.jsp"> 
<input type="submit" value="Back to Homepage">
</form>