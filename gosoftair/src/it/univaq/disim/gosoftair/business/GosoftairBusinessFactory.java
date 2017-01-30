package it.univaq.disim.gosoftair.business;

import it.univaq.disim.gosoftair.business.impl.JDBCGosoftairBusinessFactory;

public abstract class GosoftairBusinessFactory {
	
	public abstract EventoService getEventoService();
	
	public static GosoftairBusinessFactory getInstance() {
		return new JDBCGosoftairBusinessFactory();
	}
}
