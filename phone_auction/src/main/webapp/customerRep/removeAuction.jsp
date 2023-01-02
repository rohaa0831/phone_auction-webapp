<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove Auction</title>
</head>
<body>
	<%
		String sellerID = request.getParameter("sellerID");
		String modelNum = request.getParameter("modelNum");

		// Connect to the database
        	ApplicationDB db = new ApplicationDB();
        	Connection conn = db.getConnection();
        	
        	Statement stmt = conn.createStatement();
    		ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM auction");
    		if (rs.next()) {
    			int count = rs.getInt(1);
    			if (count == 0) {
    				out.println("<p>The auction table is empty.</p>");
    			} else {
    				// Delete the matching bid
    				String query = "DELETE FROM auction WHERE sellerID=? AND modelNum=?";
    				PreparedStatement pstmt = conn.prepareStatement(query);
    				pstmt.setString(1, sellerID);
    				pstmt.setString(2, modelNum);
    				int rowsAffected = pstmt.executeUpdate();
    				if (rowsAffected == 0) {
    					out.println("<p>No matching auction was found.</p>");
    				} else {
    					out.println("<p>The auction was successfully removed.</p>");
    				}
    			}
    		}
		
		// Close the database connection
		conn.close();
	%>
	
	<br>
<br>
<form method="post" action="indexRep.jsp"> 
<input type="submit" value="Back to Homepage">
</form>
</body>
</html>
