<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="heritage.controllerData.InvioLogin"%>
<%@page import="heritage.model.User"%>
<%@page import="heritage.model.UserController"%>

<%
String url = "";
// "referer" restituisce l'indirizzo dell'ultima pagina prima di arrivare qui
if ("GET".equalsIgnoreCase(request.getMethod())) {
	url = request.getHeader("referer").replace("?mode=logout", "");
	session.setAttribute("loginReferer", url);

}

// Questa procedura verrà effettuata soltanto nella pagina di login, una volta schiacciato il pulsante submit
if ("POST".equalsIgnoreCase(request.getMethod())) {

	User utente = InvioLogin.recuperaUtente(request.getParameter("nickname"), request.getParameter("password"));

	if (utente != null) {

		session.setAttribute("utente", utente);
		session.setAttribute("logged", true);
		String redirectURL = "Landing.jsp";
		response.sendRedirect(redirectURL);
	}
}
%>
<%@ include file="../include/gestioneLogout.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="../css/styleLogin.css">
<title>Collegati</title>
</head>
<body>
	<div class="login-wrapper">
		<form action="?" method="POST" class="form" id="form">
			<img src="../avatars/0.png" alt="">
			<h2>Login</h2>

			<!-- L'errore "utente cannot be resolved" viene risolto in runtime -->
			<!-- L'oggetto "utente" si trova in "gestioneLogout.html" -->
			<%
			if ("POST".equalsIgnoreCase(request.getMethod())) {

				if (!utente.isLoggato()) {
			%>
			<p id="error-nickname">
				<strong>L'utente e/o password errata</strong>
			</p>
			<%
			}

			}
			%>

			<div class="input-group">
				<input type="text" name="nickname" id="nickname" required> <label
					for="nickname">Nickname</label>
			</div>
			<div class="input-group">
				<input type="hidden" value="<%=url%>" name="provenienza"> <input
					type="password" name="password" id="password" required> <label
					for="password">Password</label>
			</div>
			<input type="submit" value="Login" class="submit-btn" id="invia">
			<a href="#forgot-pw" class="forgot-pw">Forgot Password?</a>
		</form>

		<div id="forgot-pw">
			<form action="" class="form">
				<a href="#" class="close">&times;</a>
				<h2>Reset Password</h2>
				<div class="input-group">
					<input type="email" name="email" id="email" required> <label
						for="email">Email</label>
				</div>
				<input type="submit" value="Submit" class="submit-btn">
			</form>
		</div>
	</div>

	<script src="../js/scriptLogin.js"></script>

</body>
</html>