package it.univaq.disim.gosoftair.business.impl;

import it.univaq.disim.gosoftair.business.AnnuncioService;
import it.univaq.disim.gosoftair.business.BusinessException;
import it.univaq.disim.gosoftair.business.model.Annuncio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class JDBCAnnuncioService implements AnnuncioService{
    private String url;
    private String username;
    private String password;

    public JDBCAnnuncioService(String url, String username, String password) {
        super();
        this.url = url;
        this.username = username;
        this.password = password;
    }
    

    public void create(Annuncio annuncio){
        Connection con = null;
        PreparedStatement st = null;
        try {
            con = DriverManager.getConnection(url, username, password);
            String sql = "INSERT INTO ANNUNCIO (ID, TITOLO, DESCRIZIONE, IMMAGINE, PREZZO, NUMEROTELEFONO, EMAIL, IDUTENTE) VALUES (INCREMENTIDANNUNCIO.NEXTVAL,?,?,?,?,?,?,?)";
            st = con.prepareStatement(sql);
    
            st.setString(1, annuncio.getTitolo());
            st.setString(2, annuncio.getDescrizione());
            st.setString(3, annuncio.getImmagine());
            st.setString(4, annuncio.getPrezzo());
            st.setString(5, annuncio.getNumeroTelefono());
            st.setString(6, annuncio.getEmail());
            st.setLong(7, annuncio.getInsertore().getId());//idutente
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new BusinessException("Errore durante la creazione dell'annuncio",e);
        } finally {
            if (st!=null) {
                try {
                    st.close();
                } catch (SQLException e) {}
            }
            if (con!=null) {
                try {
                    con.close();
                } catch (SQLException e) {}
            }

        }

    }
}

