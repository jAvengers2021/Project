package heritage.model;

import java.nio.charset.StandardCharsets;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Commenti {
	
	public static List<Commento> ReadAllByDocument(int idDoc) {
		List<Commento> commenti = new ArrayList<Commento>();
	
		ConnessioneDB connessione = new ConnessioneDB();

		try {
			connessione.connect();

			ResultSet set = connessione.executeQuery("Select * from commenti where id_documento="+idDoc);

			while (set.next()) {
				int id = set.getInt("id");
				byte[] arrayTesto= set.getBytes("commento");
				String commento =  new String(arrayTesto, StandardCharsets.UTF_8);
				int id_utente = set.getInt("id_utente");
				int id_documento = set.getInt("id_documento");
				String data = set.getString("data");

				Commento commento2 = new Commento(id,commento, id_utente, id_documento,data);
				commenti.add(commento2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			commenti = null;
		}
		return commenti;
	}
	
	
	public static boolean CreateComment(String commento, User utente, int id_documento) {
		
		
		ConnessioneDB connessione = new ConnessioneDB();
		boolean done = false;
		try {
			connessione.connect();
			connessione.executeUpdate("INSERT INTO commenti (id,commento,id_utente,id_documento) VALUES (NULL, '"
					+ commento + "','" + utente.getId() + "','"+id_documento+"')");
			connessione.close();
			done = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return done;
	}
	
}
