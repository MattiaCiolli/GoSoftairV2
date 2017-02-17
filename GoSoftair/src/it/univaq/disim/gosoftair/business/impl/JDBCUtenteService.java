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


    //funzione che consente la registrazione dell'utente
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

  //funzione che consente di trovare all'interno del database tramite la sua email un utente
    public Utente login(String nickname) throws BusinessException {
    	Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(url, username, password);
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM gosoftair.UTENTE WHERE NICKNAME='" + nickname + "'");
			if(rs.next()){
				Long id = rs.getLong("id");
				String nome = rs.getString("nome");
				String cognome = rs.getString("cognome");
				String email = rs.getString("email");
				String nick = rs.getString("nickname");
				String password = rs.getString("password");
				String documentoValido = rs.getString("documentoValido");
				String immagineProfilo = rs.getString("immagineProfilo");
				Utente utente = new Utente(id, nome, cognome, email, nick, password, documentoValido, immagineProfilo);
				return utente;
			}else {
				System.out.print("Utente non esistente");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessException("Errore durante la ricerca dell'utente",e);
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
    
    //funzione che consente di trovare all'interno del database tramite la sua chiave privata l'utente con tutte le sue informazioni
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
				String documentoValido = rs.getString("documentoValido");
				String immagineProfilo = rs.getString("immagineProfilo");
				Utente utente = new Utente(id, nome, cognome, email, nickname, password, documentoValido, immagineProfilo);
				return utente;
			}else {
				System.out.print("Il result set non ha elementi");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessException("Errore durante la ricerca dell'utente",e);
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




    // funzione che modifica alcune informazioni nel profilo dell'utente, tra i quali la password
    @Override
    public void update(Utente utente) throws BusinessException {
        Connection con = null;
        PreparedStatement st = null;
        try {   	
        	con = DriverManager.getConnection(url, username, password);
            st = con.prepareStatement("UPDATE utente SET nome=?, cognome=?, nickname=?,email=?, password=?, documentoValido=?, immagineProfilo=? WHERE id=?");
            st.setString(1, utente.getNome());
            st.setString(2, utente.getCognome());
            st.setString(3, utente.getNickname());
            st.setString(4, utente.getEmail());
            st.setString(5, utente.getPassword());
            st.setString(6, utente.getDocumentoValido());
            st.setString(7, utente.getImmagineProfilo());
            st.setLong(8, utente.getId());
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
