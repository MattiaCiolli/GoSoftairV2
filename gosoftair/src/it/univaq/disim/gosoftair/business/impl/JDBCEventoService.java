package it.univaq.disim.gosoftair.business.impl;

import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.business.BusinessException;

public class JDBCEventoService implements EventoService{
	
	public Evento moockObject() throws BusinessException {
		Evento prova = new Evento("titolo", "descrizione", 356, " puntoIncontro", " tipologia", 1000);
		return prova;
	}
}
