package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.AnnuncioService;
import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.model.Annuncio;
import it.univaq.disim.gosoftair.business.model.Evento;

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
		String[] parts = {
				request.getParameter("DataOra").substring(0, 10),
				request.getParameter("DataOra").substring(10),
		};
		System.out.println(parts[0]+"  "+parts[1]);
		Date data = null;
		try {
			data = new SimpleDateFormat("dd-mm-yyyy").parse(parts[0]);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Date ora = new Date();
		try {
			ora = new SimpleDateFormat("HH:mm").parse(parts[1]);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String tipologia = request.getParameter("Tipologia");
		String puntoIncontro = "latlong";
		int numPartecipanti = Integer.parseInt(request.getParameter("NumPartecipanti"));
		//String immagine = "asdasd";
		Integer idutente=1;
		
	
		Evento evento=new Evento(titolo, descrizione, data, ora, puntoIncontro, tipologia, numPartecipanti, 1);
        GosoftairBusinessFactory factory=GosoftairBusinessFactory.getInstance();
        EventoService eventoService=factory.getEventoService();
        eventoService.create(evento);
	}


}
