package admin.model;

public class Admin {

	private String nome_admin;
	private String password_admin;
	
	public Admin(String nome_admin, String password_admin) {
		super();
		this.nome_admin = nome_admin;
		this.password_admin = password_admin;
	}
	
	

	public Admin() {
	
	}
	
	public Admin(String nome_admin) {
		this.nome_admin = nome_admin;
	}

	public String getNome_admin() {
		return nome_admin;
	}

	public void setNome_admin(String nome_admin) {
		this.nome_admin = nome_admin;
	}

	public String getPassword_admin() {
		return password_admin;
	}

	public void setPassword_admin(String password_admin) {
		this.password_admin = password_admin;
	}
	
	
}
