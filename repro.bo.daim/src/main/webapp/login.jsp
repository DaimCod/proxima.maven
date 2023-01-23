<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
    String mex = null ; 
    if (request.getAttribute("message")!=null) { 
	    mex = (String)request.getAttribute("message");
    }
	
%>
<html lang="en">
	<head>
	<meta charset="ISO-8859-1">
	
	 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	 
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<style>
		
		.col-lg-2{
			background-color: green;
		}
		
		.col-lg-4{
			background-color: blue;
		}
		
		.col-lg-6{
			background-color: red;
		}
		
		.container{
			background-color: orange;
		}
	//  Small devices (landscape phones, 576px and up)
		@media (min-width: 576px) { 
		background-color: orange; 
		}
		
		// Medium devices (tablets, 768px and up)
		@media (min-width: 768px) { 
		background-color: yellow; 
		}
		
		// Large devices (desktops, 992px and up)
		@media (min-width: 992px) { 
		background-color: blue; 
		}
		
		// Extra large devices (large desktops, 1200px and up)
		@media (min-width: 1200px) { 
		background-color: green; 
		}
		
		
	</style>
	
	<title>Login</title>
	</head>
	<body>
		
				
				<% if(mex != null) { 		 								
				%>
				<div class="alert alert-danger" role="alert">
				    <% out.print(mex); %>
				</div>
				<%
				}
				%>
			
		
		<div class="container">
			
				<form action="./LoginServlet" method="Post">
				   <div class="row">
					  
					  <div class="col-sm-6 col-lg-2">
					  <label for="email">email:</label><br>
					  <input type="email" name="email" ><br>
					  </div>
					  
					   <div class="col-sm-4 col-lg-4">
					  <label for="password">password</label><br>
					  <input type="password" name="password"><br><br>
					  </div>
					  
					  <div class="col-sm-2 col-lg-6">
					  <input type="submit" value="Sign in">
					  
			    	  </div>
			    	  
			    	</div>
				</form> 
			
		</div>
		
		<a href="registration.html">New? Sign up here</a>
		
		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	</body>
</html>