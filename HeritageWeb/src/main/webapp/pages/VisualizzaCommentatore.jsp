<%@ page import="java.util.List"%>
<%@page import="heritage.model.UserController"%>
<%@page import="heritage.model.User"%>
<%@page import="heritage.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/gestioneLogout.jsp"%>
<%
String url = "";
//"referer" restituisce l'indirizzo dell'ultima pagina prima di arrivare qui
if ("GET".equalsIgnoreCase(request.getMethod())) {
	url = request.getHeader("referer").replace("?mode=logout", "");
	session.setAttribute("loginReferer", url);
}
int id = Integer.parseInt(request.getParameter("id"));
User commentatore = Users.readUserById(id);
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/headerPart1.html"%>
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Cutive+Mono&family=Poppins:wght@100;200;300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../css/styleCommentatore.css">

</head>
<body>


	<div class="container flex-column">

		<div class="content">
			<div class="follow-wrap">
				<a href="<%=url%>" class="back">Indietro</a>
			</div>
		</div>

		<div class="card">
			<div class="header">
				<div class="main">
					<img class="image"
						src="../avatars/<%=commentatore.getId_avatar()%>.png" alt="">
					<div class="close"></div>
					<h3 class="name"><%=commentatore.getNickname()%></h3>
				</div>
			</div>

			<div class="content">
				<div class="buttons-wrap">
					<div class="follow-wrap">
						<a href="#" class="follow" id="inviaRichiesta">Invia Richiesta</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		var inviaRichiesta = document.getElementById('inviaRichiesta');

		inviaRichiesta.addEventListener("click", function(e) {
			ajaxInviaRichiesta(<%=utente.getUser().getId()%>,<%=id%>);
				this.outerHTML = '<a href="#" class="follow ok" id="fatto">Fatto!</a>';
		});

		function ajaxInviaRichiesta(session, asked) {
			const richiesta = new XMLHttpRequest();
			richiesta.open("POST",
					"http://localhost:8080/HeritageWeb/sendRequest");
			richiesta.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			richiesta.send("session=" + session + "&asked=" + asked);
		}
	</script>
</body>
</html>