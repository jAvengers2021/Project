<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="admin.model.*"%>

<!DOCTYPE html>
<html lang="en">
<title>Amministrazione - LogIn Fallito</title>
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
		style="padding: 128px 16px">
		<h1>Non sei un Admin!</h1>


	</header>
	<br>
<body style="text-align: center;">

	<input type="button" value="Torna al LogIn" onclick="location.href='login.jsp'"/>

</body>


<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity">
	<p>Creato da Paolo Krogh</p>
</footer>

</body>
</html>

