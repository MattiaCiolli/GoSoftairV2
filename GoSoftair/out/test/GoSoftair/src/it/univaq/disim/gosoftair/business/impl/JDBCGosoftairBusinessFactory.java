package it.univaq.disim.gosoftair.business.impl;

import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;

import it.univaq.disim.gosoftair.business.AnnuncioService;
import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.SquadreService;

public class JDBCGosoftairBusinessFactory extends GosoftairBusinessFactory {

	private static final String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	private static final String username ="gosoftair";
	private static final String password = "gosoftair";
		
	@Override
	public EventoService getEventoService() {
		return new JDBCEventoService(url, username, password);
	}

	@Override
	public UtenteService getUtenteService() { 
		return new JDBCUtenteService(url, username, password); 
	}
	
	@Override
	public AnnuncioService getAnnuncioService() { 
		return new JDBCAnnuncioService(url, username, password); 
	}
	
	@Override 
	public SquadreService getSquadreService() {
		return new JDBCSquadreService(url, username, password);
	}
}
