package it.univaq.disim.gosoftair.business.impl;

import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.BusinessException;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.business.model.Utente;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
    
    public Utente findUserByPK(long id) throws BusinessException {
    	Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(url, username, password);
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM gosoftair.UTENTE WHERE ID=" + id);
			if(rs.next()){
				String nome = rs.getString("nome");
				String cognome = rs.getString("cognome");
				String email = rs.getString("email");
				String nickname = rs.getString("nickname");
				String password = rs.getString("password");
				String documentoValido = rs.getString("documentovalido");
				String immagineProfilo = rs.getString("immagineprofilo");
				Utente utente = new Utente(id, nome, cognome, email, nickname, password, documentoValido, immagineProfilo);
				return utente;
			}else {
				System.out.print("Il result set non ha elementi");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessException("Errore durante la creazione dell'utente",e);
		} finally {
			if (rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {}
			}
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
		return null;
    }

    @Override
    public void update(Utente utente) throws BusinessException {
        Connection con = null;
        PreparedStatement st = null;
        try {
            con = DriverManager.getConnection(url, username, password);
            st = con.prepareStatement("update titles set nome=?, cognome=?, nickname=?, password=?, documentoValido=?, immagineProfilo=?, where id=?");
            st.setString(1, utente.getNome());
            st.setString(2, utente.getCognome());
            st.setString(3, title.getNickname());
            st.setString(4, title.getPassword());
            st.setString(5, title.getDocumentoValido());
            st.setString(6, title.getImmagineProfilo());

            st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new BusinessException(e);
        } finally {
            if (st != null) {
                try {
                    st.close();
                } catch (SQLException e) {
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                }
            }

        }
    }
}
