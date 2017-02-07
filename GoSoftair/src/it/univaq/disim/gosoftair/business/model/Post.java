package it.univaq.disim.gosoftair.business.model;

import java.util.Date;

public class Post implements java.io.Serializable {
	private long id;
	private Utente utente;
	private String messaggio;
	private Date data;
	
	public Post() {
		super();
	}

	public Post(Utente utente, String messaggio, Date data) {
		super();
		this.utente = utente;
		this.messaggio = messaggio;
		this.data = data;
	}
	
	public Post(long id, Utente utente, String messaggio, Date data) {
		super();
		this.id = id;
		this.utente = utente;
		this.messaggio = messaggio;
		this.data = data;
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

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
}

