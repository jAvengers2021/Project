<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="heritage.model.UserController"%>
<%@page import="heritage.model.User"%>
<%@page import="heritage.model.Commenti"%>
<%@ include file="../include/gestioneLogout.jsp"%>
<%
String url = "";
// "referer" restituisce l'indirizzo dell'ultima pagina prima di arrivare qui
if ("GET".equalsIgnoreCase(request.getMethod())) {
	url = request.getHeader("referer").replace("?mode=logout", "");
	session.setAttribute("loginReferer", url);

}

String commento = request.getParameter("commento");
int id_documento = Integer.parseInt(request.getParameter("id_documento"));
User sessione = utente.getUser();
Commenti.CreateComment(commento, sessione, id_documento);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Commento creato!</title>
</head>
<body>
	<input type="hidden" id="ref"
		value="<%=session.getAttribute("loginReferer")%>">

	<script>
		function reindirizza() {
			var referer = document.getElementById("ref");
			var url = referer.value;
			console.log(url);

			setTimeout(function() {
				window.location.href = url;
			}, 1)

		}

		window.addEventListener("load", function() {
			reindirizza();
		})
	</script>

	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-alpha1/jquery.min.js'></script>
	<script src="../js/scriptLanding.js" type="text/javascript"></script>
</body>
</html>