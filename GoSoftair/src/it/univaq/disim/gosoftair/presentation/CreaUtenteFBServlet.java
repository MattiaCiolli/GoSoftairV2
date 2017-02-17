package it.univaq.disim.gosoftair.presentation;

import it.univaq.disim.gosoftair.utility.Social.FBConnection;

import it.univaq.disim.gosoftair.utility.Social.FBGraph;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletOutputStream;

/**
 * Created by Faith on 15/02/17.
 */
public class CreaUtenteFBServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String code = request.getParameter("code");
                
    	if (code == null || code.equals("")) {
    		throw new RuntimeException("ERROR: Didn't get code parameter in callback.");
    	}
        FBConnection fbConnection = new FBConnection();
        String accessToken = fbConnection.getAccessToken(code);
        FBGraph fbGraph = new FBGraph(accessToken);
        String graph = fbGraph.getFBGraph();
        Map<String, String> fbProfileData = fbGraph.getGraphData(graph);
        ServletOutputStream out = response.getOutputStream();

        //creare un utente che abbia come parametri quelli recuperati da fb
        
        String nome=fbProfileData.get("first_name");
        String cognome=fbProfileData.get("second_name");
        String email=fbProfileData.get("email");
        
        System.out.println("first_name");
   }
}

