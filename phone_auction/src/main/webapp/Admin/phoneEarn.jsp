<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="com.cs336.pkg.*"%>

<%
// Connect to the database
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();

// Create a statement
	Statement stmt = con.createStatement();

// Get the modelNum from the request
	String modelNum = request.getParameter("modelNum");

// Check if the modelNum is valid or not left blank
	if (modelNum == null || modelNum.trim().equals("")) {
	// Print an error message
		out.println("Invalid or empty modelNum. Please try again.");
	} else {
	// Execute a query to get all closed auctions with the given modelNum
		ResultSet rs = stmt.executeQuery("SELECT * FROM auction WHERE modelNum = '" + modelNum + "' AND endDate <= CURDATE()");
	//Initialize the summation to zero
		double summation = 0;
	//Loop through the closed auctions and add the current price to the summation
		while (rs.next()) {
			summation += rs.getDouble("currentPrice");
		}

	//Check if there are no auctions or no closed auctions with the given modelNum
		if (summation == 0) {
	// Print an error message
			out.println("There are no closed auctions with the given modelNum.");
		} else {
	// Print the summation of the current prices
			out.println("The summation of the current prices for auctions with modelNum '" + modelNum + "' is: " + summation);
		}
	}
%>

<br>
<br>
<form method="post" action="filterEarn.jsp"> 
<input type="submit" value="Back">
</form>
</body>
</html>