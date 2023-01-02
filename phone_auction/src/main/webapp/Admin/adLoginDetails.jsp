<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%
 	/* 
 	THIS IS REGISTERING.
 	*/
	//THIS PAGE IS FOR AFTER YOU CREATE A NEW ACCOUNT
	
	// We are using the Person parameter to obtain the username, pass, fname, lname, and email.
	String username = request.getParameter("username");    
	String password = request.getParameter("password");
	
	// String url to obtain the New Phone Auction
    //Class.forName("com.mysql.jdbc.Driver");
    // Object Made
	
    ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
    
	// result rs type
    ResultSet rs;
	//getting the query, selecting the table and obtaining the userid.
	// Using person table
    rs = stmt.executeQuery("select * from cust_rep where username='" + username + "'");
	// if it exists 
	// if TRUE the nit happens
    if (rs.next()) {
    	//out.println("Username exists, please try another <a href='Register_Account.jsp'>try again</a>");
    	out.print("Username taken, please choose another one.");%>
		<form method="post" action="createRep.jsp"> 
		<input type="submit" value="Try Again">
		</form> 
	<% 
    } else {
    	int execute_one = stmt.executeUpdate("insert into cust_rep(username, password) values( '" +username+ "','" +password+ "')");
    	//int y = stmt.executeUpdate("insert into customer values( '" +username+ "','" +email+ "')");
    	session.setAttribute("user", username); // the username will be stored in the session
        response.sendRedirect("../customerRep/indexRep.jsp");
    	//String q1 = "insert into userid values('" +userid+ "', '" +pwd+ "')"; 	
    }
%>

<br>
<br>
<form method="post" action="indexAd.jsp"> 
<input type="submit" value="Back to Homepage">
</form>
</body>
</html>