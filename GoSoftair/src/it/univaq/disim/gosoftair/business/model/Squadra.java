package it.univaq.disim.gosoftair.business.model;

import java.util.List;

public class Squadra implements java.io.Serializable {
	private List<Utente> partecipanti;

	public Squadra() {
		super();
	}

	public Squadra(List<Utente> partecipanti) {
		super();
		this.partecipanti = partecipanti;
	}

	public List<Utente> getPartecipanti() {
		return partecipanti;
	}

	public void setPartecipanti(List<Utente> partecipanti) {
		this.partecipanti = partecipanti;
	}
	
	public void aggiungiPartecipante(Utente utente) {
		this.partecipanti.add(utente);
	}
	
	public void rimuoviPartecipante(Utente utente) {
		this.partecipanti.remove(utente);
	}
}
