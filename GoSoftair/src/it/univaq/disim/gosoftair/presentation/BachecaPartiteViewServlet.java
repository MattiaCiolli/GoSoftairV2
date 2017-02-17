package it.univaq.disim.gosoftair.presentation;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;

import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.utility.ReadXMLFile;

public class BachecaPartiteViewServlet extends HttpServlet {
	
    Date oggi=new Date();


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
        EventoService eventoService= factory.getEventoService();
        List<Evento> eventi = eventoService.findLastEvent(oggi, 10);
        
        boolean sezioneEventiVuota=false;
        int lenghtEventi = eventi.size();
        if(lenghtEventi == 0) sezioneEventiVuota= true;
        
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
		
		List<String> classeGrafica = new ArrayList<>();
		classeGrafica.add("");
		classeGrafica.add("hidden-xs");
		classeGrafica.add("hidden-md  hidden-xs hidden-sm");
		request.setAttribute("classeGrafica", classeGrafica);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/annuncio/bachecaPartite.jsp");
		dispatcher.forward(request, response);
        
        
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//Nothing...
		
	}

}
