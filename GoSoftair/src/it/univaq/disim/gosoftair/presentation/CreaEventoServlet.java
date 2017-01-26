package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.model.Evento;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreaEventoServlet
 */
@WebServlet("/CreaEventoServlet")
public class CreaEventoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreaEventoServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		String titolo = request.getParameter("NomeEvento");
		String tipologia = request.getParameter("Tipologia");
		String dataOra = request.getParameter("DataOra");
		int numeroPartecipanti = Integer.parseInt(request.getParameter("NumPartecipanti"));
		
		Evento myEvento = new Evento(titolo, "descrizione", 17, 10, "punto incontro", tipologia, numeroPartecipanti, 0);
		
		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		EventoService eventoService = factory.getEventoService();
		eventoService.create(myEvento);
		
		doGet(request, response);
	}

}
