package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.AnnuncioService;
import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.model.Annuncio;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.business.model.Utente;

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
import java.util.Date;
import java.util.List;

/**
 * Created by Faith on 03/02/17.
 */
public class UtenteViewServlet extends HttpServlet {
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession();
        
        long id = (Long) session.getAttribute("id");
        
        Date oggi=new Date();

        GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
        UtenteService utenteService = factory.getUtenteService();
        AnnuncioService annuncioservice = factory.getAnnuncioService();
        EventoService eventoService= factory.getEventoService();

        List<Annuncio> ultimiAnnunci = annuncioservice.findLastAnnunciByUserID(oggi, id);

        for (Annuncio annuncio:ultimiAnnunci){
            annuncio.setInsertore(utenteService.findUserByPK(annuncio.getInsertore().getId()));
        }
        
        boolean sezioneAnnunciVuota=false;
        int lenghtAnnunci = ultimiAnnunci.size();
        if(lenghtAnnunci == 0) sezioneAnnunciVuota= true;

        List<Evento> ultimiEventi = eventoService.findUltimiByUserID(oggi, id);
        Utente utente = utenteService.findUserByPK(id);
        
        boolean sezioneEventiVuota=false;
        int lenghtEventi = ultimiEventi.size();
        if(lenghtEventi == 0) sezioneEventiVuota= true;

        
        String idLetto = request.getParameter("idAnnuncio");
        if(idLetto !=null ){

            for (Annuncio annuncio:ultimiAnnunci){
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
                    
                    response.setContentType("application/json");
                    PrintWriter out = response.getWriter();
                    out.print(value);
                    out.flush();
                }
            }
        }
                else {
                    request.setAttribute("utente", utente);
                    request.setAttribute("ultimiAnnunci", ultimiAnnunci);
                    request.setAttribute("sezioneAnnunciVuota",sezioneAnnunciVuota);
                    request.setAttribute("ultimiEventi", ultimiEventi);
                    request.setAttribute("sezioneEventiVuota",sezioneEventiVuota);
                    request.setAttribute("percorso1", "Profilo");
                    request.setAttribute("link1", "/profilo");
                   
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/views/profilo/profilo.jsp");
                    dispatcher.forward(request, response);
                }
            
    
   }//fine get
    
}//fine class



