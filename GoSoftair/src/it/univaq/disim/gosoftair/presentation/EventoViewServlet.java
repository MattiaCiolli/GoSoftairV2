package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.business.model.Utente;
import it.univaq.disim.gosoftair.business.model.Post;
import it.univaq.disim.gosoftair.business.model.Squadre;
import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.SquadreService;
import it.univaq.disim.gosoftair.business.PostService;
import it.univaq.disim.gosoftair.business.model.Post;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EventoViewServlet
 */
public class EventoViewServlet extends HttpServlet {
    public EventoViewServlet() {
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		EventoService eventoService = factory.getEventoService();
		Evento evento = eventoService.findEventoByPK(Long.parseLong(request.getParameter("idEvento")));
		SquadreService squadreService = factory.getSquadreService();
		Squadre squadre = squadreService.cercaSquadreByEventoPK(evento.getId());
		PostService postService = factory.getPostService();
		List<Post> posts = postService.cercaPostsByEventoPK(evento.getId());
		
		evento.setSquadre(squadre);
		evento.setPosts(posts);
		request.setAttribute("evento", evento);
		
		HttpSession session = request.getSession();
		
		//Per ora li setto manualemnte ma questo andrà fatto nel login
		session.setAttribute("idUtente", 0);
		session.setAttribute("nickname", "netrider");			
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/evento/evento.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
