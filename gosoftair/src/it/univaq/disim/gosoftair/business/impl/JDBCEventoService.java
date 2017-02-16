package it.univaq.disim.gosoftair.business.impl;

import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.model.Annuncio;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.business.model.Utente;
import it.univaq.disim.gosoftair.business.BusinessException;
import oracle.sql.TIMESTAMP;

import java.sql.*;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Date;
import java.util.List;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.text.Format;


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


	//funzione che consente la creazione di un evento da parte di un utente
	public void create(Evento evento) {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DriverManager.getConnection(url, username, password);
			String sql = "INSERT INTO EVENTO (ID, TITOLO, DESCRIZIONE, DATA, PUNTOINCONTRO, TIPOLOGIA, NMAXPARTECIPANTI, STATO, IDUTENTE, IMMAGINE, LATITUDINE, LONGITUDINE) VALUES (INCREMENTIDEVENTO.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?)";
			st = con.prepareStatement(sql);
			st.setString(1, evento.getTitolo());
			st.setString(2, evento.getDescrizione());
			st.setDate(3, new java.sql.Date(evento.getData().getTime()));
			st.setString(4, evento.getPuntoIncontro());
			st.setString(5, evento.getTipologia());
			st.setInt(6, evento.getNumMaxPartecipanti());
			st.setInt(7, evento.getStato());
			st.setLong(8, evento.getOrganizzatore().getId());
			st.setString(9, evento.getImmagine());
			st.setDouble(10, evento.getLat());
			st.setDouble(11, evento.getLon());
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessException("Errore durante la creazione dell'evento", e);
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


	//funzione che restituisce un evento dato il suo ID
	public Evento findEventoByPK(long id) throws BusinessException {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(url, username, password);
			st = con.createStatement();
			rs = st.executeQuery("SELECT id, titolo, descrizione, data, puntoincontro, tipologia, nmaxpartecipanti, stato, immagine, latitudine, longitudine FROM evento WHERE id=" + id);
			if (rs.next()) {
				String titolo = rs.getString("titolo");
				String descrizione = rs.getString("descrizione");
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.S", Locale.ITALIAN);
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
				String immagine = rs.getString("immagine");
				double lat = Double.parseDouble(rs.getString("latitudine"));
				double lon = Double.parseDouble(rs.getString("longitudine"));
				Evento evento = new Evento(id, titolo, descrizione, data, puntoIncontro, tipologia, numMaxPartecipanti, stato, immagine, lat, lon);
				
				return evento;
			} else {
				System.out.print("Il result set non ha elementi");
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
		return null;
	}


	//funzione che restituisce gli eventi più prossimi
	public List<Evento> findLastEvent(Date oggi, int quantita) throws BusinessException {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int contatore = 0;
		List<Evento> risultati = new ArrayList<>();
		try {
			con = DriverManager.getConnection(url, username, password);
			st = con.createStatement();

			DateFormat DBformat = new SimpleDateFormat("dd-MMM-yyyy");
			String oggiFormattato = DBformat.format(oggi);

			rs = st.executeQuery("SELECT titolo, descrizione, data, puntoincontro, tipologia, nmaxpartecipanti, stato, immagine, latitudine, longitudine FROM evento WHERE data >" + "'" + oggiFormattato + "'ORDER BY data");
			while (rs.next() && contatore < quantita) {
				String titolo = rs.getString("titolo");
				String descrizione = rs.getString("descrizione");
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.S", Locale.ITALIAN);
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
				String immagine = rs.getString("immagine");
				double lat = Double.parseDouble(rs.getString("longitudine"));
				double lon = Double.parseDouble(rs.getString("latitudine"));
				Utente idutente = new Utente();
				Evento evento = new Evento(titolo, descrizione, data, puntoIncontro, tipologia, numMaxPartecipanti, stato, immagine, idutente, lat, lon);
				risultati.add(evento);
				contatore++;
			}
			if (contatore == 0) {
				System.out.print("Il result set non ha elementi ultimi eventi");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessException("Errore durante la ricerca degli eventi", e);
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
		return risultati;
	}


	//funzione che restituisce gli ultimi eventi a cui l'utente ha confermato la sua partecipazione
	public List<Evento> findUltimiByUserID(Date oggi, long id) {

		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int contatore = 0;
		List<Evento> risultati = new ArrayList<>();

		try {
			con = DriverManager.getConnection(url, username, password);
			st = con.createStatement();

			DateFormat DBformat = new SimpleDateFormat("dd-MMM-yyyy");
			String oggiFormattato = DBformat.format(oggi);
			rs = st.executeQuery("SELECT evento.* FROM evento,utente_evento WHERE evento.id=utente_evento.idevento AND utente_evento.idutente="+id+" AND evento.data >" + "'" + oggiFormattato + "'ORDER BY data");

			while (rs.next() && contatore < 3) {
				long idEvento = Long.parseLong(rs.getString("id"));
				String titolo = rs.getString("titolo");
				String descrizione = rs.getString("descrizione");
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.S", Locale.ITALIAN);
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
				String immagine = rs.getString("immagine");
				double lat = Double.parseDouble(rs.getString("latitudine"));
				double lon = Double.parseDouble(rs.getString("longitudine"));
				Utente idutente = new Utente();
				Evento evento = new Evento(idEvento, titolo, descrizione, data, puntoIncontro, tipologia, numMaxPartecipanti, stato, immagine, idutente, lat, lon);
				risultati.add(evento);
				contatore++;
			}
			if (contatore == 0) {
				System.out.print("Il result set non ha elementi");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessException("Errore durante la ricerca degli eventi", e);
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
		return risultati;
	}

	//funzione che restituisce tutti gli eventi a cui l'utente si è iscritto
	public List<Evento> findAllMySubscription(Date oggi, long idUtente) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int contatore=0;

		List<Evento> risultati = new ArrayList<>();
		try {
			con = DriverManager.getConnection(url, username, password);
			st = con.createStatement();

			DateFormat DBformat = new SimpleDateFormat("dd-MMM-yyyy");
			String oggiFormattato= DBformat.format(oggi);

			rs = st.executeQuery("SELECT evento.id, titolo, descrizione, data, puntoincontro, tipologia, nmaxpartecipanti, stato, immagine, latitudine, longitudine FROM evento, utente_evento WHERE evento.id = utente_evento.idevento AND utente_evento.idutente ="+idUtente+" AND data >"+ "'"+oggiFormattato+"' ORDER BY data");
			while(rs.next() && contatore < 10) {
				String titolo = rs.getString("titolo");
				String descrizione = rs.getString("descrizione");
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.S", Locale.ITALIAN);
				Date data = new Date();
				try {
					data = format.parse(rs.getString("data"));
				} catch (ParseException e) {
					e.printStackTrace();
				}

				String puntoIncontro = rs.getString("puntoIncontro");
				String tipologia = rs.getString("tipologia");
				int numMaxPartecipanti = Integer.parseInt(rs.getString("nmaxpartecipanti"));
				int stato = Integer.parseInt(rs.getString("stato"));
				String immagine = rs.getString("immagine");
				long id= rs.getLong("id");
				double lat = Double.parseDouble(rs.getString("latitudine"));
				double lon = Double.parseDouble(rs.getString("longitudine"));
				Evento evento = new Evento(id, titolo, descrizione, data, puntoIncontro, tipologia, numMaxPartecipanti, stato, immagine, lat, lon);
				risultati.add(evento);
				contatore++;
			}
			if(contatore == 0){
				System.out.print("Il result set non ha elementi, l'utente non è iscritto a eventi futuri");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessException("Errore durante la ricerca degli eventi",e);
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
		return risultati;
	}

	//funzione che restituisce tutti gli eventi che ha creato l'utente
	public List<Evento> trovaTuttePartiteCreateDaMe(long idUtente) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int contatore=0;

		List<Evento> risultati = new ArrayList<>();
		try {
			con = DriverManager.getConnection(url, username, password);
			st = con.createStatement();

			DateFormat DBformat = new SimpleDateFormat("dd-MMM-yyyy");

			rs = st.executeQuery("SELECT id, titolo, descrizione, data, puntoincontro, tipologia, nmaxpartecipanti, stato, immagine, latitudine, longitudine FROM evento WHERE evento.idutente = "+idUtente+" ORDER BY data desc");
			while(rs.next()) {
				String titolo = rs.getString("titolo");
				String descrizione = rs.getString("descrizione");
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.S", Locale.ITALIAN);
				Date data = new Date();
				try {
					data = format.parse(rs.getString("data"));
				} catch (ParseException e) {
					e.printStackTrace();
				}

				String puntoIncontro = rs.getString("puntoIncontro");
				String tipologia = rs.getString("tipologia");
				int numMaxPartecipanti = Integer.parseInt(rs.getString("nmaxpartecipanti"));
				int stato = Integer.parseInt(rs.getString("stato"));
				String immagine = rs.getString("immagine");
				long id= rs.getLong("id");
				double lat = Double.parseDouble(rs.getString("latitudine"));
				double lon = Double.parseDouble(rs.getString("longitudine"));
				Evento evento = new Evento(id, titolo, descrizione, data, puntoIncontro, tipologia, numMaxPartecipanti, stato, immagine, lat, lon);
				risultati.add(evento);
				contatore++;
			}
			if(contatore == 0){
				System.out.print("Il result set non ha elementi, l'utente non ha creato annunci");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessException("Errore durante la ricerca degli eventi",e);
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
		return risultati;
	}
}
