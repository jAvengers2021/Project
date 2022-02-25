<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>

<%@page import="admin.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	Admin admin = new Admin(request.getParameter("nome_admin"), request.getParameter("password_admin"));
	Admin adminCheck = AdminRepository.Read(admin.getNome_admin(), admin.getPassword_admin());

	//utente.getPassword().equals(set.getString("password")

	if (admin.getPassword_admin().equals(adminCheck.getPassword_admin())) {
		String redirectURL = "http://localhost:8080/ProgettoFinaleAdmin/files/CreateDocumento.jsp";
		response.sendRedirect(redirectURL);

	} else {

		String redirectURL = "http://localhost:8080/ProgettoFinaleAdmin/files/loginfail.jsp";
		response.sendRedirect(redirectURL);
	}
	%>
</body>
</html>