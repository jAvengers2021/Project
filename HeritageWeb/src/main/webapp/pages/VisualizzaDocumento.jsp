<%@ page import="java.util.*"%>
<%@ page import="heritage.model.Documento"%>
<%@ page import="heritage.model.Documenti"%>
<%@ page import="heritage.model.Sezione"%>
<%@ page import="heritage.model.Sezioni"%>
<%@ page import="heritage.model.Commento"%>
<%@ page import="heritage.model.Commenti"%>
<%@ page import="heritage.model.Contact"%>
<%@ page import="heritage.model.Contacts"%>
<%@page import="heritage.model.UserController"%>
<%@page import="heritage.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/gestioneLogout.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/headerPart1.html"%>
<link rel="stylesheet" href="../css/styleStory.css">
</head>
<body>
	<%@ include file="../include/navbar.html"%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	List<Sezione> sezioni = Sezioni.ReadAllByDocument(id);
	Documento documento = Documenti.ReadOne(id);
	%>
	<div class="container">
		<h1><%=documento.getTitolo()%></h1>
		<div class="row">
			<%
			for (Sezione sezione : sezioni) {
			%>
			<br>
			<div class="separatore">
				<hr>
			</div>
			<div class="col-auto">

				<%=sezione.getIframe()%>
				<hr>

				<div class="p-4 mb-4 bg-light rounded">
					<h4 class="fst-italic" style="color: black;">Descrizione</h4>
					<p class="mb-0"><%=sezione.getTesto()%></p>
				</div>

				<%
				}
				%>
			</div>
		</div>
		<br>
		<!-- Sezione commenti -->
		<div class="row">
			<%
			if (!utente.isLoggato()) {
			%>
			<h4 style="font-size: 30px;">Commenti</h4>
			<div class="grid">
				<div class="row">

					<%
					List<Commento> commenti = Commenti.ReadAllByDocument(id);

					for (Commento commento : commenti) {
					%>
					<div class="text-justify darker mt-4">
						<img src="../avatars/0.png" alt="" class="rounded-circle"
							width="40" height="40">
						<h4>Anonimo</h4>
						<span>- <%=commento.getData()%></span> <br>
						<p><%=commento.getCommento()%></p>
					</div>
					<%
					}
					%>
					<div class="separatore">
						<hr>
					</div>
					<!-- Inserisci commento (Accedi per commentare) -->
					<form id="algin-form" action="Login.jsp">
						<div class="form-group d-flex justify-content-around">
							<button type="submit" id="post" class="btn">Accedi per
								commentare</button>
						</div>
					</form>

					<%
					} else {
					// Mi ricavo l'istanza di User dal controller "utente"
					User sessione = utente.getUser();
					// Carico la lista utenti dei suoi contatti
					List<User> contatti = Contacts.readAcceptedUsers(sessione.getId());
					%>
					<h4 style="font-size: 30px;">Commenti</h4>
					<div class="grid">
						<div class="row">

							<%
							// Carico la lista di commenti
							List<Commento> commenti = Commenti.ReadAllByDocument(id);

							// Per ogni commento...
							for (Commento commento : commenti) {
								// Imposto un contatore a 0...
								int contatore = 0;
								// Ammesso che la lista contatti non sia vuota, la scorro.
								if (contatti.size() > 0) {
									for (User contatto : contatti) {
								// Ammesso che il contatto non sia null (Avevo il DB rotto, scusate):
								// Se trova un commentatore tra i contatti mostra id avatar e nickname nel commento:
								if (contatto != null && commento.getId_utente() == contatto.getId()) {
							%>
							<div class="text-justify darker mt-4">
								<img src="../avatars/<%=contatto.getId_avatar()%>.png" alt=""
									class="rounded-circle" width="40" height="40">
								<h4><%=contatto.getNickname()%></h4>
								<span>- <%=commento.getData()%></span> <br>
								<p><%=commento.getCommento()%></p>
							</div>
							<%
							// Aumentiamo il contatore
							contatore++;
							}
							}
							}
							// Controlliamo anche se il commento non è stato scritto dall'utente in sessione:	
							if (commento.getId_utente() == sessione.getId()) {
							%>

							<div class="text-justify darker mt-4">
								<img src="../avatars/<%=sessione.getId_avatar()%>.png" alt=""
									class="rounded-circle" width="40" height="40">
								<h4><%=sessione.getNickname()%></h4>
								<span>- <%=commento.getData()%></span> <br>
								<p><%=commento.getCommento()%></p>
							</div>
							<%
							// Aumentiamo il contatore anche in questo caso
							contatore++;
							}
							// Se si arriva a questa condizione, il commentatore non è nella lista contatti e non è l'utente in sessione
							if (contatore == 0) {
							%>
							<div class="text-justify darker mt-4">
								<img src="../avatars/0.png" alt="" class="rounded-circle"
									width="40" height="40"> <a
									href="VisualizzaCommentatore.jsp?id=<%=commento.getId_utente()%>"
									id="ex3" style="text-decoration: none"><h4>Visualizza
										Profilo</h4></a> <span>- <%=commento.getData()%></span> <br>
								<p><%=commento.getCommento()%></p>
							</div>
							<%
							}
							}
							%>
							<div class="separatore">
								<hr>
							</div>
							<!-- Sezione commento per loggati -->
							<form id="algin-form" action="CreaCommento.jsp">
								<div class="form-group">
									<!-- Qui ci va il saluto all'utente -->
									<h4><%=sessione.getNickname()%>, lascia un commento
									</h4>
									<label for="commento">Commento</label> <input type="hidden"
										name="id_documento" value="<%=id%>">
									<textarea name="commento" id="commento" cols="30" rows="5"
										class="form-control" style="background-color: white;" required></textarea>
								</div>
								<div class="form-group d-flex justify-content-around">
									<button type="submit" id="post" class="btn">Invia</button>
								</div>
							</form>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>