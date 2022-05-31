package tsw.uniChar.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tsw.uniChar.Beans.userBean;
import tsw.uniChar.model.DriverManagerConnectionPool;
import tsw.uniChar.model.userDAO;

/**
 * Servlet implementation class HandleLogin
 */

@WebServlet(name="HandleUsers", urlPatterns={"/connection"})

public class HandleUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Connection sqlConn = null;
    private PreparedStatement statement = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleUsers() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
        {
    		doPost(request, response);
        }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
        {
            String forward = "userLogged.jsp";
            String loginError = "invalidLogin.html";
            String adminPage = "admin.jsp";
            
            String user = request.getParameter("username");
            String password = request.getParameter("password");
            
            String result = null;
            
            
            userDAO uDs = new userDAO();
            
            try {
				userBean uB = uDs.doCheckLogin(new userBean(user, password));
				 if(uB.getId()!= -1) {
					 
					 //recupero la sessione
		            	HttpSession oldSession = request.getSession(false);
		            	
		            	if(oldSession != null) {
		            		oldSession.invalidate(); //invalido la sessione
		            	}
		            	
		            	HttpSession currentSession = request.getSession(); //creo una nuova connessione
		            	currentSession.setAttribute("user", user);
		            	currentSession.setMaxInactiveInterval(5*60); //5 min di inattività massima 
		            	
		            	
		            	if (uB.getRole().equals("admin"))
		            	{
		            		response.sendRedirect(adminPage);
		            	}
		            	else
		            	{
		            		response.sendRedirect(forward);
		            	}
		            	
		            	
		            }
				 else {
					 response.sendRedirect(loginError);
				 }
				
				
				
				
				
				
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
           
            
            
            
            
            
            
            
            
            
            
           /* RequestDispatcher dispatcher = null;
            try
            {
                userDAO uDS = new userDAO();
                
                userBean uB = uDS.doCheckLogin(user, password);
                
                if (uB.getId() != -1) {
                	result = uB.getName() + " " + uB.getSurname();
                	request.setAttribute("result", result);
                	
                	if (uB.getRole().equals("admin"))
                		dispatcher =  getServletContext().getRequestDispatcher(adminPage);
                	else {
	                	
	                	dispatcher = getServletContext().getRequestDispatcher(forward);
                	}
                }
                else {
                	 dispatcher = getServletContext().getRequestDispatcher(loginError);
                }
                	
            }
            catch(Exception e)
            {
                request.setAttribute("error", e.getLocalizedMessage());
            }
            
            request.setAttribute("username", user);           
            
            dispatcher.forward(request, response);    	
       */ }

}
