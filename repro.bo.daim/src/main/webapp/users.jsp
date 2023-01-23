<%@page import="proxima.info.app.dto.UserDto"%>
<%@page import="proxima.informatica.academy.seventh.service.UserService"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<%@include file="authentication.jsp" %>
<%@include file="header.jsp" %>
 
<html>
	<head>
		<meta charset="UTF-8">
		<title>List users</title>
		<script type="text/javascript">
// 			alert("sono qui");
			
			
			function abilitaButton(){
				console.log("Questa è la funzione");
				document.getElementById("deleteButton").disabled=false;
				document.getElementById("modificaButton").disabled=false;
				
			}
			
			function deleteUser(){
				console.log("delete");
				document.getElementById("selectionForm").action="./DeleteUserServlet";
				document.getElementById("selectionForm").submit();
			}
			
			function modificaUser(){
				console.log("modifica");
				document.getElementById("selectionForm").action="updateUser.jsp";
				document.getElementById("selectionForm").submit();
			}
		</script>
	</head>
	<body>
		<form id="selectionForm">
			<table class="table table-striped">
				<thead>
				    <tr>
				    <th scope="col">#</th>
				      <th scope="col">id</th>
				      <th scope="col">email</th>
				      <th scope="col">password</th>
				      <th scope="col">firstname</th>
				      <th scope="col">lastname</th>
				      <th scope="col">date of birth</th>
				      <th scope="col">reg date</th>
				      <th scope="col">role</th>
				      <th scope="col">imgPath</th>
				      <th scope="col">note</th>
				      <th scope="col">enabled</th>
				    </tr>
				  </thead>
				<%
				ArrayList<UserDto> lista = null;
						
			   lista = UserService.getIstance().selectAllUsers();
			   for (UserDto item : lista) {
				%>
			    	
			    	<tr>
			    	<td><input type="radio" name="selectedUserId" value="<%out.print(item.getId());%>" onclick="javascript:abilitaButton()"></td>
			    	<td><%= item.getId() %></td>
	 		    	<td><%= item.getEmail() %></td>
	 		    	<td><%= item.getPassword() %></td>
	 		    	<td><%= item.getFirstname() %></td>
	 		    	<td><%= item.getLastname() %></td>
	 		    	
	 		    	<td><%= item.getDateofbirth() %></td>
	 		    	<td><%= item.getRegdate() %></td>
	 		    	<td><%= item.getRole() %></td>
	 		    	<td><%= item.getImgpath() %></td>
	 		    	<td><%= item.getNote() %></td>
	 		    	<td><%= item.isEnabled() %></td>
	 		    	</tr>
	 		    	
			    	<%
				  }
				%>
			</table>
<!-- 			<input type="submit" value="Cancella" id="deleteButton" disabled onclick="javascript:deleteUser()"/> -->
			<button type="button" class="btn btn-danger" id="deleteButton" disabled onclick="javascript:deleteUser()">Cancella</button>
			<button type="button" class="btn btn-warning" id="modificaButton" disabled onclick="javascript:modificaUser()">Modifica</button>
<!-- 			<input type="submit" value="Modifica" id="modificaButton" disabled onclick="javascript:modificaUser()"/> -->
		</form>
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
		
	</body>
</html>