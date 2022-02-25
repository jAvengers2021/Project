<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="admin.model.*"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<title>Amministrazione - Elimina Documento</title>
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

	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-blue w3-card w3-left-align w3-large">
			<a
				class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-blue"
				href="javascript:void(0);" onclick="myFunction()"
				title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a> <a
				href="logout.jsp"
				class="w3-bar-item w3-button w3-padding-large w3-hover-white">LOGOUT</a>
			<a href="CreateDocumento.jsp"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Creazione
				Documento</a> <a href=CreateSezioni.jsp
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Creazione
				Sezione</a> <a href=ModificaDocumento.jsp
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Modifica
				Documento</a> <a href="ModificaSezioni.jsp"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Modifica
				Sezione</a>
				<a href=EliminaSezione.jsp
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Elimina Sezione</a>
				<a href=Evidenza.jsp
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Evidenza</a>


		</div>

	</div>

	<!-- Header -->
	<header class="w3-container w3-blue w3-center"
		style="padding: 128px 16px">
		<h1>Amministratore</h1>

		<div class="container">

			<h4 style="text-align: center;">Elimina un Documento</h4>

			<form action="ConfirmEliminaDoc.jsp" style="text-align: center;">
			

<%
			List<Documento> documento = Documenti.ReadAll();

			if (documento.size() == 0) {
				String redirectURL = "fail.jsp";
				response.sendRedirect(redirectURL);
			}
			%>

			<%
			for (Documento documenti : documento) {
			%>
			
			<input type="Hidden" id="id" name="id" value="<%=documenti.getId()%>">
			<input style="text-align: center; type="text" name="titolo" value="<%=documenti.getTitolo()%>" readonly>
			<input style="text-align: center; type="date" name="data" value="<%=documenti.getData()%>" readonly>

			<a href="ConfirmEliminaDoc.jsp?id=<%=documenti.getId()%>"><button type="button" class="delete">Elimina</button></a>
			<br> <br>

			<%
			}
			%>


			</form>
		</div>
	</header>

	<!-- Footer -->
	<footer class="w3-container w3-padding-64 w3-center w3-opacity">
		<p>Creato da Paolo Krogh</p>
	</footer>

</body>
</html>