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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import it.univaq.disim.gosoftair.business.BusinessException;
import it.univaq.disim.gosoftair.business.PostService;
import it.univaq.disim.gosoftair.business.model.Post;
import it.univaq.disim.gosoftair.business.model.Utente;

public class JDBCPostService implements PostService {
	private String url;
	private String username;
	private String password;
	
	public JDBCPostService(String url, String username, String password) {
		super();
		this.url = url;
		this.username = username;
		this.password = password;
	}
	
	public void create (Post post, long idEvento) throws BusinessException {
		Connection con = null;
        PreparedStatement st = null;
        try {
            con = DriverManager.getConnection(url, username, password);
            String sql = "INSERT INTO post (id, idutente, idevento, testo, data) VALUES (INCREMENTIDPOST.NEXTVAL,?,?,?,?)";
            st = con.prepareStatement(sql);
            st.setLong(1, post.getUtente().getId());
            st.setLong(2, idEvento);
            st.setString(3, post.getMessaggio());
            st.setDate(4, new java.sql.Date(post.getData().getTime()));
            st.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
            throw new BusinessException("Errore durante la creazione del post",e);
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
	
	public List<Post> cercaPostsByEventoPK(long idEvento) throws BusinessException {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		List<Post> posts = new ArrayList<Post>();
		Utente utente;
		Post post;
		
		try {
			con = DriverManager.getConnection(url, username, password);
			st = con.createStatement();
			rs = st.executeQuery("SELECT utente.*, post.id as idpost, post.testo, post.data FROM utente JOIN post ON post.idutente=utente.id WHERE post.idevento=" + idEvento);
			while(rs.next()) {
				long idUser = Long.parseLong(rs.getString("id"));
				String nome = rs.getString("nome");
				String cognome = rs.getString("cognome");
				String email = rs.getString("email");
				String nickname = rs.getString("nickname");
				String password = rs.getString("password");
				String documentoValido = rs.getString("documentovalido");
				String immagineProfilo = rs.getString("immagineprofilo");
				
				utente = new Utente(idUser, nome, cognome, email, nickname, password, documentoValido, immagineProfilo);
				
				long idPost = Long.parseLong(rs.getString("idPost"));
				String messaggio = rs.getString("testo");
				DateFormat format = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss.S", Locale.ITALIAN);
				Date data = new Date();
				try {
					data = format.parse(rs.getString("data"));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				post = new Post(idPost, utente, messaggio, data);
				posts.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessException("Errore durante la creazione del post",e);
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
		return posts; 
	}
}
