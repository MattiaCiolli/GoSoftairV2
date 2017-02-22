package it.univaq.disim.gosoftair.presentation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;

import it.univaq.disim.gosoftair.business.AnnuncioService;
import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.model.Annuncio;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.utility.ReadXMLFile;

public class BachecaPartiteViewServlet extends HttpServlet {
	
    Date oggi=new Date();


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
        EventoService eventoService= factory.getEventoService();
        
        HttpSession session=request.getSession();
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        
    	Calendar data = Calendar.getInstance();
    	data.add(Calendar.MONTH, -6);
    	Date oggiMeno6Mesi = data.getTime();
        
        List<Evento> listaEventi = eventoService.visualizzazioneBachecaPartite(oggiMeno6Mesi, pageNum);
        
        double numEventi = eventoService.numEventi(oggiMeno6Mesi);  
        int numeroPagine = (int)Math.ceil(numEventi/9);
        request.setAttribute("numeroPagine", numeroPagine - 1);
        
        boolean sezioneEventiVuota=false;
        int lenghtEventi = listaEventi.size();
        if(lenghtEventi == 0) sezioneEventiVuota= true;
        
		request.setAttribute("listaEventi", listaEventi);

        
		ReadXMLFile lettore= new ReadXMLFile();

		String provincia;
		String comune;
		ArrayList<ArrayList<String>> posizione = new ArrayList<>();
		for(Evento evento:listaEventi){
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
		
        request.setAttribute("percorso", "Partite > Elenco partite");

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/evento/bachecaPartite.jsp");
		dispatcher.forward(request, response);
        
        
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//Nothing...
		
	}

}
