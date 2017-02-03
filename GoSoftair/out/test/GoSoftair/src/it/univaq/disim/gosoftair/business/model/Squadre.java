package it.univaq.disim.gosoftair.business.model;

import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.model.Utente;

import java.util.ArrayList;
import java.util.List;

public class Squadre implements java.io.Serializable {
	private long id;
	private List<Utente> squadra1;
	private List<Utente> squadra2;
	
	public Squadre() {
		super();
		this.squadra1 = new ArrayList<Utente>();
		this.squadra2 = new ArrayList<Utente>();
	}
	public Squadre(long id, List<Utente> squadra1, List<Utente> squadra2) {
		this.id = id;
		this.squadra1 = squadra1;
		this.squadra2 = squadra2;
	}
	
	public Squadre(List<Utente> squadra1, List<Utente> squadra2) {
		this.squadra1 = squadra1;
		this.squadra2 = squadra2;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public List<Utente> getSquadra1() {
		return squadra1;
	}

	public void setSquadra1(List<Utente> squadra1) {
		this.squadra1 = squadra1;
	}

	public List<Utente> getSquadra2() {
		return squadra2;
	}

	public void setSquadra2(List<Utente> squadra2) {
		this.squadra2 = squadra2;
	}
	
	public void addUtenteSquadra1(Utente utente) {
		this.squadra1.add(utente);
	}
	
	public void addUtenteSquadra2(Utente utente) {
		this.squadra2.add(utente);
	}
}
