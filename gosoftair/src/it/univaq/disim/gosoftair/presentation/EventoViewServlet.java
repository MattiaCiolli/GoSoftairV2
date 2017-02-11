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
import it.univaq.disim.gosoftair.utility.ReadXMLFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

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
		
		//Per ora li setto manualmente ma questo andrà fatto nel login
		session.setAttribute("idUtente", 0);
		session.setAttribute("nickname", "netrider");


		// per vedere il meteo dell'evento manca solo formattare i dati dell'evento in modo che sia
		// utilizzabili dalla classe ReadXMLFile e passare poi i dati finali al jsp.
		// nel jsp va anche aggiunto ancora il link per il sito del meteo e il controllo
		// che faccia apparire "Meteo ancora no disponibile" prima di 5 giorni dall'evento
		
		ReadXMLFile lettore= new ReadXMLFile();

		String provincia = "Teramo";
		String comune =  "Arsita";
		String dataEvento="20170212";
		String oraEvento="14:00";

		String urlMeteo = lettore.calcolaUrlMeteo(provincia, comune);
		Map<String, Collection<String>> meteo = lettore.leggiDatiMeteo(dataEvento, oraEvento, urlMeteo);
		ArrayList<String> ora1 = (ArrayList<String>) meteo.get("ora1");
		System.out.println("Simbolo: "+lettore.recuperaSimbolo(ora1.get(2)));
		System.out.println("Simbolo direzione vento: "+lettore.recuperaSimbolo(ora1.get(5)));
		System.out.println(meteo.get("ora1"));
        /*
        System.out.println(meteo.get("ora2"));
        System.out.println(meteo.get("ora3"));
        */



		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/evento/evento.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
