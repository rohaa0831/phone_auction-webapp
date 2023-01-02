<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");   
    String password = request.getParameter("password");
	//session.setAttribute("username", username);
	//session.setAttribute("password", password); 
	//myStorage = window.sessionStorage;
	//sessionStorage.setItem("username", username);
	
    ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	
	Statement st = con.createStatement();
    ResultSet rs;
	ResultSet rs1;
	ResultSet rs2; 
	ResultSet rs3;
    rs = st.executeQuery("select username from customer where username='" +  username +  "'");
   	//rs1 = st.executeQuery("select password from person where username='" +  username +  "'"); 
   	//rs2 = st.executeQuery("select username from customerRep where username= '" +username+"'");
   	if (rs.next()){    
   	rs1 = st.executeQuery("select password from user where username='" +  username +  "' AND password='"+password+"'"); 
    	if(rs1.next()){	
    		if(((password.length() == 0 ) || !(password == null))){
        		session.setAttribute("user", username); // the username will be stored in the session
        		
        		out.println("welcome " + username);
        		out.println("<a href='logout_customer.jsp'>Log out</a>");
        		response.sendRedirect("customer/index.jsp");	
    		}
    	}else{
    		out.println("<h1 align='center'> Invalid password please <a href='login.jsp'>try again.</a> </h1>");
    	}
    } else {
    	out.println("<h1 align='center'> Invalid password please <a href='login.jsp'>try again.</a> </h1>");
    }
%>