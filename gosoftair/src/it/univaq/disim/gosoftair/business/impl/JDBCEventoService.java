package it.univaq.disim.gosoftair.business.impl;

import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.business.BusinessException;

public class JDBCEventoService implements EventoService {
	private String url;
	private String username;
	private String password;
	
	public JDBCEventoService(String url, String username, String password) {
		super();
		this.url = url;
		this.username = username;
		this.password = password;
	}
	public Evento moockObject() throws BusinessException {
		Evento prova = new Evento("titolo", "descrizione", 356, 18, " puntoIncontro", " tipologia", 1000);
		return prova;
	}
	
}
