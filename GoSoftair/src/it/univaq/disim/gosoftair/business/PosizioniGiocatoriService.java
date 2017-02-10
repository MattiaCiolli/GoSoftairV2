package it.univaq.disim.gosoftair.business;

import java.util.List;

import it.univaq.disim.gosoftair.business.model.PosizioneGiocatore;

public interface PosizioniGiocatoriService {
	void update(PosizioneGiocatore posizione) throws BusinessException;
	List<PosizioneGiocatore> posizioniAggiornate(long idEvento, long numSquadra) throws BusinessException;
}
