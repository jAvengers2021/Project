package heritage.model;

import heritage.controllerData.RecuperoJson;

public class Users {

	public static User readUserById(int id) {

		RecuperoJson<User> json = new RecuperoJson<User>();
		User utente = null;
		// Placeholder: restituisce un utente fasullo con id=4.
		// TODO: Eliminarlo appena stabilita la connessione con l'API REST,
		// oppure eliminare l'utente reale dal database che abbia id=4
		if (id == 4) {
			utente = new User(4, 15, "guestPanda", "guestPanda@guest.guest");
		} else {

			utente = (User) json.getObject("http://127.0.0.1:8081/user/id/one?id_utente=" + id, User.class);
		}

		return utente;
	}
}
