<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Remove Bid</title>
</head>
<body>
	<%
		String username = request.getParameter("username");
		String sellerID = request.getParameter("sellerID");
		String modelNum = request.getParameter("modelNum");
		String bidPriceStr = request.getParameter("bidPrice");
		float bidPrice = Float.parseFloat(bidPriceStr);
		
		// Connect to the database
        	ApplicationDB db = new ApplicationDB();
        	Connection conn = db.getConnection();
		
		// Check if the bids table is empty
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM bids");
		if (rs.next()) {
			int count = rs.getInt(1);
			if (count == 0) {
				out.println("<p>The bids table is empty.</p>");
			} else {
				// Delete the matching bid
				String query = "DELETE FROM bids WHERE username=? AND sellerID=? AND modelNum=? AND bidPrice=?";
				PreparedStatement pstmt = conn.prepareStatement(query);
				pstmt.setString(1, username);
				pstmt.setString(2, sellerID);
				pstmt.setString(3, modelNum);
				pstmt.setFloat(4, bidPrice);
				int rowsAffected = pstmt.executeUpdate();
				if (rowsAffected == 0) {
					out.println("<p>No matching bid was found.</p>");
				} else {
					out.println("<p>The bid was successfully removed.</p>");
				}
			}
		}
		
		conn.close();
	%>
</body>
</html>

<br>
<br>
<form method="post" action="indexRep.jsp"> 
<input type="submit" value="Back to Homepage">
</form>
</body>
</html>

