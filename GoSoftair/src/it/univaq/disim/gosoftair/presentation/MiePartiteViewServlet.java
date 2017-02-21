package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.model.Evento;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Davide on 12/02/2017.
 */
public class MiePartiteViewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
        EventoService eventoService = factory.getEventoService();
        List<Evento> eventi;

        HttpSession session=request.getSession();
        long idUtente = (Long) session.getAttribute("id");

        eventi = eventoService.trovaTuttePartiteCreateDaMe(idUtente);
        request.setAttribute("eventi", eventi);

        boolean nessunaCreazione = false;
        if(eventi.size() == 0) nessunaCreazione = true;

        DateFormat FormatoData = new SimpleDateFormat("dd/MM/yyyy");
        DateFormat FormatoOre = new SimpleDateFormat("HH:mm:ss");
        List<String> date = new ArrayList<>();
        List<String> ore = new ArrayList<>();
        for (Evento evento:eventi){
            date.add(FormatoData.format(evento.getData()));
            ore.add(FormatoOre.format(evento.getData()));
        }
        request.setAttribute("ore",ore);
        request.setAttribute("date",date);

        request.setAttribute("nessunaCreazione", nessunaCreazione);
        request.setAttribute("percorso", "Profilo > Le mie partite");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/profilo/leMiePartite.jsp");
        dispatcher.forward(request, response);

    }
}
