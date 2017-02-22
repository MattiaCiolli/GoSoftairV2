package it.univaq.disim.gosoftair.presentation;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.business.model.Utente;
import it.univaq.disim.gosoftair.utility.ImagesMap;

@MultipartConfig(maxFileSize = 1048576)
public class UpdateEventoServlet extends HttpServlet {       
 
    public UpdateEventoServlet() {
        super();
    }
    
    private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length()-1);
			}
		}
		return "";
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long idEvento = Long.parseLong(request.getParameter("idEvento"));
		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		EventoService eventoService = factory.getEventoService();
		Evento evento = eventoService.findEventoByPK(idEvento);
		
		request.setAttribute("percorso", "Partite > Aggiorna partita");
		request.setAttribute("evento", evento);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/evento/aggiornaEvento.jsp");
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String titolo = request.getParameter("NomeEvento");
		String descrizione = request.getParameter("Descrizione");
		Date data = null;
		try {
			data = new SimpleDateFormat("dd/MM/yyyy HH:mm").parse(request.getParameter("DataOra"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String tipologia = request.getParameter("Tipologia");
		int numPartecipanti = Integer.parseInt(request.getParameter("NumPartecipanti"));
		String appPath = request.getServletContext().getRealPath("/");
		// constructs path of the directory to save uploaded file
		String savePath = appPath + File.separator +"resources"+ File.separator +"img";
		String ptoincontro = request.getParameter("PuntoIncontro");
		String immagine = null; // input stream of the upload file
		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("Immagine");
		if (filePart != null) {
			String fileName = extractFileName(filePart);
			// refines the fileName in case it is an absolute path
			fileName = new File(fileName).getName();
			immagine = fileName;


			String outputPath = savePath + File.separator + "partite" + File.separator + "big";
			filePart.write(savePath + File.separator + "original" + fileName);
			ImagesMap.generateImagesCard(outputPath, fileName, 362, 270, savePath, false);

			outputPath = savePath + File.separator + "partite" + File.separator + "small";
			ImagesMap.generateImagesCard(outputPath, fileName, 350, 200, savePath, false);

			outputPath = savePath + File.separator + "partite" + File.separator + "xl";
			ImagesMap.generateImagesCard(outputPath, fileName, 800, 600, savePath, true);
		}
		
		double lat=Double.parseDouble(request.getParameter("Lat"));
		double lon=Double.parseDouble(request.getParameter("Lon"));
		long idEvento = Long.parseLong(request.getParameter("idEvento"));
		
		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		UtenteService utenteService = factory.getUtenteService();
		Utente organizzatore = utenteService.findUserByPK(Long.parseLong(session.getAttribute("id").toString()));
		EventoService eventoService = factory.getEventoService();
		Evento evento = new Evento(idEvento, titolo, descrizione, data, ptoincontro, tipologia, numPartecipanti, 1, immagine, organizzatore, lat, lon);
		eventoService.update(evento);
		
		response.sendRedirect(request.getContextPath() + "/evento/dettagli?idEvento=" + evento.getId());
	}
}
