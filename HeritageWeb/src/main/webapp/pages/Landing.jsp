<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="heritage.model.UserController"%>
<%@page import="heritage.model.User"%>
<%@ include file="../include/gestioneLogout.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/styleLanding.css">
<title>Benvenuto su Heritage!</title>
</head>
<body>

	<div id="main" class="is-loading">
	<!-- L'errore "utente cannot be resolved" viene risolto in runtime -->
	<!-- L'oggetto "utente" si trova in "gestioneLogout.html" -->
		<h1>
			Benvenuto su Heritage,
			<%=utente.getUser().getNickname()%>!
		</h1>
	</div>

	<input type="hidden" id="ref"
		value="<%=session.getAttribute("loginReferer") %>">

	<script>
		function reindirizza() {
			var referer = document.getElementById("ref");
			var url = referer.value;
			console.log(url);

			setTimeout(function() {
				window.location.href = url;
			}, 4000)

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