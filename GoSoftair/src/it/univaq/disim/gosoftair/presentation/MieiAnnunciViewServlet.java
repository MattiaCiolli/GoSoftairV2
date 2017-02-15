package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.AnnuncioService;
import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.model.Annuncio;
import org.json.JSONObject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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


        String idLetto = request.getParameter("idAnnuncio");
        if(idLetto !=null ){

            for (Annuncio annuncio:annunci){
                if(Long.toString(annuncio.getId()).contentEquals(idLetto)){
                    Annuncio annucioLetto = annuncio;
                    SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/YYYY");
                    String dataStringata=sdf.format(annucioLetto.getDatainserzione());

                    JSONObject value = new JSONObject();
                    value.put("titolo",annucioLetto.getTitolo() );
                    value.put("descrizione", annucioLetto.getDescrizione());
                    value.put("prezzo", annucioLetto.getPrezzo());
                    value.put("email", annucioLetto.getEmail());
                    value.put("numeroTelefono", annucioLetto.getNumeroTelefono());
                    value.put("immagine", annucioLetto.getImmagine());
                    value.put("datainserzione", dataStringata);


                    response.setContentType("application/json");
                    PrintWriter out = response.getWriter();
                    out.print(value);
                    out.flush();
                }
            }
        }else{
            RequestDispatcher dispatcher;
            request.setAttribute("annunci", annunci);
            request.setAttribute("percorso", "Profilo > I miei annunci");
            dispatcher = request.getRequestDispatcher("/views/profilo/iMieiAnnunci.jsp");
            dispatcher.forward(request, response);
        }

    }
}