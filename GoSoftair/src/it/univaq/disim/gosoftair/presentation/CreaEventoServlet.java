package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.business.model.Utente;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
		String descrizione = request.getParameter("Tipologia");
		System.out.println(request.getParameter("DataOra"));
		Date data = null;
		try {
			data = new SimpleDateFormat("dd/MM/yyyy HH:mm").parse(request.getParameter("DataOra"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println(data);

		String tipologia = request.getParameter("Tipologia");
		String puntoIncontro = "latlong";
		int numPartecipanti = Integer.parseInt(request.getParameter("NumPartecipanti"));
		String immagine = "asdasd";
		Utente organizzatore=new Utente(1, "aldo", "aldi", "asdad@asd", "alduccio", "qweqwe", "adsads", "dfgdfg");
			
		Evento evento=new Evento(titolo, descrizione, data, puntoIncontro, tipologia, numPartecipanti, 1, immagine, organizzatore);
        GosoftairBusinessFactory factory=GosoftairBusinessFactory.getInstance();
        EventoService eventoService=factory.getEventoService();
        eventoService.create(evento);
	}


}
