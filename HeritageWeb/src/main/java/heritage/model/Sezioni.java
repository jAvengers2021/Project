package heritage.model;

import java.nio.charset.StandardCharsets;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class Sezioni {
	public static List<Sezione> ReadAllSezioni() {
		List<Sezione> sezioni = new ArrayList<Sezione>();
	
		ConnessioneDB connessione = new ConnessioneDB();

		try {
			connessione.connect();

			ResultSet set = connessione.executeQuery("Select * from sezioni");

			while (set.next()) {
				int id = set.getInt("id");
				String iframe = set.getString("iframe");
				byte[] arrayTesto= set.getBytes("testo");
				String testo =  new String(arrayTesto, StandardCharsets.UTF_8);
				int id_documento = set.getInt("id_documento");

				Sezione sezione = new Sezione(id,iframe, testo, id_documento);
				sezioni.add(sezione);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			sezioni = null;
		}
		return sezioni;
	}
	
	public static List<Sezione> ReadAllByDocument(int idDoc) {
		List<Sezione> sezioni = new ArrayList<Sezione>();
	
		ConnessioneDB connessione = new ConnessioneDB();

		try {
			connessione.connect();

			ResultSet set = connessione.executeQuery("Select * from sezioni where id_documento="+idDoc);

			while (set.next()) {
				int id = set.getInt("id");
				String iframe = set.getString("iframe");
				byte[] arrayTesto= set.getBytes("testo");
				String testo =  new String(arrayTesto, StandardCharsets.UTF_8);
				int id_documento = set.getInt("id_documento");
				Sezione sezione = new Sezione(id,iframe, testo, id_documento);
				sezioni.add(sezione);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			sezioni = null;
		}
		return sezioni;
	}
	
	public static Sezione ReadOne(int idSez) {
		Sezione sezione = null;
	
		ConnessioneDB connessione = new ConnessioneDB();

		try {
			connessione.connect();

			ResultSet set = connessione.executeQuery("Select * from sezioni where id="+idSez);

			while (set.next()) {
				int id = set.getInt("id");
				String iframe = set.getString("iframe");
				byte[] arrayTesto= set.getBytes("testo");
				String testo =  new String(arrayTesto, StandardCharsets.UTF_8);
				int id_documento = set.getInt("id_documento");

				sezione = new Sezione(id,iframe, testo, id_documento);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			sezione = null;
		}
		return sezione;
	}
	
	// QUERY PAOLO
	public static boolean CreateSezioni(String iframe, String testo, int id_documento) {

		ConnessioneDB connessione = new ConnessioneDB();
		boolean done = false;
		try {
			connessione.connect();
			connessione.executeUpdate("INSERT INTO `sezioni` (`id`,`iframe`,`testo`, `id_documento`) VALUES (NULL, '"
					+ iframe + "','" + testo + "','" + id_documento + "')");
			connessione.close();
			done = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return done;
	}
	
	public static boolean DeleteSezioni(int id) {

		ConnessioneDB connessione = new ConnessioneDB();
		boolean done = false;
		try {
			connessione.connect();
			
			connessione.executeUpdate("DELETE FROM sezioni WHERE sezioni.id = " + id);

			connessione.close();
			done = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return done;
	}
	
	
	// QUERY GAETANO
	
	public static Sezione ReadOneByDocument(int idDoc) {
		Sezione sezione = null;
	
		ConnessioneDB connessione = new ConnessioneDB();

		try {
			connessione.connect();

			ResultSet set = connessione.executeQuery("Select * from sezioni where id_documento="+idDoc);

			if (set.next()) {
				int id = set.getInt("id");
				String iframe = set.getString("iframe");
				byte[] arrayTesto= set.getBytes("testo");
				String testo =  new String(arrayTesto, StandardCharsets.UTF_8);
				int id_documento = set.getInt("id_documento");
				sezione = new Sezione(id,iframe, testo, id_documento);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			sezione = null;
		}
		return sezione;
	}

}
