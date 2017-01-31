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
            String sql = "INSERT INTO ANNUNCIO (ID, TITOLO, DESCRIZONE, IMMAGINE, PREZZO, NUMEROTELEFONO, EMAIL) VALUES (?,?,?,?,?,?,?,?)";
            st = con.prepareStatement(sql);
            st.setInt(1, 1);//idannuncio
            st.setString(2, annuncio.getTitolo());
            st.setString(3, annuncio.getDescrizione());
            st.setString(4, annuncio.getImmagine());
            st.setString(5, annuncio.getPrezzo());
            st.setString(6, annuncio.getNumeroTelefono());
            st.setString(7, annuncio.getEmail());
            st.setInt(8, 1);//idutente
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

