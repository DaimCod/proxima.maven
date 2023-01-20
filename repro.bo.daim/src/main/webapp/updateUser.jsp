<%@page import="proxima.info.app.dto.UserDto"%>
<%@page import="proxima.info.app.DatabaseManagerSingleton"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@include file="authentication.jsp" %>  
<%@include file="header.jsp" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update users</title>
</head>
<body>
	<% String id = (String)request.getParameter("selectedUserId");
	
		UserDto user = DatabaseManagerSingleton.getInstance().selectById(id);
		String email = user.getEmail();
		String password = user.getPassword();
		String firstname = user.getFirstname();
		String lastname = user.getLastname();
		String birthday = "" + user.getDateofbirth();
		String regdate = "" + user.getRegdate();
		int role = user.getRole();
		String image = user.getImgpath();
		String note = user.getNote();
		boolean enabled = user.isEnabled();
		
		int i = enabled==true ? 1:0;
		
	%>
			<h3>L'utente selezionato ha Id = <%=id %></h3>
			<h4>	
				  <label for="regdate">registration date:</label><br>
				  <input type="text" name="regdate" value="<% out.print(regdate); %>" disabled><br>
			</h4>
			
			<form action="./UpdateUserServlet" method="POST">
				  <label for="id">id:</label><br>
				  <input type="number" name="id" value="<% out.print(id); %>"><br>
				  
				  <label for="email">email:</label><br>
				  <input type="email" name="email" value="<% out.print(email); %>"><br>
				  
				  <label for="firstname">firstname:</label><br>
				  <input type="text" name="firstname" value="<% out.print(firstname); %>"><br>
				  
				  <label for="lastname">lastname:</label><br>
				  <input type="text" name="lastname" value="<% out.print(lastname); %>"><br>
				  
				  <label for="birthday">birthday:</label><br>
				  <input type="date" name="birthday" value="<% out.print(birthday); %>"><br>
				  
				  <br><br><br>
				 
				  <input type="submit" value="Update info">
			</form>
</body>
</html>