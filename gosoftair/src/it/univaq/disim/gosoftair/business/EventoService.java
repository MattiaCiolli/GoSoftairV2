package it.univaq.disim.gosoftair.business;

import java.util.Date;
import java.util.List;
import it.univaq.disim.gosoftair.business.model.Evento;

public interface EventoService {
	
	void create(Evento evento) throws BusinessException;
	/*
	List<Title> findAllTitles() throws BusinessException;
	
	void delete(Title title) throws BusinessException;
	
	void update(Title title) throws BusinessException;
	*/
	Evento findEventoByPK(long id) throws BusinessException;

	List<Evento> findUltimiByUserID (Date oggi, long id) throws BusinessException;
	
	//List<TitleKind> findAllTitleKinds() throws BusinessException;

	List<Evento> findLastEvent(Date oggi, int quantita) throws BusinessException;

	List<Evento> findAllMySubscription(Date oggi, long idUtente);

	List<Evento> trovaTuttePartiteCreateDaMe(long idUtente);
	
	void activeEvent(long idEvento) throws BusinessException;
}
