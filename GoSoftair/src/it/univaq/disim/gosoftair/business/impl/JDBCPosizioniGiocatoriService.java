package it.univaq.disim.gosoftair.business.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import it.univaq.disim.gosoftair.business.BusinessException;
import it.univaq.disim.gosoftair.business.PosizioniGiocatoriService;
import it.univaq.disim.gosoftair.business.model.PosizioneGiocatore;

public class JDBCPosizioniGiocatoriService implements PosizioniGiocatoriService {
	private String url;
	private String username;
	private String password;

	public JDBCPosizioniGiocatoriService(String url, String username, String password) {
		super();
		this.url = url;
		this.username = username;
		this.password = password;
	}
	
	public void update(PosizioneGiocatore posizione) throws BusinessException {
		Connection con = null;
		PreparedStatement st = null;

		try {
			con = DriverManager.getConnection(url, username, password);
			String sql = "MERGE INTO posizioniutenti a USING (SELECT ? idutente, ? latitudine, ? longitudine FROM dual) incoming ON (a.idutente = incoming.idutente) WHEN MATCHED THEN UPDATE SET a.latitudine=incoming.latitudine, a.longitudine=incoming.longitudine WHEN NOT MATCHED THEN INSERT (a.id, a.idutente, a.latitudine, a.longitudine) VALUES (INCREMENTIDPOSIZIONIUTENTI.NEXTVAL, incoming.idutente, incoming.latitudine, incoming.longitudine)";
			st = con.prepareStatement(sql);
			st.setLong(1, posizione.getIdGiocatore());
			st.setDouble(2, posizione.getLat());
			st.setDouble(3, posizione.getLon());
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessException("Errore durante l'update delle posizioni", e);
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
	
	public List<PosizioneGiocatore> posizioniAggiornate(long idEvento, long idGiocatore) throws BusinessException {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		List<PosizioneGiocatore> posizioniGiocatori = new ArrayList<PosizioneGiocatore>();

		try {
			con = DriverManager.getConnection(url, username, password);
			st = con.createStatement();
			rs = st.executeQuery("SELECT posizioniutenti.*,  utente_evento.numsquadra FROM Utente_Evento INNER JOIN posizioniutenti ON posizioniutenti.idutente=utente_evento.idutente WHERE utente_evento.idevento=" + idEvento +  "AND utente_evento.numsquadra=(SELECT numsquadra FROM utente_evento WHERE idutente=" + idGiocatore + ")");
			while(rs.next()) {
				long idUtente = Long.parseLong(rs.getString("idutente"));
				double lat = Double.parseDouble(rs.getString("latitudine"));
				double lon = Double.parseDouble(rs.getString("longitudine"));
				PosizioneGiocatore pos = new PosizioneGiocatore();
				pos.setGiocatore(idUtente);
				pos.setLat(lat);
				pos.setLon(lon);
				posizioniGiocatori.add(pos);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessException("Errore durante la creazione dell'evento", e);
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
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
		return posizioniGiocatori;		
	}
}
