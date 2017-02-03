package it.univaq.disim.gosoftair.presentation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.univaq.disim.gosoftair.business.GosoftairBusinessFactory;
import it.univaq.disim.gosoftair.business.PostService;

public class CreaPostServlet extends HttpServlet {
  
    public CreaPostServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GosoftairBusinessFactory factory = GosoftairBusinessFactory.getInstance();
		PostService postService = factory.getPostService();
		postService.scegliSquadra(idUtente, numSquadra);
		PrintWriter out = response.getWriter();
		out.println(1);
	}
}
