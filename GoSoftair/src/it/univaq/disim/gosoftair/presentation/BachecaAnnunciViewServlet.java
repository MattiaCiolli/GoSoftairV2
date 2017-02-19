package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.AnnuncioService;
import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.model.Annuncio;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Davide on 09/02/2017.
 */

public class BachecaAnnunciViewServlet extends HttpServlet {
    
    Date oggi=new Date();

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	
    	GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
        AnnuncioService annuncioService = factory.getAnnuncioService();
        HttpSession session=request.getSession();
        
        //long idUtente = (Long) session.getAttribute("id");
        long idUtente = 0;
        
        List<Annuncio> listaAnnunci = annuncioService.findLastAnnunci(oggi, 10);
        
        request.setAttribute("listaAnnunci", listaAnnunci);
        
        //if(request.getParameter("idAnnuncio") != null){
            //Long idEvento = Long.parseLong(request.getParameter("idAnnuncio"));

            // utilizzando idAnnuncio cerca sul DB l'annuncio corrispondente e passa i valori a request in modo
            // che in qualche modo li possa passare al modal corrispondente
        //}


        String idLetto = request.getParameter("idAnnuncio");
        if(idLetto !=null ){

            for (Annuncio annuncio:listaAnnunci){
                if(Long.toString(annuncio.getId()).contentEquals(idLetto)){
                    Annuncio annuncioLetto = annuncio;
                    SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/YYYY");
                    String dataStringata=sdf.format(annuncioLetto.getDatainserzione());

                    JSONObject value = new JSONObject();
                    value.put("titolo",annuncioLetto.getTitolo() );
                    value.put("descrizione", annuncioLetto.getDescrizione());
                    value.put("prezzo", annuncioLetto.getPrezzo());
                    value.put("email", annuncioLetto.getEmail());
                    value.put("numeroTelefono", annuncioLetto.getNumeroTelefono());
                    value.put("immagine", annuncioLetto.getImmagine());
                    value.put("datainserzione", dataStringata);
                    
                    System.out.println(annuncioLetto.getTitolo());

                    response.setContentType("application/json");
                    PrintWriter out = response.getWriter();
                    out.print(value);
                    out.flush();
                }
            }
        }else{
            RequestDispatcher dispatcher;
            request.setAttribute("listaAnnunci", listaAnnunci);
            ArrayList<String> date = new ArrayList<>();
            SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/YYYY");
            for (Annuncio annuncio:listaAnnunci){
                date.add(sdf.format(annuncio.getDatainserzione()));
            }
            request.setAttribute("date", date);
            request.setAttribute("percorso", "Mercatino > Bacheca Annunci");
            dispatcher = request.getRequestDispatcher("/views/annuncio/bachecaAnnunci.jsp");
            dispatcher.forward(request, response);
        }

    }
}
