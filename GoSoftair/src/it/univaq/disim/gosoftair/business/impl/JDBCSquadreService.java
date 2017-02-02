package it.univaq.disim.gosoftair.business.impl;

import java.sql.Connection;
import java.sql.DriverManager;
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
				
				int squadra = Integer.parseInt(rs.getString("numsquadra"));
				
				if(squadra == 1) 
					squadre.addUtenteSquadra1(utente);
				else
					squadre.addUtenteSquadra2(utente);
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
		return squadre; 
	}
}
