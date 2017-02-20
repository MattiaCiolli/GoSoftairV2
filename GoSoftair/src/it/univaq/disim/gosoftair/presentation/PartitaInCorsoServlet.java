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

import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.PosizioniGiocatoriService;
import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.model.PosizioneGiocatore;
import it.univaq.disim.gosoftair.business.model.Utente;

public class PartitaInCorsoServlet extends HttpServlet { 
    public PartitaInCorsoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
