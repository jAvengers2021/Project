package admin.model;

public class Sezione {

	private int id;
	private String iframe;
	private String testo;
	private int id_documento;

	public Sezione(int id, String iframe, String testo, int id_documento) {
		super();
		this.id = id;
		this.iframe = iframe;
		this.testo = testo;
		this.id_documento = id_documento;
	}

	public Sezione() {
	}
	

	public Sezione(int id,  String iframe,String testo) {
		this.id = id;
		this.iframe = iframe;
		this.testo = testo;
	}

	public Sezione(int id, String iframe) {
		this.id = id;
		this.iframe = iframe;
	}

	public Sezione(String testo, String iframe) {
		this.testo = testo;
		this.iframe = iframe;
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

}
