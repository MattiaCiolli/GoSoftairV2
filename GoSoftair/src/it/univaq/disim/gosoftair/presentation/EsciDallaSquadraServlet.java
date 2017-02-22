package it.univaq.disim.gosoftair.presentation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.SquadreService;

public class EsciDallaSquadraServlet extends HttpServlet {
    public EsciDallaSquadraServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long idEvento = Long.parseLong(request.getParameter("idEvento"));
		long idUtente = Long.parseLong(request.getParameter("idUtente"));
		
		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		SquadreService squadreService = factory.getSquadreService();
		squadreService.esciDallaSquadra(idEvento, idUtente);
		PrintWriter out = response.getWriter();
		out.println(1);
	}
}
