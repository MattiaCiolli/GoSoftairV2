package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.model.Utente;
import it.univaq.disim.gosoftair.utility.ImagesMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.File;
import java.io.IOException;


public class UpdateUtenteServlet extends HttpServlet {
	
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

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
        UtenteService service = factory.getUtenteService();
       
        long id=0;
        
        Utente utente = service.findUserByPK(id);
        req.setAttribute("utente", utente);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/profilo/modificaProfilo.jsp");
        dispatcher.forward(req, resp);

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id=0;
        String nome = req.getParameter("nome");
        String cognome = req.getParameter("cognome");
        String nickname = req.getParameter("nickname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String documentoValido =req.getParameter("documentoValido");
       
        System.out.println(nome);
        System.out.println(cognome);
        System.out.println(nickname);

        
        String appPath = req.getServletContext().getRealPath("/");
        String savePath = appPath + File.separator +"resources"+ File.separator +"img";
      	String immagine = null; // input stream of the upload file
      	Part filePart = req.getPart("immagine");
      	if (filePart != null) {
      		String fileName = extractFileName(filePart);
      		// refines the fileName in case it is an absolute path
      		fileName = new File(fileName).getName();
      		filePart.write(savePath + File.separator + "original" + fileName);
      		immagine = fileName;
      		ImagesMap.generateImagesMap(savePath, fileName);
      	}
        
        Utente utente = new Utente(id, nome, cognome, email, nickname, password, documentoValido, immagine );

        GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
        UtenteService serviceUtente = factory.getUtenteService();
        serviceUtente.update(utente);

        resp.sendRedirect(req.getContextPath() + "/profilo");
    }
}

