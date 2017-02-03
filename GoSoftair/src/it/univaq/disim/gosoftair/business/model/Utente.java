package it.univaq.disim.gosoftair.business.model;

import java.util.List;

public class Utente implements java.io.Serializable {
	private long id;
	private String nome;
	private String cognome;
	private String email;
	private String nickname;
	private String password;
	private String documentoValido;
	private String immagineProfilo;
	private List<Annuncio> annunci;
	private List<Evento> eventi;
	
	public Utente() {
		super();
	}
	
	public Utente(long id, String nome, String cognome, String email, String nickname, String password, String documentoValido, String immagineProfilo) {
		super();
		this.id = id;
		this.nome = nome;
		this.cognome = cognome;
		this.email = email;
		this.nickname = nickname;
		this.password = password;
		this.documentoValido = documentoValido;
		this.immagineProfilo = immagineProfilo;
	}
	
	public Utente(String nome, String cognome, String email, String nickname, String password, String documentoValido, String immagineProfilo) {
		super();
		this.nome = nome;
		this.cognome = cognome;
		this.email = email;
		this.nickname = nickname;
		this.password = password;
		this.documentoValido = documentoValido;
		this.immagineProfilo = immagineProfilo;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDocumentoValido() {
		return documentoValido;
	}

	public void setDocumentoValido(String documentoValido) {
		this.documentoValido = documentoValido;
	}

	public String getImmagineProfilo() {
		return immagineProfilo;
	}

	public void setImmagineProfilo(String immagineProfilo) {
		this.immagineProfilo = immagineProfilo;
	}

	public List<Annuncio> getAnnunci() {
		return annunci;
	}

	public void setAnnunci(List<Annuncio> annunci) {
		this.annunci = annunci;
	}

	public List<Evento> getEventi() {
		return eventi;
	}

	public void setEventi(List<Evento> eventi) {
		this.eventi = eventi;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
}
