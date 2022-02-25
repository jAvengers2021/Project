<%@ page import="java.util.List"%>
<%@ page import="heritage.model.Documento"%>
<%@ page import="heritage.model.Documenti"%>
<%@ page import="heritage.model.Sezione"%>
<%@ page import="heritage.model.Sezioni"%>
<%@ page import="heritage.model.Commento"%>
<%@ page import="heritage.model.Commenti"%>
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
	Sezione sezione = Sezioni.ReadOne(id);
	%>
	<div class="container">
		<%=sezione.getIframe()%>
		<div class="separatore">
			<hr>
		</div>
		
			<div class="p-4 mb-4 bg-light rounded">
				<h4 class="fst-italic" style="color: black;">Descrizione</h4>
				<p class="mb-0"><%=sezione.getTesto()%></p>
			</div>
		</div>

</body>
</html>