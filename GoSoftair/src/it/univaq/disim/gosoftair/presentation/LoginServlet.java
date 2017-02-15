package it.univaq.disim.gosoftair.presentation;
import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.model.Utente;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/home");
        dispatcher.forward(request, response);
	}
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
                    throws ServletException, IOException {
        
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance(); 
        UtenteService utenteService=factory.getUtenteService();
        Utente logger=new Utente();
        logger=utenteService.login(username);
        
        if(password.equals(logger.getPassword())){
        
        HttpSession session=request.getSession();
        session.setAttribute("username",logger.getNickname()); 
        session.setAttribute("id",logger.getId()); 
        }  
        
        doGet(request, response);
    }  
}  
