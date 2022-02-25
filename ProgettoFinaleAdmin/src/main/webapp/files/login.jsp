<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="../parts/head.html"%>
<%@page import="java.util.*"%>

<%@page import="admin.model.*"%>
<!DOCTYPE html>
<html lang="en">
<title>Amministratore - Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Lato", sans-serif
}

.w3-bar, h1, button {
	font-family: "Montserrat", sans-serif
}

.fa-anchor, .fa-coffee {
	font-size: 200px
}
</style>
<body>


	<!-- Header -->
	<header class="w3-container w3-blue w3-center"
		style="padding: 78px 16px">
		<h1>Pannello Amministratore</h1>
	</header>
<body>
	<h1>
		<br>
	</h1>
	<div>
		<h1 style="text-align: center;">LOGIN Admin</h1>
		<form action="LandingPage.jsp" style="text-align: center;">

			<div>


				<label for="username">Username:</label> <input
					style="text-align: center;" type="text" class="form-control"
					placeholder="Admin Username" id="nome_admin" name="nome_admin">
				<br> <br> <label for="pwd">Password:</label> <input
					style="text-align: center;" type="password" class="form-control"
					placeholder="Password" id="password_admin" name="password_admin">


			</div>
			<br> <input type="submit" value="LOGIN"/> <input type="reset" value="CANCELLA">


		</form>

	</div>
</body>




<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity">
	<p>Creato da Paolo Krogh</p>
</footer>

</body>
</html>
