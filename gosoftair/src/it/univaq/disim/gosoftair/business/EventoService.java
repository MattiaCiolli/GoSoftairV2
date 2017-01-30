package it.univaq.disim.gosoftair.business;

import java.util.List;
import it.univaq.disim.gosoftair.business.model.Evento;

public interface EventoService {
	
	void create(Evento evento) throws BusinessException;
	/*
	List<Title> findAllTitles() throws BusinessException;
	
	void delete(Title title) throws BusinessException;
	
	void update(Title title) throws BusinessException;
	*/
	Evento findTitleByPK(long id) throws BusinessException;
	
	//List<TitleKind> findAllTitleKinds() throws BusinessException;
	
	
	Evento moockObject() throws BusinessException;
}
