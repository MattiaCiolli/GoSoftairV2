package it.univaq.disim.gosoftair.business.model;

import java.util.Date;

public class Annuncio implements java.io.Serializable {
	private long id;
	private String titolo;
	private String descrizione;
	private String immagine;
	private String prezzo;
	private String numeroTelefono;
	private String email;
	private Utente insertore;
	private Date datainserzione;

	public Annuncio() {
		super();
	}
	
	public Annuncio(long id, String titolo, String descrizione, String immagine, String prezzo, String numeroTelefono, String email, Utente insertore) {
		super();
		this.id = id;
		this.titolo = titolo;
		this.descrizione = descrizione;
		this.immagine = immagine;
		this.prezzo = prezzo;
		this.numeroTelefono = numeroTelefono;
		this.email = email;
		this.insertore = insertore;
	}
	
	public Annuncio(String titolo, String descrizione, String immagine, String prezzo, String numeroTelefono, String email, Utente insertore, Date datains) {
		super();
		this.titolo = titolo;
		this.descrizione = descrizione;
		this.immagine = immagine;
		this.prezzo = prezzo;
		this.numeroTelefono = numeroTelefono;
		this.email = email;
		this.insertore = insertore;
		this.datainserzione = datains;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Date getDatainserzione() {
		return datainserzione;
	}

	public void setDatainserzione(Date datainserzione) {
		this.datainserzione = datainserzione;
	}
	
	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}

	public String getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(String prezzo) {
		this.prezzo = prezzo;
	}

	public String getNumeroTelefono() {
		return numeroTelefono;
	}

	public void setNumeroTelefono(String numeroTelefono) {
		this.numeroTelefono = numeroTelefono;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public Utente getInsertore() {
		return insertore;
	}

	public void setInsertore(Utente insertore) {
		this.insertore = insertore;
	}
}
