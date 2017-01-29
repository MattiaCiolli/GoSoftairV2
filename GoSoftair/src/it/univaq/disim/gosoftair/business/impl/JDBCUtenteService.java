package it.univaq.disim.gosoftair.business.impl;

import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.BusinessException;
import it.univaq.disim.gosoftair.business.model.Utente;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class JDBCUtenteService implements UtenteService{
    private String url;
    private String username;
    private String password;

    public JDBCUtenteService(String url, String username, String password) {
        super();
        this.url = url;
        this.username = username;
        this.password = password;
    }

    public void create(Utente utente){
        Connection con = null;
        PreparedStatement st = null;
        try {
            con = DriverManager.getConnection(url, username, password);
            String sql = "INSERT INTO utente (id, nome, cognome, email, nickname, password, documentovalido, immagineprofilo) VALUES (INCREMENTIDUTENTE.NEXTVAL,?,?,?,?,?,?,?)";
            st = con.prepareStatement(sql);
            st.setString(1, utente.getNome());
            st.setString(2, utente.getCognome());
            st.setString(3, utente.getEmail());
            st.setString(4, utente.getNickname());
            st.setString(5, utente.getPassword());
            st.setString(6, utente.getDocumentoValido());
            st.setString(7, utente.getImmagineProfilo());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new BusinessException("Errore durante la creazione dell'utente",e);
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
