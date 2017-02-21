package it.univaq.disim.gosoftair.presentation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.PostService;
import it.univaq.disim.gosoftair.business.SquadreService;
import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.business.model.Utente;

public class CancellaEventoServlet extends HttpServlet {
    public CancellaEventoServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long idEvento = Long.parseLong(request.getParameter("idEvento"));
		
		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		EventoService eventoService = factory.getEventoService();
		PostService postService = factory.getPostService();
		SquadreService squadraService = factory.getSquadreService();
		
		postService.
		
		eventoService.delete(idEvento);
	}
}
