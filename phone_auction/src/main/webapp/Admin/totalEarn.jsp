<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="com.cs336.pkg.*"%>
<%
        // Load the JDBC driver
        ApplicationDB db = new ApplicationDB();
        Connection conn = db.getConnection();

        // Create a statement
        Statement stmt = conn.createStatement();

        // Execute the query
        ResultSet rs = stmt.executeQuery("SELECT * FROM auction WHERE endDate <= CURDATE()");

        double summation = 0;
        int count = 0;
        while (rs.next()) {
            summation += rs.getDouble("currentPrice");
            count++;
        }

        if (count == 0) {
            out.println("No auctions found.");
        } else if (summation == 0) {
            out.println("No closed auctions found.");
        } else {
            out.println("Summation of currentPrice for closed auctions: " + summation);
        }
    
%>

<br>
<br>
<form method="post" action="indexAd.jsp"> 
<input type="submit" value="Back to Homepage">
</form>
</body>
</html>