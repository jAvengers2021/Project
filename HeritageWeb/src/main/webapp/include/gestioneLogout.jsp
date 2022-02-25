
<% if(request.getParameter("mode") != null && request.getParameter("mode").equals("logout")){

		if(session.getAttribute("logged") != null && (Boolean)session.getAttribute("logged") == true){ 
				session.removeAttribute("logged");
		}

	}

	User u = null;
	boolean logged = false;

	if (session.getAttribute("logged") != null && (Boolean) session.getAttribute("logged") == true) {
		
		if((User) session.getAttribute("utente")!=null){
			u = (User) session.getAttribute("utente");
			logged = true;
		}
	
	}

	UserController utente = new UserController(u, logged);
%>
