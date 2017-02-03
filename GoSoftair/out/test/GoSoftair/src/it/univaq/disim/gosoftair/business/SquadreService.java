package it.univaq.disim.gosoftair.business;

import it.univaq.disim.gosoftair.business.model.Squadre;

public interface SquadreService {
	Squadre cercaSquadreByEventoPK(long id) throws BusinessException;
	void scegliSquadra(long idUtente, int numSquadra) throws BusinessException;
}
