package admin.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class AdminRepository {


	public static Admin Read( String nome_admin, String password_admin) {

		
		ConnessioneDB connessione = new ConnessioneDB();

		Admin adminB=new Admin();
		try {
			connessione.connect();

			//SELECT partita.nome, partita.risultato FROM partita, utente WHERE partita.nome = utente.nome AND utente.nome

			
			ResultSet set = connessione.executeQuery("SELECT  admin.nome_admin, admin.password_admin FROM admin WHERE admin.nome_admin ="+"'"+nome_admin+"' AND admin.password_admin='"+password_admin+"'");

			
			while (set.next()) {

				nome_admin = set.getString("nome_admin");
				password_admin = set.getString("password_admin");
			
		
				 adminB= new Admin(nome_admin, password_admin);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		
		}

		connessione.close();

		return adminB;
	}
		
		public static List<Admin> ReadAll() {

			List<Admin> admins = new LinkedList<Admin>();

			ConnessioneDB connessione = new ConnessioneDB();

			try {
				connessione.connect();

				ResultSet set = connessione.executeQuery("Select * from admin");

				while (set.next()) {
					String nome_admin = set.getString("nome_admin");
					String password_admin= set.getString("password_admin");
					
			
					Admin adminB = new Admin(nome_admin,password_admin);
					admins.add(adminB);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				admins = null;
			}

			connessione.close();

			return admins;
		}

}
