<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Edit Customer Information</title>
</head>
<body>
	<h1>Edit Customer Information</h1>
	<form action="makeChange.jsp" method="post">
		Original Username: <input type="text" name="origUsername"><br>
		<p>Which data do you want to alter?</p>
		<input type="radio" name="data" value="username">Username<br>
		<input type="radio" name="data" value="password">Password<br>
		<input type="radio" name="data" value="fName">First Name<br>
		<input type="radio" name="data" value="lName">Last Name<br> <br>
		<label for="newValue">New Value:</label><br>
		<input type="text" id="newValue" name="newValue"><br><br>
		<input type="submit" value="Submit">
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