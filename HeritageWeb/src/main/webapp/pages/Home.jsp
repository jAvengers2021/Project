<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="heritage.model.UserController"%>
<%@page import="heritage.model.User"%>
<%@page import="heritage.model.Documento"%>
<%@page import="heritage.model.Documenti"%>
<%@page import="heritage.model.Sezione"%>
<%@page import="heritage.model.Sezioni"%>
<%@include file="../include/gestioneLogout.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../include/headerPart1.html"%>
</head>
<body>
	<%@ include file="../include/navbar.html"%>
	<div class="cont">
		<div class="slider"></div>
		<ul class="jumbo"></ul>
	</div>

	<div class="page">
		<section id="one">
			<h1>
				<strong>Scopri le meraviglie della Campania in 3D</strong>
			</h1>
			<br> <br> <br>
			<div class=container>
				<div class="row">
					<%
					Documento documento = Documenti.ReadOneAdmin(2);
					if (documento != null) {
						Sezione sezione = Sezioni.ReadOneByDocument(documento.getId());
						if (sezione != null) {
					%>
					<div class="col-5">
						<a href="VisualizzaDocumento.jsp?id=<%=+documento.getId()%>"
							id="ex3" style="text-decoration: none"><h2><%=documento.getTitolo()%></h2></a>
						<br> <br>
						<p style="text-align: justify; color: white;"><%=sezione.resizeTesto(sezione.getTesto())%></p>
						<br> <br> <a href="VisualizzaSezione.jsp?id=<%=+sezione.getId()%>" style="color: white;">Continua
							a leggere..</a>
					</div>
					<div class="col-7"><%=sezione.getIframe()%></div>



					<%
					}
					}
					%>
				</div>
			</div>
		</section>
	</div>

	<section id="contact">
		<footer class="site-footer">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 col-md-6">
						<h6>Chi siamo</h6>
						<p class="text-justify">Il Portale Campania Heritage:
							permetterà all’amministrazione di costruire documenti che
							sfruttano l’ausilio della Realtà Virtuale, e si concentrerà sulla
							valorizzazione della storia, della cultura, dell’arte e
							dell’architettura.</p>
					</div>

					<div class="col-xs-6 col-md-3">
						<h6>Contatti</h6>
						<ul class="footer-links">
							Regione Campania (Codice Fiscale 800.119.906.39)
							<li>E-mail: amministrazioneCampania@mail.regione.campania.it</li>
							<li>Sede legale: Via Brombeis 81, 80132 Napoli</li>
							<li>Telefono: +39 081 796 6112</li>
						</ul>
					</div>
				</div>
				<br>
				<hr>
				<br>
			</div>
			<div class="container">
				<div class="col-md-4 col-sm-6 col-xs-12" style="float: right;">
					<ul class="social-icons">
						<li><a class="facebook" href="https://it-it.facebook.com/RegCampania/"><i
								class="fa fa-facebook"></i></a></li>
						<li><a class="twitter" href="https://twitter.com/reg_campania"><i class="fa fa-twitter"></i></a></li>
						<li><a class="instagram" href="https://www.instagram.com/regione.campania/?hl=it"><i
								class="fa fa-instagram"></i></a></li>
						<li><a class="youtube" href="https://www.youtube.com/user/regcampania"><i class="fa fa-youtube"></i></a></li>
					</ul>
				</div>
			</div>
		</footer>
	</section>

</body>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<script src="../js/scriptJumbo.js"></script>
</html>
