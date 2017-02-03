package it.univaq.disim.gosoftair.business.impl;

import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.business.model.Utente;
import it.univaq.disim.gosoftair.business.BusinessException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Locale;
import java.util.Date;
import java.util.List;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class JDBCEventoService implements EventoService {
	private String url;
	private String username;
	private String password;
	
	public JDBCEventoService(String url, String username, String password) {
		super();
		this.url = url;
		this.username = username;
		this.password = password;
	}
	
	public void create(Evento evento) throws BusinessException {
	}
	
	public Evento findEventoByPK(long id) throws BusinessException {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(url, username, password);
			st = con.createStatement();
			rs = st.executeQuery("SELECT titolo, descrizione, data, puntoincontro, tipologia, nmaxpartecipanti, stato FROM evento WHERE id=" + id);
			if (rs.next()) {
				String titolo = rs.getString("titolo");
				String descrizione = rs.getString("descrizione");
				DateFormat format = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss.S", Locale.ITALIAN);
				Date data = new Date();
				try {
					data = format.parse(rs.getString("data"));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				String puntoIncontro = rs.getString("puntoincontro");
				String tipologia = rs.getString("tipologia");
				int numMaxPartecipanti = Integer.parseInt(rs.getString("nmaxpartecipanti"));
				int stato = Integer.parseInt(rs.getString("stato"));
				Evento evento = new Evento(titolo, descrizione, data, puntoIncontro, tipologia, numMaxPartecipanti, stato);
				return evento;
			}else{
				System.out.print("Il result set non ha elementi");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessException("Errore durante la creazione dell'evento",e);
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
	
	public List<Utente> creaSquadre(long idEvento){
    	Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(url, username, password);
			st = con.createStatement();
			rs = st.executeQuery("SELECT UTENTE.ID, UTENTE_EVENTO.NUMSQUADRA FROM UTENTE, UTENTE_EVENTO, EVENTO WHERE UTENTE.ID=UTENTE_EVENTO.IDUTENTE AND EVENTO.ID=UTENTE_EVENTO.IDEVENTO AND EVENTO.ID=" + idEvento);
			if (rs.next()) {
				long id = Long.parseLong((rs.getString("id")));
				String nome = rs.getString("nome");
				String cognome = rs.getString("cognome");
				String email = rs.getString("email");
				String nickname = rs.getString("nickname");
				String password = rs.getString("password");
				String documentoValido = rs.getString("documentovalido");
				String immagineProfilo = rs.getString("immagineprofilo");
				Utente utente = new Utente(id, nome, cognome, email, nickname, password, documentoValido, immagineProfilo);
				
			}else{
				System.out.print("Il result set non ha elementi");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessException("Errore durante la creazione dell'evento",e);
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
}
