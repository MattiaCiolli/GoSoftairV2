package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.AnnuncioService;
import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.model.Annuncio;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.business.model.Utente;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CreaAnnuncioServlet")
public class CreaAnnuncioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreaAnnuncioServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String titolo = request.getParameter("titolo");
		String descrizione = request.getParameter("descrizione");
		String immagine = "ksafhlguif";
		String prezzo = request.getParameter("prezzo");
		String numeroTelefono = request.getParameter("numeroTelefono");
		String email = request.getParameter("email");
		Integer idutente=1;
		
		/*Evento myEvento = new Evento(titolo, "descrizione", , "punto incontro", tipologia, numeroPartecipanti, 0);
		
		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		EventoService eventoService = factory.getEventoService();
		eventoService.create(myEvento);
		*/
		//doGet(request, response);
		Annuncio annuncio=new Annuncio(titolo,descrizione, immagine, prezzo, numeroTelefono, email, idutente);
        GosoftairBusinessFactory factory=GosoftairBusinessFactory.getInstance();
        AnnuncioService annuncioService=factory.getAnnuncioService();
        annuncioService.create(annuncio);
	}

}

