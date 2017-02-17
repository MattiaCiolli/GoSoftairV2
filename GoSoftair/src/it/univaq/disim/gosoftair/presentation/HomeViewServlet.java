package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.*;
import it.univaq.disim.gosoftair.business.model.Annuncio;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.utility.ReadXMLFile;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;

/**
 * Created by Davide on 03/02/2017.
 */
public class HomeViewServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Date oggi = new Date();

		GosoftairBusinessFactory factory = GosoftairBusinessFactory
				.getInstance();
		EventoService eventoService = factory.getEventoService();
		List<Evento> eventi;
		eventi = eventoService.findLastEvent(oggi, 2); // il 2 in findLastEvent
														// è il numero di
														// eventi da cercare di
														// caricare dal DB
		request.setAttribute("eventi", eventi);

		ReadXMLFile lettore= new ReadXMLFile();

		String provincia;
		String comune;
		ArrayList<ArrayList<String>> posizione = new ArrayList<>();
		for(Evento evento:eventi){
			String lat = String.valueOf(evento.getLat());
			String lon = String.valueOf(evento.getLon());
			ArrayList<String> provinciaComune=new ArrayList<>();
			provinciaComune = lettore.geocoding(lat, lon);
			posizione.add(provinciaComune);
		}
		request.setAttribute("posizione", posizione);

		AnnuncioService annuncioService = factory.getAnnuncioService();
		List<Annuncio> annunci;
		Calendar data = Calendar.getInstance();
		data.setTime(oggi);
		data.add(Calendar.MONTH, -3);
		Date oggiMeno3Mesi = data.getTime();
		annunci = annuncioService.findLastAnnunci(oggiMeno3Mesi, 2); // il 2 in
																		// findLastAnnunci
																		// è il
																		// numero
																		// di
																		// annunci
																		// da
																		// cercare
																		// di
																		// caricare
																		// dal
																		// DB

		UtenteService utenteService = factory.getUtenteService();
		for (Annuncio annuncio : annunci) {
			annuncio.setInsertore(utenteService.findUserByPK(annuncio
					.getInsertore().getId()));
		}
		request.setAttribute("annunci", annunci);

		List<String> classeGrafica = new ArrayList<>();
		classeGrafica.add("");
		classeGrafica.add("hidden-xs");
		classeGrafica.add("hidden-md  hidden-xs hidden-sm");
		request.setAttribute("classeGrafica", classeGrafica);

		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
	}
}
