package it.univaq.disim.gosoftair.business;

import it.univaq.disim.gosoftair.business.model.Annuncio;

public interface AnnuncioService {
	
	void create(Annuncio annuncio) throws BusinessException;
	
}
