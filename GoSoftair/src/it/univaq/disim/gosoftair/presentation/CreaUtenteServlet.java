package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.model.Utente;
import it.univaq.disim.gosoftair.utility.ImagesMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.File;
import java.io.IOException;

@MultipartConfig(maxFileSize = 1048576)
public class CreaUtenteServlet extends HttpServlet {

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
	
    public CreaUtenteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String documentoValido = request.getParameter("documentoValido");
        String appPath = request.getServletContext().getRealPath("/");
		// constructs path of the directory to save uploaded file
		String savePath = appPath + File.separator +"resources"+ File.separator +"img";
		String immagine = null; // input stream of the upload file
		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("immagine");
		if (filePart != null) {
			String fileName = extractFileName(filePart);
			// refines the fileName in case it is an absolute path
			fileName = new File(fileName).getName();
			filePart.write(savePath + File.separator + "original" + fileName);
			immagine = fileName;
			ImagesMap.generateImagesMap(savePath, fileName);
		}


        Utente utente = new Utente(nome, cognome, email, username, password, documentoValido, immagine);
        GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
        UtenteService utenteService = factory.getUtenteService();
        utenteService.create(utente);

        response.sendRedirect(request.getContextPath() + "/profilo");


    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	request.setAttribute("percorso", "Registrazione");
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/views/profilo/registrazione.jsp");
        dispatcher.forward(request, response);

    }
}


