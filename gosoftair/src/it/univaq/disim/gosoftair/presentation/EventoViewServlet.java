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
import java.util.*;

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



		// Sezione di codice necessario per il meteo
		String provincia = "";
		String comune =  "";

		Date dataEvento = evento.getData();
		Date oggi=new Date();

		Calendar data = Calendar.getInstance();
		data.setTime(dataEvento);
		data.add(Calendar.DATE, -4);
		Date dataEventoMeno4Giorni = data.getTime();
		Boolean meteoDisponibile = false;


		if(!(oggi.after(dataEvento)) && (!oggi.before(dataEventoMeno4Giorni))) {
			ReadXMLFile lettore= new ReadXMLFile();
			meteoDisponibile = true;

			//lat e lon vanno recuperati da DB una volta che ci stanno
			String lat="42.470088";
			String lon="13.783990";

			ArrayList<String> provinciaComune=new ArrayList<>();
			provinciaComune = lettore.geocoding(lat, lon);
			provincia = provinciaComune.get(0);
			comune = provinciaComune.get(1);

			String urlMeteo = lettore.calcolaUrlMeteo(provincia, comune);
			Map<String, Collection<String>> meteo = lettore.leggiDatiMeteo(dataEvento, urlMeteo);

			ArrayList<String> ora1 = (ArrayList<String>) meteo.get("ora1");
			ArrayList<String> ora2 = (ArrayList<String>) meteo.get("ora2");
			ArrayList<String> ora3 = (ArrayList<String>) meteo.get("ora3");

			request.setAttribute("primoOrario", ora1);
			request.setAttribute("secondoOrario", ora2);
			request.setAttribute("terzoOrario", ora3);

		}

		request.setAttribute("meteoDisponibile", meteoDisponibile);
		request.setAttribute("percorso", "Dettaglio partita");


		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/evento/evento.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
