package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.model.Utente;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class UpdateUtenteServlet extends HttpServlet {

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
        //long id = Long.parseLong(req.getParameter("id"));

        //fittizio
        long id=0;
        
        System.out.println("abdul");

        String nome = req.getParameter("nome");
        String cognome = req.getParameter("cognome");
        String nickname = req.getParameter("nickname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String documentoValido =req.getParameter("documentoValido");
        String immagineProfilo = req.getParameter("immagineProfilo");
        System.out.println(nome);
        System.out.println(cognome);
        System.out.println(nickname);
        System.out.println(email);
        System.out.println(password);
        System.out.println(documentoValido);
        System.out.println(immagineProfilo);


        Utente utente = new Utente(id, nome, cognome, nickname, email, password, documentoValido, immagineProfilo );
       
        
        
        GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
        
        
        
   
        UtenteService serviceUtente = factory.getUtenteService();
        serviceUtente.update(utente);

        resp.sendRedirect(req.getContextPath() + "/profilo");

    }





}

