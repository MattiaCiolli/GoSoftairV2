package it.univaq.disim.gosoftair.presentation;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.DirectoryNotEmptyException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.univaq.disim.gosoftair.business.EventoService;
import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.PostService;
import it.univaq.disim.gosoftair.business.SquadreService;
import it.univaq.disim.gosoftair.business.UtenteService;
import it.univaq.disim.gosoftair.business.model.Evento;
import it.univaq.disim.gosoftair.business.model.Utente;

public class CancellaEventoServlet extends HttpServlet {
    public CancellaEventoServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long idEvento = Long.parseLong(request.getParameter("idEvento"));
		
		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		EventoService eventoService = factory.getEventoService();
		PostService postService = factory.getPostService();
		SquadreService squadraService = factory.getSquadreService();
		
		Evento evento = eventoService.findEventoByPK(idEvento);
		Path path = Paths.get(request.getServletContext().getRealPath("/") + "resources/img/" + evento.getImmagine());
		
		try {
		    Files.delete(path);
		} catch (NoSuchFileException x) {
		    System.err.format("no such file or directory");
		} catch (DirectoryNotEmptyException x) {
		    System.err.format("directory not empty");
		} catch (IOException x) {
		    System.err.println(x);
		}
		
		postService.deletePostByIdEvent(idEvento);
		squadraService.deleteSquadreByIdEvent(idEvento);
		eventoService.delete(idEvento);
		
		PrintWriter out = response.getWriter();
		out.println(1);	
	}
}
