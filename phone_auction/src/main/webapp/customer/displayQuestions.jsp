<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="com.cs336.pkg.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Questions Forum</title>
</head>
<body>
	<h1>Questions Forum</h1>
	<form action="displayQuestions.jsp" method="get">
		<label for="searchTerm">Search:</label>
		<input type="text" name="searchTerm" id="searchTerm">
		<input type="submit" value="Search">
	</form>
	<form method="post" action="displayQuestions.jsp"> 
	<input type="submit" value="Revert Searches">
	</form>
	<table>
		<tr>
			<th>Username</th>
			<td><td><td>
			<th>Question</th>
			<td><td><td>
			<th>Response</th>
			<td><td><td>
		</tr>
		<%
			// Retrieve search term from request parameter
			String searchTerm = request.getParameter("searchTerm");

			// Connect to database
			ApplicationDB db = new ApplicationDB();
    		Connection con = db.getConnection();

			// Create prepared statement to retrieve questions from database
			String sql = "SELECT * FROM questions";
			if (searchTerm != null) {
				sql += " WHERE question LIKE ?";
			}
			PreparedStatement stmt = con.prepareStatement(sql);
			if (searchTerm != null) {
				stmt.setString(1, "%" + searchTerm + "%");
			}

			// Execute query and retrieve result set
			ResultSet rs = stmt.executeQuery();

			// Iterate over result set and display each question in a table row
			while (rs.next()) {
				String username = rs.getString("username");
				String question = rs.getString("question");
				String reply = rs.getString("response");
		%>
		<tr>
			<td><%= username %></td>
			<td><td><td>
			<td><%= question %></td>
			<td><td><td>
			<td><%= reply %></td>
		</tr>
		<%
			}
			// Close database connection
			con.close();
		%>
	</table>
	
<br>
<br>
<form method="post" action="index.jsp"> 
<input type="submit" value="Back to Homepage">
</form>
</body>
</html>