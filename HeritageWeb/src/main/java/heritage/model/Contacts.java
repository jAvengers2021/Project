package heritage.model;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import heritage.controllerData.RecuperoJson;

public class Contacts {

	public static List<User> readAcceptedUsers(int asker) {

		RecuperoJson<Contact> json = new RecuperoJson<Contact>();
		LinkedList<Contact> tuttiContatti;
		// Placeholder: riempie la LinkedList di contatti fasulli
		if (asker == 3) {
			tuttiContatti = new LinkedList<Contact>();
			tuttiContatti.add(new Contact(12, new User(3, 19, "guest@guest.guest", "guest"),
					new User(1, 18, "guest1", "guest1@guest.guest"), 1));
			tuttiContatti.add(new Contact(12, new User(3, 19, "guest@guest.guest", "guest"),
					new User(2, 3, "guest2", "guest2@guest.guest"), 1));
		} else {
			// Cast su un metodo generic:
			// Restituisce i contatti per quell'user, qualsiasi sia lo status
			tuttiContatti = (LinkedList<Contact>) json.getList("http://127.0.0.1:8081/contact/all/" + asker,
					Contact.class);
		}
		Iterator<Contact> i = tuttiContatti.iterator();
		// Voglio soltanto gli utenti restituiti da asked
		LinkedList<User> accettate = new LinkedList<User>();
		while (i.hasNext()) {
			Contact contact = (Contact) i.next();
			// E soltanto dove lo status è "Accettato"
			if (contact.getStatus() == 1) {
				accettate.add(contact.getAsked());
			}
		}

		return accettate;
	}

	public static List<User> readPendingUsers(int asked) {

		RecuperoJson<Contact> json = new RecuperoJson<Contact>();
		LinkedList<Contact> tuttiContatti;
		// Placeholder: riempie la LinkedList di contatti fasulli
		if (asked == 3) {
			tuttiContatti = new LinkedList<Contact>();
			tuttiContatti.add(new Contact(12, new User(3, 19, "guest@guest.guest", "guest"),
					new User(5, 14, "guestCat", "guestCat@guest.guest"), 0));
			tuttiContatti.add(new Contact(12, new User(3, 19, "guest@guest.guest", "guest"),
					new User(6, 20, "guestGiraffe", "guestGiraffe@guest.guest"), 0));
		} else {
			// Cast su un metodo generic:
			// Restituisce i contatti per quell'user, qualsiasi sia lo status
			tuttiContatti = (LinkedList<Contact>) json.getList("http://127.0.0.1:8081/contact/all/" + asked,
					Contact.class);
		}
		Iterator<Contact> i = tuttiContatti.iterator();
		// Voglio soltanto gli utenti restituiti da asked
		LinkedList<User> accettate = new LinkedList<User>();
		while (i.hasNext()) {
			Contact contact = (Contact) i.next();
			// E soltanto dove lo status è "Pending" e il richiedente non sia l'user in sessione
			if (contact.getStatus() == 0 && contact.getAsked().getId()!=asked) {
				accettate.add(contact.getAsked());
			}
		}

		return accettate;
	}

	public static String sendRequest(int session, int asked) {

		RecuperoJson<String> json = new RecuperoJson<String>();
		String result = json.downloadJson("http://localhost:8081/createContact/" + session + "/" + asked);
		System.out.println(result);
		return result;

	}

	public static String acceptRequest(int session, int asker) {

		RecuperoJson<String> json = new RecuperoJson<String>();
		String result = json.downloadJson("http://localhost:8081/acceptContact/" + asker + "/" + session);
		System.out.println(result);
		return result;

	}

	public static String rejectRequest(int asker, int session) {

		RecuperoJson<String> json = new RecuperoJson<String>();
		String result = json.downloadJson("http://localhost:8081/rejectContact/" + asker + "/" + session);
		System.out.println(result);
		return result;

	}
}
