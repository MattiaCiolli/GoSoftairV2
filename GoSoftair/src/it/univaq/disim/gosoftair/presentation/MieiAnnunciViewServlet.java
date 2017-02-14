package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.AnnuncioService;
import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.model.Annuncio;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Davide on 14/02/2017.
 */
public class MieiAnnunciViewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
        AnnuncioService annuncioService = factory.getAnnuncioService();
        List<Annuncio> annunci;
        long idUtente = 0;
        annunci = annuncioService.TuttiAnnunciCreatiDaMe(idUtente);
        request.setAttribute("annunci", annunci);
        request.setAttribute("percorso", "Profilo > I miei annunci");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/profilo/iMieiAnnunci.jsp");
        dispatcher.forward(request, response);
    }
}
