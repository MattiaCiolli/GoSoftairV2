package it.univaq.disim.gosoftair.business.model;

public class Annuncio implements java.io.Serializable {
	private String titolo;
	private String descrizione;
	private String immagine;
	private String prezzo;
	private String numeroTelefono;
	private String email;
	private Integer idutente;
	
	public Integer getIdUtente() {
		return idutente;
	}

	public void setIdUtente(Integer idutente) {
		this.idutente = idutente;
	}

	public Annuncio() {
		super();
	}

	public Annuncio(String titolo, String descrizione, String immagine, String prezzo, String numeroTelefono, String email, Integer idutente) {
		super();
		this.titolo = titolo;
		this.descrizione = descrizione;
		this.immagine = immagine;
		this.prezzo = prezzo;
		this.numeroTelefono = numeroTelefono;
		this.email = email;
		this.idutente = idutente;
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
}
