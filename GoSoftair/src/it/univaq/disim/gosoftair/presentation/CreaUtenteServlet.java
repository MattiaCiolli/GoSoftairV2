package it.univaq.disim.gosoftair.presentation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Davide on 27/01/2017.
 */
public class CreaUtenteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = "nome" ;
        String cognome = "cognome";
        String email = "email" ;
        String nickname = "nickname";
        String password = "password" ;
        String documentoValido = "documento valido";
        String immagineProfilo = "immagine profilo" ;
        /*
        Title title = new Title(name, author, description, isbn, publicationYear, editor, titleKind);
        LibraryBusinessFactory factory = LibraryBusinessFactory.getInstance();
        TitleService titleService = factory.getTitleService();
        titleService.create(title);

        resp.sendRedirect(req.getContextPath() + "/titles/view");
        */
    }
}