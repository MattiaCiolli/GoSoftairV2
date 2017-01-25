package it.univaq.disim.gosoftair.business.impl;

import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.EventoService;

public class JDBCGosoftairBusinessFactory extends GosoftairBusinessFactory {

	private static final String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	private static final String username ="sistemi";
	private static final String password = "sistemi";
		
	@Override
	public EventoService getEventoService()  {
		return new JDBCEventoService(url, username, password);
	} 
	
}
