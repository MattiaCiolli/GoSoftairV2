package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.*;
import it.univaq.disim.gosoftair.business.model.Annuncio;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.business.model.Post;
import it.univaq.disim.gosoftair.business.model.Squadre;
import it.univaq.disim.gosoftair.utility.ReadXMLFile;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by Davide on 03/02/2017.
 */
public class HomeViewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();

        Date oggi=new Date();

        //il 2 in findLastEvent è il numero di eventi da cercare di caricare dal DB
        EventoService eventoService = factory.getEventoService();
        List<Evento> eventi;
        eventi = eventoService.findLastEvent(oggi, 2);
        request.setAttribute("eventi", eventi);

        AnnuncioService annuncioService = factory.getAnnuncioService();
        List<Annuncio> annunci;
        Calendar data = Calendar.getInstance();
        data.setTime(oggi);
        data.add(Calendar.MONTH, -3);
        Date oggiMeno3Mesi = data.getTime();
        //il 2 in findLastAnnunci è il numero di annunci da cercare di caricare dal DB
        annunci = annuncioService.findLastAnnunci(oggiMeno3Mesi, 2);
        request.setAttribute("annunci", annunci);

        List<String> classeGrafica = new ArrayList<>();
        classeGrafica.add("");
        classeGrafica.add("hidden-xs");
        classeGrafica.add("hidden-md  hidden-xs hidden-sm");
        request.setAttribute("classeGrafica",classeGrafica);

        //ReadXMLFile f= new ReadXMLFile();
        //f.leggiDatiMeteo();

        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}
