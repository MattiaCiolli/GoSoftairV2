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
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EventoViewServlet extends HttpServlet {
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		EventoService eventoService = factory.getEventoService();
		Evento evento = eventoService.findEventoByPK(Long.parseLong(request.getParameter("idEvento")));
		
		if(evento.getStato() == 2) {
			response.sendRedirect(getServletContext().getContextPath() + "/evento/incorso?idEvento=" + evento.getId());
			return;
		}
			
		SquadreService squadreService = factory.getSquadreService();
		PostService postService = factory.getPostService();
		UtenteService utenteService = factory.getUtenteService();

		Squadre squadre = squadreService.cercaSquadreByEventoPK(evento.getId());
		Utente organizzatore = utenteService.utenteCreatoreEventByIdEvento(evento.getId());
		evento.setOrganizzatore(organizzatore);
		
		List<Post> posts = postService.cercaPostsByEventoPK(evento.getId());

		evento.setSquadre(squadre);
		evento.setPosts(posts);
		request.setAttribute("evento", evento);

		// Sezione di codice necessario per il meteo
		String provincia = "";
		String comune =  "";

		Date dataEvento = evento.getData();
		Date oggi = new Date();

		Calendar data = Calendar.getInstance();
		data.setTime(dataEvento);
		data.add(Calendar.DATE, -4);
		Date dataEventoMeno4Giorni = data.getTime();
		Boolean meteoDisponibile = false;

		if(!(oggi.after(dataEvento)) && (!oggi.before(dataEventoMeno4Giorni))) {
			ReadXMLFile lettore= new ReadXMLFile();
			meteoDisponibile = true;

			String lat = String.valueOf(evento.getLat());
			String lon = String.valueOf(evento.getLon());

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
		
		HttpSession session = request.getSession();
		//Se non è loggato non da errore
		
		if(session.getAttribute("id") != null) {
			Utente utenteLoggato = utenteService.findUserByPK(Long.parseLong(session.getAttribute("id").toString()));
			
			if(utenteLoggato.getId() == evento.getOrganizzatore().getId() && oggi.after(evento.getData()))
				request.setAttribute("attiva_evento", true);
			
			if(evento.getSquadre().utenteInSquadra(session.getAttribute("username").toString()))
				request.setAttribute("abbandonaSquadra", true);
			
			request.setAttribute("utenteLoggato", utenteLoggato);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/evento/evento.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		EventoService eventoService = factory.getEventoService();
		long idEvento = Long.parseLong(request.getParameter("idEvento"));
		eventoService.activeEvent(idEvento);
		PrintWriter out = response.getWriter();
		out.println(1);

	}
}
