<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove Auction</title>
</head>
<body>
	<h1>Remove Auction</h1>
	
<strong>ALL fields need to be filled in!</strong>
  <br>
  <br>
  
	<form action="removeAuction.jsp" method="post">
		Seller ID: <input type="text" name="sellerID"><br>
		Model Number: <input type="text" name="modelNum"><br>
		<input type="submit" value="Remove">
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