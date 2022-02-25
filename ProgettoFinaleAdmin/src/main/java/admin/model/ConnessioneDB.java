package admin.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnessioneDB {
	
	//Parametri di Configurazione
	private static final String HOST =  "jdbc:mysql://localhost:3306/";
	private static final String DATABASE =  "heritagedb";
	private static final String USERNAME =  "root";
	private static final String PASSWORD =  "";
	private static final String DRIVER =  "com.mysql.jdbc.Driver";
	
	private Connection connection = null;


	public void connect() throws SQLException{ 
		try {
			Class.forName(DRIVER); 
		} catch (ClassNotFoundException e) { 
			e.printStackTrace();
		}  
		connection = DriverManager.getConnection(HOST + DATABASE, USERNAME, PASSWORD);
	}
	
	public ResultSet executeQuery(String sql) throws SQLException{ 
		Statement st = connection.createStatement(); 
		ResultSet set = st.executeQuery(sql);
		return set; 
	}

	public boolean executeUpdate(String sql)throws SQLException { 
		Statement st = connection.createStatement(); 
		boolean done = st.execute(sql);
		return done; 
	}
	
	public void close() {
		try {
			connection.close();
		} catch (SQLException e) { 
			e.printStackTrace();
		}
	}
	
	
	
}
