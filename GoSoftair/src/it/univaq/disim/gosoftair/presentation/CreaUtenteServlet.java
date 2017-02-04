package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.model.Utente;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CreaUtenteServlet extends HttpServlet {

    public CreaUtenteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String email = request.getParameter("email");
        String nickname = request.getParameter("nickname");
        String password = request.getParameter("password");
        String documentoValido = request.getParameter("documentoValido");
        String immagine = "url";


        Utente utente =new Utente(nome,cognome, email, nickname, password, documentoValido, immagine);
        GosoftairBusinessFactory factory=GosoftairBusinessFactory.getInstance();
        UtenteService utenteService=factory.getUtenteService();
        utenteService.create(utente);

        resp.sendRedirect(req.getContextPath() + "/views/profilo/nuovo");


    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
            UtenteService utenteService = factory.getUtenteService();

            RequestDispatcher dispatcher = req.getRequestDispatcher("/views/profilo/registrazione.jsp");
            dispatcher.forward(req, resp);

    }


