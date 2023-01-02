<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="com.cs336.pkg.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Customer Data</title>
</head>
<body>
	<%
		String origUsername = request.getParameter("origUsername");
		String data = request.getParameter("data");
		String newValue = request.getParameter("newValue");
		int rowsAffected = 0;
		
		// Connect to the database using JDBC
		// Replace "username" and "password" with your own MySQL username and password
        	ApplicationDB db = new ApplicationDB();
        	Connection con = db.getConnection();
        	PreparedStatement pstmt = null;
	
		if (data.equals("username") ||data.equals("password") ||data.equals("fName") ||data.equals("lName")){
			// Update the 'user' table
			String updateSql = "UPDATE user SET " + data + " = ? WHERE username = ?";
			pstmt = con.prepareStatement(updateSql);
			pstmt.setString(1, newValue);
			pstmt.setString(2, origUsername);
			rowsAffected = pstmt.executeUpdate();
			if (rowsAffected > 0) {
				%>
				<p>Successfully updated the <%=data%> for <%=origUsername%> in the 'user' table.</p>
				<%
			} else {
				%>
				<p>Error: Could not update the <%=data%> for <%=origUsername%> in the 'user' table.</p>
				<%
			}
		}
		
		// Close the connection to the database
		con.close();
		
	%>
<br>
<br>
<form method="post" action="indexRep.jsp"> 
<input type="submit" value="Back to Homepage">
</form>
</body>


</html>
			