package it.univaq.disim.gosoftair.business.model;

import java.util.Date;
import java.util.List;

public class Evento implements java.io.Serializable {
	private long id;
	private String titolo;
	private String descrizione;
	private Date data;
	private String puntoIncontro;
	private String tipologia;
	private int numMaxPartecipanti;
	private int stato;
	private Utente organizzatore;
	private List<Post> posts;
	private Squadre squadre;
	private String immagine;



	public Evento() {
		super();
	}
	
	public Evento(long id, String titolo, String descrizione, Date data, String puntoIncontro, String tipologia, int numMaxPartecipanti, int stato) {
		super();
		this.id = id;
		this.titolo = titolo;
		this.descrizione = descrizione;
		this.data = data;
		this.puntoIncontro = puntoIncontro;
		this.tipologia = tipologia;
		this.numMaxPartecipanti = numMaxPartecipanti;
		this.setStato(stato);
	}

	public Evento(long id, String titolo, String descrizione, Date data, String puntoIncontro, String tipologia, int numMaxPartecipanti, int stato, String immagine) {
		super();
		this.id = id;
		this.titolo = titolo;
		this.descrizione = descrizione;
		this.data = data;
		this.puntoIncontro = puntoIncontro;
		this.tipologia = tipologia;
		this.numMaxPartecipanti = numMaxPartecipanti;
		this.setStato(stato);
		this.immagine = immagine;
	}

	//costruttore con immagine, non ho voluto metterlo nel costruttore di sotto perche non so se qualcuno di voi lo stava usando
	public Evento(String titolo, String descrizione, Date data, String puntoIncontro, String tipologia, int numMaxPartecipanti, int stato, String immagine, Utente organizzatore) {
		super();
		this.titolo = titolo;
		this.descrizione = descrizione;
		this.data = data;
		this.puntoIncontro = puntoIncontro;
		this.tipologia = tipologia;
		this.numMaxPartecipanti = numMaxPartecipanti;
		this.setStato(stato);
		this.immagine = immagine;
		this.organizzatore = organizzatore;
	}
	
	public Evento(String titolo, String descrizione, Date data, String puntoIncontro, String tipologia, int numMaxPartecipanti, int stato) {
		super();
		this.titolo = titolo;
		this.descrizione = descrizione;
		this.data = data;
		this.puntoIncontro = puntoIncontro;
		this.tipologia = tipologia;
		this.numMaxPartecipanti = numMaxPartecipanti;
		this.setStato(stato);
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

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public String getPuntoIncontro() {
		return puntoIncontro;
	}

	public void setPuntoIncontro(String puntoIncontro) {
		this.puntoIncontro = puntoIncontro;
	}

	public String getTipologia() {
		return tipologia;
	}

	public void setTipologia(String tipologia) {
		this.tipologia = tipologia;
	}

	public int getNumMaxPartecipanti() {
		return numMaxPartecipanti;
	}

	public void setNumMaxPartecipanti(int numMaxPartecipanti) {
		this.numMaxPartecipanti = numMaxPartecipanti;
	}

	public int getStato() {
		return stato;
	}

	public void setStato(int stato) {
		this.stato = stato;
	}

	public List<Post> getPosts() {
		return posts;
	}

	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}
	
	public void addPost(Post post) {
		this.posts.add(post);
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Utente getOrganizzatore() {
		return organizzatore;
	}

	public void setOrganizzatore(Utente organizzatore) {
		this.organizzatore = organizzatore;
	}

	public Squadre getSquadre() {
		return squadre;
	}

	public void setSquadre(Squadre squadre) {
		this.squadre = squadre;
	}

	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}
}
