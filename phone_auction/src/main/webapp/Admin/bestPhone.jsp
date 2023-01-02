<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="com.cs336.pkg.*"%>
<%@ page import="java.util.*" %>

<%
  // Connect to the database
  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;
  try {
  	ApplicationDB db = new ApplicationDB();
  	conn = db.getConnection();
    stmt = conn.createStatement();

    // Query to find the modelNum with the highest earnings in closed auctions
    String query = "SELECT modelNum, SUM(currentPrice) AS totalEarnings FROM auction WHERE endDate <= CURDATE() GROUP BY modelNum ORDER BY totalEarnings DESC LIMIT 1";
    rs = stmt.executeQuery(query);

    // Check if there are any closed auctions
    if (!rs.isBeforeFirst()) {
      out.println("There are no closed auctions to extrapulate earnings.");
    } else {
      // Print the modelNum with the highest earnings
      while (rs.next()) {
        String modelNum = rs.getString("modelNum");
        float totalEarnings = rs.getFloat("totalEarnings");
        out.println("The modelNum with the highest earnings is " + modelNum + " with a total of $" + totalEarnings);
      }
    }

    // Query to find the modelNum that appears the most times in auctions
    query = "SELECT modelNum, COUNT(modelNum) AS numAuctions FROM auction GROUP BY modelNum ORDER BY numAuctions DESC LIMIT 1";
    rs = stmt.executeQuery(query);

    // Check if there are any auctions
    if (!rs.isBeforeFirst()) {
      out.println("There are no auctions.");
    } else {
      // Print the modelNum that appears the most times
      while (rs.next()) {
        String modelNum = rs.getString("modelNum");
        int numAuctions = rs.getInt("numAuctions");
        out.println("The modelNum that appears the most times is " + modelNum + " with a total of " + numAuctions + " from all auctions.");
      }
    }
  } catch (SQLException e) {
    out.println("Error: " + e.getMessage());
  } finally {
    try {
      if (rs != null) {
        rs.close();
      }
      if (stmt != null) {
        stmt.close();
      }
      if (conn != null) {
        conn.close();
      }
    } catch (SQLException e) {
      out.println("Error: " + e.getMessage());
    }
  }
%>

<br>
<br>
<form method="post" action="indexAd.jsp"> 
<input type="submit" value="Back to Homepage">
</form>
</body>
</html>