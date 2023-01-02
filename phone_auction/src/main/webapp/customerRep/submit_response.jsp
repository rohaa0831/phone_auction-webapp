<%@ page import="java.sql.*" import="com.cs336.pkg.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// Establish a connection to the database
  try {
    ApplicationDB db = new ApplicationDB();
    Connection conn = db.getConnection();

    // Create a statement object and execute the SELECT query
    Statement stmt = conn.createStatement();
    String sql = "SELECT username, question, response FROM Questions";
    ResultSet rs = stmt.executeQuery(sql);

    // Loop through the results and display the questions and forms for responding in the JSP page
    while (rs.next()) {
      String username = rs.getString("username");
      String question = rs.getString("question");
      String reply = rs.getString("response");
      out.println("<p>" + username + " asked: " + question + "</p>");
      if (reply == null) {
        out.println("<form action='' method='post'>");
        out.println("<input type='hidden' name='username' value='" + username + "'>");
        out.println("<input type='hidden' name='question' value='" + question + "'>");
        out.println("<label for='response'>Response:</label>");
        out.println("<textarea id='response' name='response'></textarea><br>");
        out.println("<input type='submit' value='Submit'>");
        out.println("</form>");
      } else {
        out.println("<p>Response: " + reply + "</p>");
      }
    }
  } catch (SQLException e) {
	  e.printStackTrace();
  }

  String username = request.getParameter("username");
  String question = request.getParameter("question");
  String reply = request.getParameter("response");
  
    try {
      // Establish a connection to the database
      ApplicationDB db = new ApplicationDB();
      Connection conn = db.getConnection();

      // Create a statement object and execute the UPDATE query
      Statement stmt = conn.createStatement();
      String sql = "UPDATE Questions SET response = ? WHERE question = ?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, reply);
      pstmt.setString(2, question);
      pstmt.executeUpdate();
    } catch (SQLException se) {
    	se.printStackTrace();
      // Handle JDBC errors
    }
    
    
  
%>

<br>
<br>
<form method="post" action="submit_response.jsp"> 
<input type="submit" value="Refresh">
</form>
</body>
</html>

<br>
<br>
<form method="post" action="indexRep.jsp"> 
<input type="submit" value="Back to Homepage">
</form>
</body>
</html>