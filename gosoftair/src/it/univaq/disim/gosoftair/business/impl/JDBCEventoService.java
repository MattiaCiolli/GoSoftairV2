package it.univaq.disim.gosoftair.business.impl;

import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.business.model.Squadra;
import it.univaq.disim.gosoftair.business.BusinessException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Date;
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
	public Evento moockObject() throws BusinessException {
		Date date = new Date();
		Evento prova = new Evento("titolo", "descrizione", date, " puntoIncontro", " tipologia", 1000, 0);
		return prova;
	}
	
	public void create(Evento evento) throws BusinessException {
	}
	
	public Evento findTitleByPK(long id) throws BusinessException {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(url, username, password);
			st = con.createStatement();
			rs = st.executeQuery("SELECT titolo, descrizione, data, puntoincontro, tipologia, nmaxpartecipanti, stato FROM gosoftair.EVENTO WHERE id=" + id);
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
				//Squadra squadra1 = rs.getString("name");
				//Squadra squadra2 = rs.getString("name");
				//Forum forum = rs.getString("name");
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
}
