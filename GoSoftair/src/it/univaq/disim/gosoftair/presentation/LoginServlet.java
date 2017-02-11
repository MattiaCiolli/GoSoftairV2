package it.univaq.disim.gosoftair.presentation;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
                    throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
          
        String email=request.getParameter("email");
        String password=request.getParameter("password");
          
        if(password.equals("admin123")){
        
        HttpSession session=request.getSession();
        session.setAttribute("email",email); 
        out.print("Welcome, "+session.getAttribute("email"));
        }  
        else{  
            out.print("Sorry, username or password error!");
        }  
        out.close();  
    }  
}  
