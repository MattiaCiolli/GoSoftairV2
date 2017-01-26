package it.univaq.disim.gosoftair.business.model;

public class Evento implements java.io.Serializable {
	private String titolo;
	private String descrizione;
	private float data;
	private float ora;
	private String puntoIncontro;
	private String tipologia;
	private int numMaxPartecipanti;
	private int stato;
	private Squadra squadra1;
	private Squadra squadra2;
	private Forum forum;
	
	public Evento() { 
		super();
	}
	
	public Evento(String titolo, String descrizione, float data,float ora, String puntoIncontro, String tipologia, int numMaxPartecipanti, int stato) {
		super();
		this.titolo = titolo;
		this.descrizione = descrizione;
		this.data = data;
		this.ora=ora;
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

	public float getData() {
		return data;
	}

	public float getOra() {
		return ora;
	}

	public void setData(float data) {
		this.data = data;
	}

	public void setOra(float ora) {
		this.ora = ora;
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

	public Squadra getSquadra1() {
		return squadra1;
	}

	public void setSquadra1(Squadra squadra1) {
		this.squadra1 = squadra1;
	}

	public Squadra getSquadra2() {
		return squadra2;
	}

	public void setSquadra2(Squadra squadra2) {
		this.squadra2 = squadra2;
	}

	public Forum getForum() {
		return forum;
	}

	public void setForum(Forum forum) {
		this.forum = forum;
	}
}
