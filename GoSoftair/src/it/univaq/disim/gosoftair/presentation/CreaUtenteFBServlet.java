package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.model.Utente;
import it.univaq.disim.gosoftair.utility.ImagesMap;
import it.univaq.disim.gosoftair.utility.Social.FBConnection;

import it.univaq.disim.gosoftair.utility.Social.FBGraph;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.Map;
import javax.servlet.ServletOutputStream;

public class CreaUtenteFBServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String code = request.getParameter("code");
                
    	if (code == null || code.equals("")) {
    		throw new RuntimeException("ERROR: Didn't get code parameter in callback.");
    	}
            	
        FBConnection fbConnection = new FBConnection();
        String accessToken = fbConnection.getAccessToken(code);
        FBGraph fbGraph = new FBGraph(accessToken);
        String graph = fbGraph.getFBGraph();
        Map<String, String> fbProfileData = fbGraph.getGraphData(graph);
        ServletOutputStream out = response.getOutputStream();

        //creare un utente che abbia come parametri quelli recuperati da fb
        
        GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
        UtenteService utenteService = factory.getUtenteService();
        
        Utente user = utenteService.userByEmail(fbProfileData.get("email"));
        HttpSession session=request.getSession();

        if(user != null) {
            session.setAttribute("username", user.getNickname()); 
            session.setAttribute("id", user.getId()); 
            response.sendRedirect(request.getContextPath() + "/home");

        }else { 
            String id = fbProfileData.get("id");
            String nome = fbProfileData.get("first_name");
            String cognome = fbProfileData.get("last_name");
            String email = fbProfileData.get("email");
            String profilePicUrl = fbProfileData.get("picture");
            
        	URL url = new URL(profilePicUrl);
            BufferedImage c = ImageIO.read(url);
            
    		String immagine = nome + cognome + ".jpg";
    		String savePath = request.getServletContext().getRealPath("/") + File.separator +"resources"+ File.separator +"img" + File.separator + "profili" + File.separator + "small";
    		String original = request.getServletContext().getRealPath("/") + File.separator + "resources"+ File.separator +"img" ;
    		File output = new File(original + File.separator + "original" + immagine);
    		ImageIO.write(c, "jpg", output );
			ImagesMap.generaImmaginiBordate(savePath, immagine, original, true);

            Utente utente = new Utente(nome, cognome, email, nome+cognome, id, "N.D.", immagine);
            utenteService.create(utente);
            
            session.setAttribute("username", utente.getNickname()); 
            session.setAttribute("id", utente.getId()); 
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }
}

