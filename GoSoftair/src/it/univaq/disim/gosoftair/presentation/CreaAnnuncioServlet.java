package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.AnnuncioService;
import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.model.Annuncio;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.business.model.Utente;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/CreaAnnuncioServlet")
@MultipartConfig(maxFileSize = 1048576)
public class CreaAnnuncioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
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
		String titolo = request.getParameter("Titolo");
		String descrizione = request.getParameter("Descrizione");
		String appPath = request.getServletContext().getRealPath("/");
		// constructs path of the directory to save uploaded file
		String savePath = appPath + File.separator +"resources"+ File.separator +"img";
		String immagine = null; // input stream of the upload file
		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("Immagine");
		if (filePart != null) {
			String fileName = extractFileName(filePart);
			// refines the fileName in case it is an absolute path
			fileName = new File(fileName).getName();
			filePart.write(savePath + File.separator + fileName);

			// obtains input stream of the upload file
			immagine = fileName;
		}
		String prezzo = request.getParameter("Prezzo");
		String numeroTelefono = request.getParameter("NumTelefono");
		String email = request.getParameter("Email");
		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		UtenteService utenteService = factory.getUtenteService();
		Utente insertore = utenteService.findUserByPK(0);
		
		/*Evento myEvento = new Evento(titolo, "descrizione", , "punto incontro", tipologia, numeroPartecipanti, 0);
		
		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		EventoService eventoService = factory.getEventoService();
		eventoService.create(myEvento);
		*/
		//doGet(request, response);
		Annuncio annuncio=new Annuncio(titolo,descrizione, immagine, prezzo, numeroTelefono, email, insertore);
        AnnuncioService annuncioService=factory.getAnnuncioService();
        annuncioService.create(annuncio);
	}

}

