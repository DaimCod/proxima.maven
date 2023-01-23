<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Complete your registration</title>
</head>
<body>
<% int id= Integer.parseInt(request.getParameter("id")); %>
	<form action="./CompleteServlet" method="Post">
		
		<input type="hidden" name="id" value="<%=id%>"><br>
		
		<label for="password">password:</label><br> 
		<input type="password" name="password"><br>
		
		<label for="confirmPassword">confirm password:</label><br> 
		<input type="password" name="confirmPassword"><br>
		
		<input type="submit" value="Complete registration">
	</form>
</body>
</html>