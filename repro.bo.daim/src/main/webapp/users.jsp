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
			<table>
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
			<input type="submit" value="Cancella" id="deleteButton" disabled onclick="javascript:deleteUser()"/>
			<input type="submit" value="Modifica" id="modificaButton" disabled onclick="javascript:modificaUser()"/>
		</form>
	</body>
</html>