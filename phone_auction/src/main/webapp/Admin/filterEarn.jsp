<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Filter Earnings</title>
</head>
<body>

<h1>Fill Out ONLY 1 Field.</h1>

<form action="phoneEarn.jsp" method="post">
  <label for="modelNum">Model Number:</label>
  <input type="text" id="modelNum" name="modelNum">
  <input type="submit" value="Generate Earnings">
</form>
<br>
<form action="brandEarn.jsp" method="post">
  <label for="brand">Brand:</label>
  <input type="text" id="brand" name="brand">
  <input type="submit" value="Generate Earnings">
</form>
<br>
<form action="userEarn.jsp" method="post">
  <label for="sellerID">Seller ID:</label>
  <input type="text" id="sellerID" name="sellerID">
  <input type="submit" value="Generate Earnings">
</form>



<br>
<br>
<form method="post" action="indexAd.jsp"> 
<input type="submit" value="Back to Homepage">
</form>
</body>
</html>