package it.univaq.disim.gosoftair.business.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import it.univaq.disim.gosoftair.business.BusinessException;
import it.univaq.disim.gosoftair.business.SquadreService;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.business.model.Squadre;
import it.univaq.disim.gosoftair.business.model.Utente;

public class JDBCSquadreService implements SquadreService {
	private String url;
	private String username;
	private String password;
	
	public JDBCSquadreService(String url, String username, String password) {
		super();
		this.url = url;
		this.username = username;
		this.password = password;
	}
	
	public Squadre cercaSquadreByEventoPK(long id) throws BusinessException {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Squadre squadre = new Squadre();
		try {
			con = DriverManager.getConnection(url, username, password);
			st = con.createStatement();
			rs = st.executeQuery("SELECT utente.*, utente_evento.ID, utente_evento.numsquadra FROM utente, utente_evento, evento WHERE utente.id=utente_evento.idutente AND evento.id=utente_evento.idevento AND evento.id=" + id);
			while(rs.next()) {
				String nome = rs.getString("nome");
				String cognome = rs.getString("cognome");
				String email = rs.getString("email");
				String nickname = rs.getString("nickname");
				String password = rs.getString("password");
				String documentoValido = rs.getString("documentovalido");
				String immagineProfilo = rs.getString("immagineprofilo");
				Utente utente = new Utente(id, nome, cognome, email, nickname, password, documentoValido, immagineProfilo);
				
				int numSquadra = Integer.parseInt(rs.getString("numsquadra"));
				
				if(numSquadra == 1) 
					squadre.addUtenteSquadra1(utente);
				else
					squadre.addUtenteSquadra2(utente);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessException("Errore durante la ricerca dell'evento",e);
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
		return squadre; 
	}
	
	public void scegliSquadra(long idUtente, int numSquadra, long idEvento) throws BusinessException {
		Connection con = null;
        PreparedStatement st = null;
        try {
            con = DriverManager.getConnection(url, username, password);
			String sql = "MERGE INTO utente_evento a USING (SELECT ? numsquadra, ? idutente, ? idevento FROM dual) incoming ON (a.idutente = incoming.idutente AND a.idevento = incoming.idevento) WHEN MATCHED THEN UPDATE SET a.numsquadra=incoming.numsquadra WHEN NOT MATCHED THEN INSERT (a.id, a.numsquadra, a.idutente, a.idevento) VALUES (INCREMENTIDUTENTE_EVENTO.NEXTVAL, incoming.numsquadra, incoming.idutente, incoming.idevento)";
            st = con.prepareStatement(sql);
			st.setInt(1, numSquadra);
			st.setLong(2, idUtente);
			st.setLong(3, idEvento);
			st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new BusinessException("Errore durante aggiornamento della squadra", e);
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
	
	public void deleteSquadreByIdEvent(long idEvento) throws BusinessException {
		Connection con = null;
        PreparedStatement st = null;
        try {   	
        	con = DriverManager.getConnection(url, username, password);
            st = con.prepareStatement("DELETE FROM utente_evento WHERE idEvento=?");
            st.setLong(1, idEvento);
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
	
	public void esciDallaSquadra(long idEvento, long idUtente) throws BusinessException {
		Connection con = null;
        PreparedStatement st = null;
        try {   	
        	con = DriverManager.getConnection(url, username, password);
            st = con.prepareStatement("DELETE FROM utente_evento WHERE idEvento=? AND idUtente=?");
            st.setLong(1, idEvento);
            st.setLong(2, idUtente);
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
