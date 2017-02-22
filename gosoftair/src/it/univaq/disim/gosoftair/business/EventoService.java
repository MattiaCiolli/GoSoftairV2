package it.univaq.disim.gosoftair.business;

import java.util.Date;
import java.util.List;
import it.univaq.disim.gosoftair.business.model.Evento;

public interface EventoService {
	
	void create(Evento evento) throws BusinessException;
	
	void delete(long id) throws BusinessException;
	
	void update(Evento title) throws BusinessException;
	
	Evento findEventoByPK(long id) throws BusinessException;

	List<Evento> findUltimiByUserID (Date oggi, long id) throws BusinessException;
	
	//List<TitleKind> findAllTitleKinds() throws BusinessException;

	List<Evento> findLastEvent(Date oggi, int quantita) throws BusinessException;

	List<Evento> findAllMySubscription(Date oggi, long idUtente);

	List<Evento> trovaTuttePartiteCreateDaMe(long idUtente);
	
	List<Evento> visualizzazioneBachecaPartite (Date oggi, long userID, int pageNum) throws BusinessException;
	
	double numEventi(Date ultimi6mesi);
	
	void activeEvent(long idEvento) throws BusinessException;
}
