package admin.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class CodiceRepository {

	public static boolean Create(String nome_codice, String categoria_codice, String codice) {

		ConnessioneDB connessione = new ConnessioneDB();
		boolean done = false;
		try {
			connessione.connect();

			connessione.executeUpdate(
					"INSERT INTO `codici` (`id_codice`,`nome_codice`,`categoria_codice`, `codice`) VALUES (NULL, '"
							+ nome_codice + "','" + categoria_codice + "','" + codice + "')");
			connessione.close();
			done = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return done;
	}

	public static boolean Delete(Codice codice) {

		ConnessioneDB connessione = new ConnessioneDB();
		boolean done = false;
		try {
			connessione.connect();

			if (codice.getId_codice() != -1) {
				// DELETE FROM `bestemmie` WHERE `bestemmie`.`id_bestemmia` = 3
				done = connessione
						.executeUpdate("DELETE FROM codici WHERE codici.id_codici = " + codice.getId_codice());
			}

			connessione.close();
			done = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return done;
	}

	public static List<Codice> ReadAll() {

		List<Codice> codici = new LinkedList<Codice>();

		ConnessioneDB connessione = new ConnessioneDB();

		try {
			connessione.connect();

			ResultSet set = connessione.executeQuery("Select * from codici");

			while (set.next()) {
				int id_codice = set.getInt("id_codice");
				String nome_codice = set.getString("nome_codice");
				String categoria_codice = set.getString("categoria_codice");
				String codice = set.getString("codice");

				Codice codiceB = new Codice(id_codice, nome_codice, categoria_codice, codice);
				codici.add(codiceB);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			codici = null;
		}

		connessione.close();

		return codici;
	}

	public static List<Codice> Read(String codice) {

		List<Codice> codici = new LinkedList<Codice>();

		ConnessioneDB connessione = new ConnessioneDB();

		try {
			connessione.connect();

			// SELECT partita.nome, partita.risultato FROM partita, utente WHERE
			// partita.nome = utente.nome AND utente.nome

			ResultSet set = connessione
					.executeQuery("SELECT codici.id_codice FROM codici WHERE codici.codice =" + "'" + codice + "'");

			while (set.next()) {
				int id_codice = set.getInt("id_codice");
				codice = set.getString("codice");

				Codice codiceB = new Codice(id_codice, codice);
				codici.add(codiceB);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			codici = null;
		}

		connessione.close();

		return codici;
	}

	public static Codice ReadId(int id_codice) {

		Codice codice = null;

		ConnessioneDB connessione = new ConnessioneDB();

		try {
			connessione.connect();
			ResultSet set = connessione.executeQuery("SELECT * from codici where id_codice = " + id_codice);

			if (set.next()) {
				String codice2 = set.getString("codice");
				codice = new Codice(id_codice, codice2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		connessione.close();

		return codice;
	}

	public static List<Codice> ReadCategoria(String categoria_codice) {

		List<Codice> codici = new LinkedList<Codice>();

		ConnessioneDB connessione = new ConnessioneDB();

		try {
			connessione.connect();
			// SELECT * FROM `codici` WHERE `categoria_codice` LIKE 'pop'
			ResultSet set = connessione
					.executeQuery("SELECT * from codici where categoria_codice = " + "'" + categoria_codice + "'");

			while (set.next()) {

				String codice2 = set.getString("codice");

				codici.add(new Codice(categoria_codice, codice2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		connessione.close();

		return codici;
	}

}
