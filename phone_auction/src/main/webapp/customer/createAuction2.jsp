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
<% 
try{
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();

	Statement stmt = con.createStatement();
	String query = "INSERT INTO auction VALUES (?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(query);


	String sellerID = request.getParameter("sellerID");
	String modelNum = request.getParameter("modelNum");
	String buyerID = null;
	String color = request.getParameter("color");
	String model = request.getParameter("model");
	String brand = request.getParameter("brand"); 

	String pp = request.getParameter("currentPrice");
	String zz = request.getParameter("minPrice");


	long millis = System.currentTimeMillis();
	java.sql.Date startDate = new java.sql.Date(millis);

	String str = request.getParameter("endDate");
	java.sql.Date endDate = java.sql.Date.valueOf(str);


	pstmt.setString(1, sellerID);
	pstmt.setString(2, modelNum);
	pstmt.setNull(3, Types.NULL);

	pstmt.setString(4, color);
	pstmt.setString(5, model);
	pstmt.setString(6, brand);

	if(pp != ""){
		Float currentPrice = Float.parseFloat(pp);
		pstmt.setFloat(9, currentPrice);
	}
	else{
		pstmt.setNull(9, Types.NULL);
	}

	if(zz != ""){
		Float minPrice = Float.parseFloat(zz);
		pstmt.setFloat(10, minPrice);
	}
	else{
		pstmt.setNull(10, Types.NULL);
	}
	pstmt.setDate(7, startDate);
	pstmt.setDate(8, endDate);
	//Setting null value to a column

	pstmt.execute();
}

catch (Exception ex) {
	out.print(ex);
	out.print("/n create auction failed :()");
}

out.print(" <h1 align='center'> Auction Posted!</h1>");
%>

<form method="post" action="index.jsp"> 
<input type="submit" value="Back to Homepage">
</form>
</body>
</html>