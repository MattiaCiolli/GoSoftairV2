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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EventoViewServlet
 */
public class EventoViewServlet extends HttpServlet {
	//private static final long serialVersionUID = 1L; ma che cazzo è sto rigo che mi blocca tutto????

    /**
     * Default constructor. 
     */
    public EventoViewServlet() {
        // TODO Auto-generated constructor stub 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		EventoService eventoService = factory.getEventoService();
		Evento evento = eventoService.findEventoByPK(0/*Long.parseLong(request.getParameter("idEvento"))*/);
		SquadreService squadreService = factory.getSquadreService();
		Squadre squadre = squadreService.cercaSquadreByEventoPK(evento.getId());
		PostService postService = factory.getPostService();
		List<Post> posts = postService.cercaPostsByEventoPK(evento.getId());
		
		evento.setSquadre(squadre);
		evento.setPosts(posts);
		
		request.setAttribute("evento", evento);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/evento/evento.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
