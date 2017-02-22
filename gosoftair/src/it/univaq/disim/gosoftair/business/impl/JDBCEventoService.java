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
			st.setTimestamp(3, new java.sql.Timestamp(evento.getData().getTime()));
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
	
	public void update (Evento evento) throws BusinessException {
		Connection con = null;
        PreparedStatement st = null;
        try {   	
        	con = DriverManager.getConnection(url, username, password);
            st = con.prepareStatement("UPDATE evento SET titolo=?, descrizione=?, data=?, puntoincontro=?, tipologia=?, nmaxpartecipanti=?, stato=1, idutente=?, immagine=?, latitudine=?, longitudine=? WHERE id=?");
            st.setString(1, evento.getTitolo());
			st.setString(2, evento.getDescrizione());
			st.setDate(3, new java.sql.Date(evento.getData().getTime()));
			st.setString(4, evento.getPuntoIncontro());
			st.setString(5, evento.getTipologia());
			st.setInt(6, evento.getNumMaxPartecipanti());
			st.setLong(7, evento.getOrganizzatore().getId());
			st.setString(8, evento.getImmagine());
			st.setDouble(9, evento.getLat());
			st.setDouble(10, evento.getLon());
			st.setLong(11, evento.getId());
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

	//funzione che restituisce un evento dato il suo ID
	public Evento findEventoByPK(long id) throws BusinessException {
		Connection con = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(url, username, password);
			st = con.prepareStatement("SELECT id, titolo, descrizione, data, puntoincontro, tipologia, nmaxpartecipanti, stato, immagine, latitudine, longitudine FROM evento WHERE id=?");
			st.setLong(1, id);
			rs = st.executeQuery();
			if (rs.next()) {
				String titolo = rs.getString("titolo");
				String descrizione = rs.getString("descrizione");
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss", Locale.ITALIAN);
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
			throw new BusinessException("Errore durante la ricerca dell'evento", e);
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
		PreparedStatement st = null;
		ResultSet rs = null;
		int contatore = 0;
		List<Evento> risultati = new ArrayList<>();
		try {
			con = DriverManager.getConnection(url, username, password);
			st = con.prepareStatement("SELECT id, titolo, descrizione, data, puntoincontro, tipologia, nmaxpartecipanti, stato, immagine, latitudine, longitudine FROM evento WHERE data > ? ORDER BY data");

			DateFormat DBformat = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
			String oggiFormattato = DBformat.format(oggi);
			st.setString(1, oggiFormattato);
			
			rs = st.executeQuery();
			
			while (rs.next() && contatore < quantita) {
				Long id = rs.getLong("id");
				String titolo = rs.getString("titolo");
				String descrizione = rs.getString("descrizione");
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss", Locale.ITALIAN);
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
				Evento evento = new Evento(id, titolo, descrizione, data, puntoIncontro, tipologia, numMaxPartecipanti, stato, immagine, idutente, lat, lon);
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
		PreparedStatement st = null;
		ResultSet rs = null;
		int contatore = 0;
		List<Evento> risultati = new ArrayList<>();

		try {
			con = DriverManager.getConnection(url, username, password);
			st = con.prepareStatement("SELECT evento.* FROM evento,utente_evento WHERE evento.id=utente_evento.idevento AND utente_evento.idutente= ? AND evento.data > ? ORDER BY data");

			DateFormat DBformat = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
			String oggiFormattato = DBformat.format(oggi);
			st.setLong(1, id);
			st.setString(2, oggiFormattato);
			rs = st.executeQuery();

			while (rs.next() && contatore < 3) {
				long idEvento = Long.parseLong(rs.getString("id"));
				String titolo = rs.getString("titolo");
				String descrizione = rs.getString("descrizione");
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss", Locale.ITALIAN);
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
				System.out.print("Il result set non ha elementi 2");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessException("Errore durante la ricerca degli eventi 2", e);
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
		PreparedStatement st = null;
		ResultSet rs = null;
		int contatore=0;

		List<Evento> risultati = new ArrayList<>();
		try {
			con = DriverManager.getConnection(url, username, password);
			st = con.prepareStatement("SELECT evento.id, titolo, descrizione, data, puntoincontro, tipologia, nmaxpartecipanti, stato, immagine, latitudine, longitudine FROM evento, utente_evento WHERE evento.id = utente_evento.idevento AND utente_evento.idutente = ? AND data > ? ORDER BY data");

			DateFormat DBformat = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
			String oggiFormattato= DBformat.format(oggi);
			
			st.setLong(1, idUtente);
			st.setString(2, oggiFormattato);

			rs = st.executeQuery();
			while(rs.next() && contatore < 10) {
				String titolo = rs.getString("titolo");
				String descrizione = rs.getString("descrizione");
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss", Locale.ITALIAN);
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
		PreparedStatement st = null;
		ResultSet rs = null;
		int contatore=0;

		List<Evento> risultati = new ArrayList<>();
		try {
			con = DriverManager.getConnection(url, username, password);
			st = con.prepareStatement("SELECT id, titolo, descrizione, data, puntoincontro, tipologia, nmaxpartecipanti, stato, immagine, latitudine, longitudine FROM evento WHERE evento.idutente = ? ORDER BY data desc");

			DateFormat DBformat = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
			
			st.setLong(1, idUtente);

			rs = st.executeQuery();
			while(rs.next()) {
				String titolo = rs.getString("titolo");
				String descrizione = rs.getString("descrizione");
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss", Locale.ITALIAN);
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
	
	public void activeEvent(long idEvento) throws BusinessException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DriverManager.getConnection(url, username, password);
			String sql = "UPDATE evento SET stato=? WHERE id=?";
			st = con.prepareStatement(sql);
			st.setInt(1, 2);
			st.setLong(2, idEvento);
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessException("Errore durante la modifica dello stato dell'evento", e);
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
	
	public void delete(long id) throws BusinessException {
		Connection con = null;
        PreparedStatement st = null;
        try {   	
        	con = DriverManager.getConnection(url, username, password);
            st = con.prepareStatement("DELETE FROM evento WHERE id=?");
            st.setLong(1, id);
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
