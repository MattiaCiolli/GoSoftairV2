package it.univaq.disim.gosoftair.business.model;

import java.util.List;

public class PosizioneGiocatore implements java.io.Serializable {
	
	private double lat;
	private double lon;
	private long idGiocatore;
	private String immagineMappa;
	
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

	public long getIdGiocatore() {
		return idGiocatore;
	}

	public void setGiocatore(long idGiocatore) {
		this.idGiocatore = idGiocatore;
	}

	public String getImmagineMappa() {
		return immagineMappa;
	}

	public void setImmagineMappa(String immagineMappa) {
		this.immagineMappa = immagineMappa;
	}

	public void setIdGiocatore(long idGiocatore) {
		this.idGiocatore = idGiocatore;
	}

	public String toString() {
		return "{\"idGiocatore\":" + this.idGiocatore + ", \"lat\":" + this.lat + ", \"lon\":" + this.lon + ", \"immagine\":\"" + this.immagineMappa +  "\"}";
	}
}
