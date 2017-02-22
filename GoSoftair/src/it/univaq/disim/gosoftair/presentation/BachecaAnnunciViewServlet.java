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
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.lang.Math;


public class BachecaAnnunciViewServlet extends HttpServlet {
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		AnnuncioService annuncioService = factory.getAnnuncioService();

		long idAnnuncio = Long.parseLong(request.getParameter("idAnnuncio"));

		Annuncio annuncioLetto = annuncioService.findAnnuncioByPK(idAnnuncio);

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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
        AnnuncioService annuncioService = factory.getAnnuncioService();
        
        HttpSession session=request.getSession();
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        
    	Calendar data = Calendar.getInstance();
    	data.add(Calendar.MONTH, -6);
    	Date oggiMeno6Mesi = data.getTime();
        
        List<Annuncio> listaAnnunci = annuncioService.visualizzazioneBachecaAnnunci(oggiMeno6Mesi, pageNum);
        
        request.setAttribute("listaAnnunci", listaAnnunci);

        double numAnnunci = annuncioService.numAnnunci(oggiMeno6Mesi);  
        int numeroPagine = (int)Math.ceil(numAnnunci/9);
        request.setAttribute("numeroPagine", numeroPagine - 1);

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
