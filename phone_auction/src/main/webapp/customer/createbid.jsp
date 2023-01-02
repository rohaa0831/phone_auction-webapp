<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.time.*, java.time.format.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create bid</title>
</head>
<body>
<% 
try{
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();

	Statement stmt = con.createStatement();
	String query = "INSERT INTO bids VALUES (?,?,?,?,?,?,?,?, ?)";
	PreparedStatement pstmt = con.prepareStatement(query);

	String username = request.getParameter("username");
	pstmt.setString(1, username);
	
	String sellerID = session.getAttribute("sellerID").toString();
	pstmt.setString(2, sellerID);
	
	String modelNum = session.getAttribute("modelNum").toString();
	pstmt.setString(3, modelNum);
	
	String bidIncrement = request.getParameter("bidIncrement");
	
	if(bidIncrement != ""){
		Float bidIncre = Float.parseFloat(bidIncrement);
		pstmt.setFloat(4, bidIncre);
	}
	else{
		pstmt.setNull(4, Types.NULL);
	}

	
	String currentPrice = request.getParameter("currentPrice");
	Float currentPric = Float.parseFloat(currentPrice);
	pstmt.setFloat(5, currentPric);
	
	
	String bidPrice = request.getParameter("bidPrice");
	Float bidPric = Float.parseFloat(bidPrice);
	pstmt.setFloat(6, bidPric);
	
	if(bidPric <= currentPric){
		response.sendRedirect("invalidBid.jsp");
		}
	
	else{
		String auto = request.getParameter("auto");
	
	
		if(auto != ""){
			boolean aut = Boolean.parseBoolean(auto);
			pstmt.setBoolean(7, aut);
		}
		else{
			pstmt.setBoolean(7, false);
		}
	
		String upperLimit = request.getParameter("upperLimit");
	
		if(upperLimit != ""){
			Float upperLimi = Float.parseFloat(upperLimit);
			pstmt.setFloat(8, upperLimi);
		}
		else{
			pstmt.setNull(8, Types.NULL);
		}
	
		long millis = System.currentTimeMillis();
		java.sql.Date datePosted = new java.sql.Date(millis);
		pstmt.setDate(9, datePosted);
		pstmt.execute();

		//UPDATE AUCTION PRICE AND buyerID
		String query2 = "UPDATE auction SET currentPrice = ?, buyerID = ? WHERE sellerID = ? and modelNum = ?";
		PreparedStatement pstmt2 = con.prepareStatement(query2);
		pstmt2.setFloat(1, bidPric);
		pstmt2.setString(2, username);
		pstmt2.setString(3, sellerID);
		pstmt2.setString(4, modelNum);
		pstmt2.execute();
	
		// CHECK IF THERE IS AN AUTOBID 
		String query3 = "SELECT * FROM bids WHERE sellerID = ? and modelNum = ? and auto = ? and upperLimit > ?";
		PreparedStatement pstmt3 = con.prepareStatement(query3);
		pstmt3.setString(1, sellerID);
		pstmt3.setString(2, modelNum);
		pstmt3.setBoolean(3, true);
		pstmt3.setFloat(4, bidPric);
		ResultSet rs;
		rs = pstmt3.executeQuery();
	
		boolean flag = true;
		while (rs.next()) {
			String username1 = rs.getString(1);
			Float bidIncrement2 = rs.getFloat(4);
			Float upperLimit2 = rs.getFloat(8);
		
			if(upperLimit2 > bidPric){
	
			PreparedStatement pstmt4 = con.prepareStatement(query);
		
			pstmt4.setString(1, username1);
			pstmt4.setString(2, sellerID);
			pstmt4.setString(3, modelNum);
			pstmt4.setFloat(4, bidIncrement2);
			pstmt4.setFloat(5, bidPric); // have to increment this for next loop
			pstmt4.setFloat(6, bidPric + bidIncrement2);
			pstmt4.setBoolean(7, true);
			pstmt4.setFloat(8, upperLimit2);
			pstmt4.setDate(9, datePosted);
			pstmt4.execute();
		
			pstmt2.setFloat(1, bidPric);
			pstmt2.setString(2, rs.getString(1));
			pstmt2.setString(3, sellerID);
			pstmt2.setString(4, modelNum);
			pstmt2.execute();
		
			bidPric = bidPric + bidIncrement2;
			}
	
		}
	}
	
}

catch (Exception ex) {
	out.print(ex);
	out.print("/n create auction failed :()");
}

out.print(" <h1 align='center'> Bid Posted!</h1>");
%>

<form method="post" action="index.jsp"> 
<input type="submit" value="Back to Homepage">
</form>
</body>
</html>