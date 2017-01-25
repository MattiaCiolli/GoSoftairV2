package it.univaq.disim.gosoftair.business;

import java.util.List;

import it.univaq.disim.library.business.model.Title;
import it.univaq.disim.library.business.model.TitleKind;

public interface TitleService {
	
	void create(Title title) throws BusinessException;

	List<Title> findAllTitles() throws BusinessException;
	
	void delete(Title title) throws BusinessException;
	
	void update(Title title) throws BusinessException;
	
	Title findTitleByPK(long id) throws BusinessException;
	
	List<TitleKind> findAllTitleKinds() throws BusinessException;
	
}
