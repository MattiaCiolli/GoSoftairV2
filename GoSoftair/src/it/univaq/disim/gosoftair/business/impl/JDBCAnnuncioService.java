package it.univaq.disim.gosoftair.business.impl;

import it.univaq.disim.gosoftair.business.AnnuncioService;
import it.univaq.disim.gosoftair.business.BusinessException;
import it.univaq.disim.gosoftair.business.model.Annuncio;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.business.model.Utente;

import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;


public class JDBCAnnuncioService implements AnnuncioService {
    private String url;
    private String username;
    private String password;

    public JDBCAnnuncioService(String url, String username, String password) {
        super();
        this.url = url;
        this.username = username;
        this.password = password;
    }


    public void create(Annuncio annuncio) {
        Connection con = null;
        PreparedStatement st = null;
        try {
            con = DriverManager.getConnection(url, username, password);
            String sql = "INSERT INTO ANNUNCIO (ID, TITOLO, DESCRIZIONE, IMMAGINE, PREZZO, NUMEROTELEFONO, EMAIL, IDUTENTE, DATA) VALUES (INCREMENTIDANNUNCIO.NEXTVAL,?,?,?,?,?,?,?,?)";
            st = con.prepareStatement(sql);

            st.setString(1, annuncio.getTitolo());
            st.setString(2, annuncio.getDescrizione());
            st.setString(3, annuncio.getImmagine());
            st.setString(4, annuncio.getPrezzo());
            st.setString(5, annuncio.getNumeroTelefono());
            st.setString(6, annuncio.getEmail());
            st.setLong(7, annuncio.getInsertore().getId());//idutente
            st.setDate(8, new java.sql.Date(annuncio.getDatainserzione().getTime()));
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new BusinessException("Errore durante la creazione dell'annuncio", e);
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

    @Override
    public List<Annuncio> findLastAnnunci(Date oggi, int quantita) throws BusinessException {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        int contatore = 0;
        List<Annuncio> risultati = new ArrayList<>();
        try {
            con = DriverManager.getConnection(url, username, password);
            st = con.createStatement();

            DateFormat DBformat = new SimpleDateFormat("dd-MMM-yyyy");
            String oggiFormattato = DBformat.format(oggi);

            rs = st.executeQuery("SELECT annuncio.id, titolo, descrizione, immagine, prezzo, numerotelefono, email, idutente, data FROM annuncio WHERE data >" + "'" + oggiFormattato + "'ORDER BY data");
            while (rs.next() && contatore < quantita) {
                contatore++;
                Long id = rs.getLong("id");
                String titolo = rs.getString("titolo");
                String descrizione = rs.getString("descrizione");
                String immagine = rs.getString("immagine");
                String prezzo = rs.getString("prezzo");
                String numeroTelefono = rs.getString("numeroTelefono");
                String email = rs.getString("email");
                Long idutente = rs.getLong("idutente");

                DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.S", Locale.ITALIAN);
                Date datainserzione = new Date();
                try {
                    datainserzione = format.parse(rs.getString("data"));
                } catch (ParseException e) {
                    e.printStackTrace();
                }

                Utente insertore = new Utente();
                insertore.setId(idutente);

                Annuncio annuncio = new Annuncio(id, titolo, descrizione, immagine, prezzo, numeroTelefono, email, insertore);
                annuncio.setDatainserzione(datainserzione);
                risultati.add(annuncio);
            }
            if (contatore == 0) {
                System.out.print("Il result set non ha elementi ultimi annunci");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new BusinessException("Errore durante la ricerca degli annunci", e);
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

    public List<Annuncio> findLastAnnunciByUserID(Date oggi, long userID) {

        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        int contatore = 0;
        List<Annuncio> risultati = new ArrayList<>();
        try {
            con = DriverManager.getConnection(url, username, password);
            st = con.createStatement();

            DateFormat DBformat = new SimpleDateFormat("dd-MMM-yyyy");
            String oggiFormattato = DBformat.format(oggi);

            rs = st.executeQuery("SELECT id, titolo, descrizione, immagine, prezzo, numerotelefono, email, idutente, data FROM annuncio WHERE annuncio.id=id AND data >" + "'" + oggiFormattato + "'ORDER BY data");
            while (rs.next() && contatore < 3) {
                Long id = rs.getLong("id");
                String titolo = rs.getString("titolo");
                String descrizione = rs.getString("descrizione");
                String immagine = rs.getString("immagine");
                String prezzo = rs.getString("prezzo");
                String numeroTelefono = rs.getString("numeroTelefono");
                String email = rs.getString("email");
                Long idutente = rs.getLong("idutente");

                DateFormat format = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss.S", Locale.ITALIAN);
                Date datainserzione = new Date();
                try {
                    datainserzione = format.parse(rs.getString("data"));
                } catch (ParseException e) {
                    e.printStackTrace();
                }

                Utente insertore = new Utente();
                insertore.setId(idutente);

                Annuncio annuncio = new Annuncio(id, titolo, descrizione, immagine, prezzo, numeroTelefono, email, insertore);
                risultati.add(annuncio);
                contatore++;
            }
            if (contatore == 0) {
                System.out.print("Il result set non ha elementi");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new BusinessException("Errore durante la ricerca degli annunci", e);
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

}