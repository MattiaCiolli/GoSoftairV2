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

public class ScegliSquadraServlet extends HttpServlet {
 
    public ScegliSquadraServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] data = request.getParameter("data").split("\\s+");
		long idUtente = Long.parseLong(data[0]);
		int numSquadra = Integer.parseInt(data[1]);
		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		SquadreService squadreService = factory.getSquadreService();
		squadreService.scegliSquadra(idUtente, numSquadra);
		PrintWriter out = response.getWriter();
		out.println(1);
	}
}
