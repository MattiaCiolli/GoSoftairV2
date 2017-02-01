package it.univaq.disim.gosoftair.business.model;

public class Post implements java.io.Serializable {
	private long id;
	private Utente utente;
	private String messaggio;
	private Float data;
	private Float orario;
	
	public Post() {
		super();
	}

	public Post(long id, Utente utente, String messaggio, Float data, Float orario) {
		super();
		this.id = id;
		this.utente = utente;
		this.messaggio = messaggio;
		this.data = data;
		this.orario = orario;
	}
	
	public Post(Utente utente, String messaggio, Float data, Float orario) {
		super();
		this.utente = utente;
		this.messaggio = messaggio;
		this.data = data;
		this.orario = orario;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

	public String getMessaggio() {
		return messaggio;
	}

	public void setMessaggio(String messaggio) {
		this.messaggio = messaggio;
	}

	public Float getData() {
		return data;
	}

	public void setData(Float data) {
		this.data = data;
	}

	public Float getOrario() {
		return orario;
	}

	public void setOrario(Float orario) {
		this.orario = orario;
	}
}
