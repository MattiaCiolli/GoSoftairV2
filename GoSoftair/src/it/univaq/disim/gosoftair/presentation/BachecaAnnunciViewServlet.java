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

/**
 * Created by Davide on 09/02/2017.
 */
public class BachecaAnnunciViewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
        AnnuncioService annuncioService = factory.getAnnuncioService();
        if(request.getParameter("idAnnuncio") != null){
            Long idEvento = Long.parseLong(request.getParameter("idAnnuncio"));

            // utilizzando idAnnuncio cerca sul DB l'annuncio corrispondente e passa i valori a request in modo
            // che in qualche modo li possa passare al modal corrispondente
        }
        //in ogni caso prendi dal db i 9 annunci e caricali nella pagina

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/annuncio/bachecaAnnunci.jsp");
        dispatcher.forward(request, response);


    }
}
