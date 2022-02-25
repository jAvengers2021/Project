package heritage.model;

public class Sezione {

	private int id;
	private String iframe;
	private String testo;
	private int id_documento;
	
	public Sezione(int id, String iframe, String testo, int id_documento) {
		this.id = id;
		this.iframe = iframe;
		this.testo = testo;
		this.id_documento = id_documento;
	}
	public Sezione() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIframe() {
		return iframe;
	}
	public void setIframe(String iframe) {
		this.iframe = iframe;
	}
	public String getTesto() {
		return testo;
	}
	public void setTesto(String testo) {
		this.testo = testo;
	}
	public int getId_documento() {
		return id_documento;
	}
	public void setId_documento(int id_documento) {
		this.id_documento = id_documento;
	}
	
	public String resizeTesto(String testo) {
		if(testo.length() > 300)
		return testo.substring(0, 300)+"...";
		else if(testo.length() <=300 && testo.length() > 100)
		return testo.substring(0, 100)+"...";
		else
		return testo;
	}

	
}
