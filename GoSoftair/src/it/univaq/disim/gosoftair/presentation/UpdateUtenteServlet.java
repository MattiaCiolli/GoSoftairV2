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


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
        UtenteService service = factory.getUtenteService();
        long id = Long.parseLong(req.getParameter("id"));

        /*
        Utente utente = service.findUtenteByPK(id);

        req.setAttribute("nickname", nickname); //modificaNick
        req.setAttribute("password", password); //modificaPsw
        req.setAttribute("documentoValido", documentoValido);
        req.setAttribute("immagineProfilo", immagineProfilo); //modificaImmProfilo
        */

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/profilo/modificaProfilo.jsp");
        dispatcher.forward(req, resp);

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //long id = Long.parseLong(req.getParameter("id"));

        //fittizio
        long id=0;


        String nome = req.getParameter("nome");
        String cognome = req.getParameter("cognome");
        String nickname = req.getParameter("nickname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String documentoValido =req.getParameter("documentoValido");
        String immagineProfilo = req.getParameter("immagineProfilo");

        Utente utente = new Utente(id, nome, cognome, nickname, email, password, documentoValido, immagineProfilo );
        GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
        /*
        UtenteService utente = factory.getUtenteService();
        service.update(utente);*/

        resp.sendRedirect(req.getContextPath() + "/views/profilo/profilo");

    }





}

