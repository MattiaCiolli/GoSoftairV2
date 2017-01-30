package it.univaq.disim.gosoftair.business;

import it.univaq.disim.gosoftair.business.model.Utente;

public interface UtenteService {
	void create(Utente utente) throws BusinessException;
}
