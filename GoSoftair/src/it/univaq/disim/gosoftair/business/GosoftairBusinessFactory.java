package it.univaq.disim.gosoftair.business;

import it.univaq.disim.gosoftair.business.impl.JDBCGosoftairBusinessFactory;

public abstract class GosoftairBusinessFactory {
	
	public abstract EventoService getEventoService();

	public abstract UtenteService getUtenteService();
	
	public abstract AnnuncioService getAnnuncioService();
	
	public abstract SquadreService getSquadreService();
	
	public abstract PostService getPostService();
	
	public static GosoftairBusinessFactory getInstance() {
		return new JDBCGosoftairBusinessFactory();
	}
}
