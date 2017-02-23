package it.univaq.disim.gosoftair.presentation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.PosizioniGiocatoriService;
import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.business.model.PosizioneGiocatore;
import it.univaq.disim.gosoftair.business.model.Utente;

public class PartitaInCorsoServlet extends HttpServlet { 
    public PartitaInCorsoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		EventoService eventoService = factory.getEventoService();
		UtenteService utenteService = factory.getUtenteService();
		
		HttpSession session = request.getSession();

		Evento evento = eventoService.findEventoByPK(Long.parseLong(request.getParameter("idEvento")));
		request.setAttribute("evento", evento);
		Utente organizzatore = utenteService.utenteCreatoreEventByIdEvento(evento.getId());
		evento.setOrganizzatore(organizzatore);
		
		if(Long.parseLong(session.getAttribute("id").toString()) == evento.getOrganizzatore().getId())
			request.setAttribute("termina_evento", true);
		else
			request.setAttribute("termina_evento", false);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/evento/partitaInCorso.jsp");
		dispatcher.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lon = Double.parseDouble(request.getParameter("lon"));
		String immagineMappa = request.getParameter("img");
        HttpSession session=request.getSession();

		long idGiocatore = (Long)session.getAttribute("id");
		long idEvento = Long.parseLong(request.getParameter("idEvento"));
		
		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		PosizioniGiocatoriService posizioneGiocatoreService = factory.getPosizioniGiocatoriService();
		UtenteService utenteService = factory.getUtenteService();
		Utente giocatore = utenteService.findUserByPK(idGiocatore);
		
		PosizioneGiocatore position = new PosizioneGiocatore();
		position.setLat(lat);
		position.setLon(lon);
		position.setGiocatore(idGiocatore);
		position.setImmagineMappa(immagineMappa + giocatore.getImmagineProfilo());
		posizioneGiocatoreService.update(position);
		List<PosizioneGiocatore> posizioniGiocatori =  posizioneGiocatoreService.posizioniAggiornate(idEvento, idGiocatore);
		
		String json = "{\"coordinates\":[";
		String elements = "";
		
		for (int i = 0; i < posizioniGiocatori.size(); i++) {
			if( i ==  posizioniGiocatori.size() - 1)
				elements = elements + posizioniGiocatori.get(i).toString();
			else
				elements = elements + posizioniGiocatori.get(i).toString() + ",";
		}
		
		json = json + elements + "]}"; 		

		PrintWriter out = response.getWriter();
		out.println(json);		
	}

}
