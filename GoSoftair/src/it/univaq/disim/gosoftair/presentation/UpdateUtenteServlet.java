package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.model.Utente;
import it.univaq.disim.gosoftair.utility.ResizeImage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.io.File;
import java.io.IOException;

@MultipartConfig(maxFileSize = 1048576)
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
       
        HttpSession session=req.getSession();
        
        long id = (Long) session.getAttribute("id");
        
        Utente utente = service.findUserByPK(id);
        req.setAttribute("utente", utente);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/profilo/modificaProfilo.jsp");
        dispatcher.forward(req, resp);

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	HttpSession session=req.getSession();
        
        long id = (Long) session.getAttribute("id");
        String nome = req.getParameter("nome");
        String cognome = req.getParameter("cognome");
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String documentoValido = req.getParameter("documentoValido");
        String immagine= req.getParameter("img");
        System.out.println(immagine);
        GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
        UtenteService utenteService = factory.getUtenteService();
        if(nome==null)
        {
        	String appPath = req.getServletContext().getRealPath("/");
    		// constructs path of the directory to save uploaded file
    		String savePath = appPath + File.separator +"resources"+ File.separator +"img";   		
    		// obtains the upload file part in this multipart request
    		Part filePart = req.getPart("immagine");
    		if (filePart != null) {
    			String fileName = extractFileName(filePart);
    			// refines the fileName in case it is an absolute path
                fileName = new File(fileName).getName();
                immagine = fileName;
                String outputPath = savePath + File.separator + "profili" + File.separator + "big";
                System.out.println("write 1: "+outputPath + File.separator + "original" + fileName);
                filePart.write(savePath + File.separator + "original" + fileName);
                ResizeImage.generateImagesCard(outputPath, fileName, 160, 160, savePath, false);

                outputPath = savePath + File.separator + "profili" + File.separator + "small";
                System.out.println("write 2: "+outputPath + File.separator + "original" + fileName);
                ResizeImage.generaImmaginiBordate(outputPath, fileName, savePath, true);
    		}
    		Utente utente = new Utente(id, nome, cognome, email, username, password, documentoValido, immagine);
        	utenteService.updateImg(utente);
        }else{
        	Utente utente = new Utente(id, nome, cognome, email, username, password, documentoValido, immagine);
        utenteService.update(utente);
        }

        resp.sendRedirect(req.getContextPath() + "/profilo");
    }
}

