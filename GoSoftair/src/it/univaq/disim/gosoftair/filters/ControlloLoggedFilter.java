package it.univaq.disim.gosoftair.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class ControlloAutenticato
 */
@WebFilter("/ControlloLoggedFilter")
public class ControlloLoggedFilter implements Filter {

    /**
     * Default constructor. 
     */
    public ControlloLoggedFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		  HttpServletRequest req = (HttpServletRequest)request;
	      HttpServletResponse resp = (HttpServletResponse) response;
	      HttpSession session = req.getSession(true);

	      String pageRequested = req.getRequestURI().toString();
		  session.setAttribute("provenienza", pageRequested);

	      if(session.getAttribute("username") == null){
	         resp.sendRedirect(req.getContextPath() + "/views/registerOrLogin.jsp");
	      }else{
	        chain.doFilter(req, resp);
	      }

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
