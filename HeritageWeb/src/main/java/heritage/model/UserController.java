package heritage.model;

public class UserController {

	private User user;
	private boolean loggato = false;

	public UserController(User u, boolean bool) {
		this.user = u;
		this.loggato = bool;
	}

	public UserController() {

	}

	public User getUser() {
		return user;
	}

	public boolean isLoggato() {
		return loggato;
	}

	public String generaContatti() {

		return "";
	}

	/**
	 * Genera il dropdown della navbar. Cambia l'avatar in base a quello scelto
	 * dall'utente scelto. Nel menu, permette l'accesso ai contatti e il logout.
	 * 
	 * @return HTML in stringa
	 */
	public String generaDropdown() {
		String html = "";
		if (!loggato) {
			html = "<img src=\"../avatars/0.png\" alt=\"\" class=\"avatar\"\r\n"
					+ "					class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\"\r\n"
					+ "					role=\"button\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\r\n"
					+ "					<ul class=\"dropdown-menu dropdown-menu-end\"\r\n"
					+ "						aria-labelledby=\"navbarDropdown\">\r\n"
					+ "						<li><a class=\"dropdown-item\" href=\"Login.jsp\">Login</a></li>\r\n"
					+ "						<li><hr class=\"dropdown-divider\"></li>\r\n"
					+ "						<li><a class=\"dropdown-item\" href=\"http://127.0.0.1:8081/user/registration\">Registrati</a></li>\r\n"
					+ "					</ul>";
		} else {
			html = "<img src=\"../avatars/" + user.getId_avatar() + ".png\" alt=\"\" class=\"avatar\"\r\n"
					+ "					class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\"\r\n"
					+ "					role=\"button\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\r\n"
					+ "					<ul class=\"dropdown-menu dropdown-menu-end\"\r\n"
					+ "						aria-labelledby=\"navbarDropdown\">\r\n"
					+ "						<li><a class=\"dropdown-item\" href=\"Profilo.jsp\">Profilo</a></li>\r\n"
					+ "						<li><hr class=\"dropdown-divider\"></li>\r\n"
					+ "						<li><a class=\"dropdown-item\" href=\"Logout.jsp?mode=logout\">Logout</a></li>\r\n"
					+ "					</ul>";
		}
		return html;
	}

}
