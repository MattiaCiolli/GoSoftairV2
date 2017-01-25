package it.univaq.disim.gosoftair.business.model;

public class Evento implements java.io.Serializable {

	private String titolo;
	private String descrizione;
	private float data;
	private String puntoIncontro;
	private String tipologia;
	private int numMaxPartecipanti;
	
	public Evento() { 
		super();
	}
	
	public Evento(String titolo, String descrizione, float data, String puntoIncontro, String tipologia, int numMaxPartecipanti) { 
		super();
		this.titolo = titolo;
		this.descrizione = descrizione;
		this.data = data;
		this.puntoIncontro = puntoIncontro;
		this.tipologia = tipologia;
		this.numMaxPartecipanti = numMaxPartecipanti;
	}
}
