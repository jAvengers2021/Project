package heritage.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Documenti {
	
	public static List<Documento> ReadAll() {
		List<Documento> documenti = new ArrayList<Documento>();
	
		ConnessioneDB connessione = new ConnessioneDB();

		try {
			connessione.connect();

			ResultSet set = connessione.executeQuery("Select * from documenti order by data");

			while (set.next()) {
				int id = set.getInt("id");
				String titolo = set.getString("titolo");
				String data = set.getString("data");
				int amministratore = set.getInt("amministratore");

				Documento documento = new Documento(id,titolo, data, amministratore);
				documenti.add(documento);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			documenti = null;
		}
		return documenti;
	}
	
	public static List<Documento> ReadAllByAdmin() {
		List<Documento> documenti = new ArrayList<Documento>();
	
		ConnessioneDB connessione = new ConnessioneDB();

		try {
			connessione.connect();

			ResultSet set = connessione.executeQuery("Select * from documenti where amministratore = 1");

			while (set.next()) {
				int id = set.getInt("id");
				String titolo = set.getString("titolo");
				String data = set.getString("data");
				int amministratore = set.getInt("amministratore");

				Documento documento = new Documento(id,titolo, data, amministratore);
				documenti.add(documento);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			documenti = null;
		}
		return documenti;
	}
	
	public static Documento ReadOne(int idDoc) {
		Documento documento = null;
	
		ConnessioneDB connessione = new ConnessioneDB();

		try {
			connessione.connect();

			ResultSet set = connessione.executeQuery("Select * from documenti where id ="+idDoc);

			if (set.next()) {
				int id = set.getInt("id");
				String titolo = set.getString("titolo");
				String data = set.getString("data");
				int amministratore = set.getInt("amministratore");

				 documento = new Documento(id,titolo, data, amministratore);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			documento = null;
		}
		return documento;
	}
	
	// QUERY GAETANO
	
	public static Documento ReadOneAdmin(int admin) {
		Documento documento = null;
	
		ConnessioneDB connessione = new ConnessioneDB();

		try {
			connessione.connect();

			ResultSet set = connessione.executeQuery("Select * from documenti where amministratore ="+admin);

			if (set.next()) {
				int id = set.getInt("id");
				String titolo = set.getString("titolo");
				String data = set.getString("data");
				int amministratore = set.getInt("amministratore");

				 documento = new Documento(id,titolo, data, amministratore);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			documento = null;
		}
		return documento;
	}

	
	
	// QUERY PAOLO
	public static boolean CreateDocumento(String titolo, String data, boolean amministratore) {

		ConnessioneDB connessione = new ConnessioneDB();
		boolean done = false;
		try {
			connessione.connect();
			connessione.executeUpdate("INSERT INTO `documenti` (`id`,`titolo`,`data`, `amministratore`) VALUES (NULL, '"
					+ titolo + "','" + data + "','" + amministratore + "')");
			connessione.close();
			done = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return done;
	}

	public static boolean DeleteDocumenti(int id) {

		ConnessioneDB connessione = new ConnessioneDB();
		boolean done = false;
		try {
			connessione.connect();
			if (id != -1) {
				connessione.executeUpdate("DELETE FROM documenti WHERE id = " + id);
			}

			connessione.close();
			done = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return done;
	}
	

	public static boolean UpdateDocumenti(int id, String titolo, String data, int amministratore) {

		ConnessioneDB connessione = new ConnessioneDB();
		boolean done = false;

		try {
			connessione.connect();
			String query= " Update documenti set id=?, titolo=?, data=?, amministratore=? where id=" + id;
			done = connessione.executeUpdate(query);
			connessione.close();
			done = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return done;
	}

}
