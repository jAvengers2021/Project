package heritage.model;

public class Commento {
	private int id;
	private String commento;
	private int id_utente;
	private int id_documento;
	private String data;
	
	public Commento(int id, String commento, int id_utente, int id_documento,String data) {
		this.id = id;
		this.commento = commento;
		this.id_utente = id_utente;
		this.id_documento = id_documento;
		this.data = data;
	}
	public Commento() {
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCommento() {
		return commento;
	}
	public void setCommento(String commento) {
		this.commento = commento;
	}
	public int getId_utente() {
		return id_utente;
	}
	public void setId_utente(int id_utente) {
		this.id_utente = id_utente;
	}
	public int getId_documento() {
		return id_documento;
	}
	public void setId_documento(int id_documento) {
		this.id_documento = id_documento;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}

	
}
