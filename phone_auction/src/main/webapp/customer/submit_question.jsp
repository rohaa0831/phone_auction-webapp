<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Submit Question</title>
</head>
<body>

<h1>Submit Question</h1>

<form action="submit_question.jsp" method="post">
<div align='center'> 
    <label for="question">Question:</label><br>
    <input type="text" id="question" name="question" required><br>
    <br>
    <input type="submit" value="Submit">
</form> 

<%
    // Get the question from the form
    String question = request.getParameter("question");

    // Check if the question is not null
    if (question != null) {
        // Establish database connection
        try {
        	ApplicationDB db = new ApplicationDB();
        	Connection con = db.getConnection();

            // Get the username of the logged-in user
            String username = (String)session.getAttribute("user");

            // Execute INSERT query to insert the question into the database
            PreparedStatement pstmt = con.prepareStatement(
                    "INSERT INTO questions (username, question) VALUES (?, ?)");
            pstmt.setString(1, username);
            pstmt.setString(2, question);
            pstmt.executeUpdate();

            // Close the statement and connection
            pstmt.close();
            con.close();

            // Display success message
            out.println("<p>Question submitted successfully!</p>");
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<br>
<br>
<form method="post" action="index.jsp"> 
<input type="submit" value="Back to Homepage">
</form>
</body>
</html>
