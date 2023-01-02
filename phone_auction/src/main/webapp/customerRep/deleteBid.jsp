<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove Bid</title>
</head>
<body>
	<h1>Remove Bid</h1>

  <strong>ALL fields need to be filled in!</strong>
  <br>
  <br>

	<form action="removeBids.jsp" method="post">
		Username: <input type="text" name="username"><br>
		Seller ID: <input type="text" name="sellerID"><br>
		Model Number: <input type="text" name="modelNum"><br>
		Bid Price (NEEDS TO BE ONLY NUMBERS): <input type="text" name="bidPrice"><br>
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
