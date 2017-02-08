package it.univaq.disim.gosoftair.business.model;

import java.util.List;

public class PosizioneGiocatore implements java.io.Serializable {
	
	private double lat;
	private double lon;
	private Utente giocatore;
	
	public PosizioneGiocatore() {}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLon() {
		return lon;
	}

	public void setLon(double lon) {
		this.lon = lon;
	}

	public Utente getGiocatore() {
		return giocatore;
	}

	public void setGiocatore(Utente giocatore) {
		this.giocatore = giocatore;
	};
}
