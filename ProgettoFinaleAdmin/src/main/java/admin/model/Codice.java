package admin.model;

public class Codice {

	private int id_codice;
	private String nome_codice;
	private String categoria_codice;

	private String codice;

	public Codice(int id_codice, String nome_codice, String categoria_codice, String codice) {
		super();
		this.id_codice = id_codice;
		this.nome_codice = nome_codice;
		this.categoria_codice = categoria_codice;
		this.codice = codice;
	}

	public Codice() {

	}
	
	public Codice(String codice) {

		this.codice = codice;
	}

	public Codice(int id_codice, String codice) {
		this.id_codice = id_codice;
		this.codice = codice;
	}

	public Codice(String categoria_codice, String codice) {
		this.categoria_codice = categoria_codice;
		this.codice = codice;
	}

	public int getId_codice() {
		return id_codice;
	}

	public void setId_codice(int id_codice) {
		this.id_codice = id_codice;
	}

	public String getNome_codice() {
		return nome_codice;
	}

	public void setNome_codice(String nome_codice) {
		this.nome_codice = nome_codice;
	}

	public String getCategoria_codice() {
		return categoria_codice;
	}

	public void setCategoria_codice(String categoria_codice) {
		this.categoria_codice = categoria_codice;
	}

	public String getCodice() {
		return codice;
	}

	public void setCodice(String codice) {
		this.codice = codice;
	}

	
	
}
