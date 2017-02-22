package it.univaq.disim.gosoftair.presentation;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.PostService;
import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.model.Utente;
import it.univaq.disim.gosoftair.business.model.Post;

public class CreaPostServlet extends HttpServlet {
  
    public CreaPostServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		PostService postService = factory.getPostService();
		UtenteService utenteService = factory.getUtenteService();
		
		Utente utente = utenteService.findUserByPK(Long.parseLong(request.getParameter("idUtente")));
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        
		Post post = new Post(utente, request.getParameter("postText"), date);
		
		long idEvento = Long.parseLong(request.getParameter("idEvento"));
		
		postService.create(post, idEvento);
		
		PrintWriter out = response.getWriter();
		out.println(1);
	}
}
