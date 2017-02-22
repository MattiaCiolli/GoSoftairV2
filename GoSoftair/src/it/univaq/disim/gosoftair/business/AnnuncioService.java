package it.univaq.disim.gosoftair.business;

import it.univaq.disim.gosoftair.business.model.Annuncio;

import java.util.Date;
import java.util.List;

public interface AnnuncioService {
	
	void create(Annuncio annuncio) throws BusinessException;

	List<Annuncio> findLastAnnunci(Date oggi, int quantita) throws  BusinessException;
	List<Annuncio> findLastAnnunciByUserID (Date oggi, long userID) throws BusinessException;
	List<Annuncio> TuttiAnnunciCreatiDaMe(long idUtente);
	List<Annuncio> visualizzazioneBachecaAnnunci (Date oggi, long userID, int pageNum);
	double numAnnunci(Date ultimi6mesi);
    Annuncio findAnnuncioByPK(long id) throws BusinessException;
}
