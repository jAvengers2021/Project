<%@ page import="java.util.List"%>
<%@page import="heritage.model.UserController"%>
<%@page import="heritage.model.User"%>
<%@page import="heritage.model.Users"%>
<%@page import="heritage.model.Contacts"%>
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
User sessione = utente.getUser();
List<User> contatti = Contacts.readAcceptedUsers(sessione.getId());
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/headerPart1.html"%>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<link rel="stylesheet" href="../css/styleProfilo.css">

</head>
<body>

	<div class="d-flex justify-content-center" id="back">
		<div class="follow-wrap">
			<a href="<%=url%>" class="back">Indietro</a>
		</div>
	</div>

	<div class="wrapper">


		<div class="profile_card">
			<div class="settings_btn">
				<i class="fas fa-cog"></i>
			</div>
			<div class="profile_wrap">
				<div class="profile_img">
					<img src="../avatars/<%=sessione.getId_avatar()%>.png"
						alt="profile_img">
					<h2><%=sessione.getNickname()%></h2>
				</div>
				<!-- Lista Amiki -->
				<div class="follow">
					<ul id="caricaContatti">
						<%
						for (User contatto : contatti) {
						%>
						<li>
							<div class="slider_item">
								<div class="slider_left">
									<div class="name_img">
										<img src="../avatars/<%=contatto.getId_avatar()%>.png" alt="">
									</div>
								</div>
								<div class="slider_right">
									<div class="item">
										<div class="item_name">
											<%=contatto.getNickname()%>
											<p class="nickname"><%=contatto.getMailAddress()%></p>
										</div>
									</div>
								</div>
							</div>
						</li>
						<%
						}
						%>
					</ul>
				</div>
			</div>
		</div>

		<!-- Contatti in pending  -->
		<div class="profile_slider">
			<ul>
				<%
				List<User> richieste = Contacts.readPendingUsers(sessione.getId());
				for (User richiesta : richieste) {
				%>
				<li>
					<div class="slider_item">
						<div class="slider_left">
							<div class="img">
								<img src="../avatars/<%=richiesta.getId_avatar()%>.png" alt="">
							</div>
							<div class="item">
								<div class="item_name"><%=richiesta.getNickname()%></div>
							</div>
						</div>
						<div class="slider_right" id="<%=richiesta.getId()%>">
							<div class="btn btn_following accept"
								onclick="acceptRequest('<%=richiesta.getId()%>');">
								Accetta</div>
							<br>
							<div class="btn btn_following reject"
								onclick="rejectRequest('<%=richiesta.getId()%>');">
								Rifiuta</div>
						</div>
					</div>
				</li>
				<%
				}
				%>
			</ul>
		</div>
	</div>

	<script>
		// Codice di scorrimento pannello laterale
		var settings_btn = document.querySelector(".settings_btn");
		var profile_slider = document.querySelector(".profile_slider");

		settings_btn.addEventListener("click", function() {
			profile_slider.classList.toggle("active");
			this.classList.toggle("active");
		})

		// Funzione di rifiuto richiesta
		function rejectRequest(askerId) {
			// Modifico l'aspetto del pulsante cliccato
			document.getElementById(askerId).innerHTML = '<div class="slider_right"><div class="btn btn_follow">Rifiutato</div></div>';
			// Chiamata Ajax alla servlet "ponte"
			const richiesta = new XMLHttpRequest();
			richiesta.open("POST",
					"http://localhost:8080/HeritageWeb/rejectRequest");
			richiesta.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			richiesta.send("asker=" + askerId + "&session="+<%=utente.getUser().getId()%>);
			// Ricarico contatti nella pagina
			ricaricaContatti(<%=utente.getUser().getId()%>);
		}

		// Funzione di rifiuto richiesta
		function acceptRequest(askerId) {
			// Modifico l'aspetto del pulsante cliccato
			document.getElementById(askerId).innerHTML = '<div class="slider_right"><div class="btn btn_follow">Accettato</div></div>';
			const richiesta = new XMLHttpRequest();
			// Chiamata Ajax alla servlet "ponte"
			richiesta.open("POST",
					"http://localhost:8080/HeritageWeb/acceptRequest");
			richiesta.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			richiesta.send("session="+<%=utente.getUser().getId()%>+"&asker=" + askerId);
			// Ricarico contatti nella pagina
			ricaricaContatti(<%=utente.getUser().getId()%>);
		}
		
		// Funzione di ricarica contatti
		function ricaricaContatti(id){
			// Richiesta Ajax
			const richiesta = new XMLHttpRequest();
			richiesta.onload = function() {
				// Ottengo un documento dei contatti da parsare in Json
			  const contatti = JSON.parse(this.responseText);
				// Conservo tutta la struttura della <li> dove viene inserito normalmente il contatto
				// In una variabile "html". Con un ciclo for stampo questa struttura tante volte
				// Quanti sono gli elementi all'interno del json, restituendomi i valori di
				// id_avatar, nickname e mailAddress dove inizialmente recupero tramite jsp
			  var html="";
			  for (var i = 0; i < contatti.length; i++) {
				  html+='<li><div class="slider_item"><div class="slider_left">';
				  html+='<div class="name_img"><img src="../avatars/'+contatti[i].id_avatar+'.png" alt="">';
				  html+='</div></div><div class="slider_right"><div class="item">';
				  html+='<div class="item_name">'+contatti[i].nickname+'<p class="nickname">'+contatti[i].mailAddress;
				  html+='</p></div></div></div></div></li>';
				}
			  // Ho dato un id alla <ul> dove devo inserire le <li>. Me lo recupero e ci inserisco
			  // Il risultato della stringa al termine del ciclo for
				document.getElementById("caricaContatti").innerHTML = html;

			};
			
			// Passo l'id a parametro. Sarà quello dell'utente in sessione
			richiesta.open("GET",
					"http://localhost:8080/HeritageWeb/ricaricaContatti?id="+id);
			richiesta.send();

		}
	</script>

</body>

</html>