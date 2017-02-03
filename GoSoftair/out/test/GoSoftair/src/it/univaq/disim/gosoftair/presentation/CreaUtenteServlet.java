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

        System.out.println(nome+cognome+email+nickname+password+documentoValido+immagine);

        Utente utente =new Utente(nome,cognome, email, nickname, password, documentoValido, immagine);
        GosoftairBusinessFactory factory=GosoftairBusinessFactory.getInstance();
        UtenteService utenteService=factory.getUtenteService();
        utenteService.create(utente);

        System.out.println(nome+cognome+email+nickname+password+documentoValido+immagine);

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nome = "nome" ;
        String cognome = "cognome";
        String email = "email" ;
        String nickname = "nickname";
        String password = "password" ;
        String documentoValido = "documento valido";
        String immagineProfilo = "immagine profilo" ;

        Utente utente=new Utente(nome,cognome, email, nickname, password, documentoValido, immagineProfilo);
        GosoftairBusinessFactory factory=GosoftairBusinessFactory.getInstance();
        UtenteService utenteService=factory.getUtenteService();
        utenteService.create(utente);


        /*
        Title title = new Title(name, author, description, isbn, publicationYear, editor, titleKind);
        LibraryBusinessFactory factory = LibraryBusinessFactory.getInstance();
        TitleService titleService = factory.getTitleService();
        titleService.create(title);

        resp.sendRedirect(req.getContextPath() + "/titles/view");
        */
    }
}
