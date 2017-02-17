package it.univaq.disim.gosoftair.business;

import it.univaq.disim.gosoftair.business.model.Utente;

/**
 * Created by Davide on 28/01/2017.
 */
public interface UtenteService {
    void create(Utente utente) throws BusinessException;
    void update(Utente Utente) throws BusinessException;
    Utente login(String nickname) throws BusinessException;
    Utente findUserByPK(long id) throws BusinessException;
    Utente userByEmail(String email) throws BusinessException;
}
