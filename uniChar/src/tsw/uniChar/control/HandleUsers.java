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
            
            String result = null;
            
            try {
            	String action = (String)request.getParameter("action");
        		
        		if (action == null)
        			action = (String)request.getAttribute("action");
            	
			if (action.equals("login")) {
				response.sendRedirect(loginHandler(request, response));
				
				return;
			}
	
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
 
          }
    
	private String loginHandler(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String forward = "userLogged.jsp";
		String loginError = "invalidLogin.html";
		String adminPage = "admin.jsp";

		userDAO uDs = new userDAO();
		String user = request.getParameter("username");
		String password = request.getParameter("password");

		try {
			userBean uB = uDs.doCheckLogin(new userBean(user, password));
			if (uB.getId() != -1) {

				// recupero la sessione
				HttpSession oldSession = request.getSession(false);

				if (oldSession != null) {
					oldSession.invalidate(); // invalido la sessione
				}

				HttpSession currentSession = request.getSession(); // creo una nuova connessione
				currentSession.setAttribute("user", user);
				currentSession.setMaxInactiveInterval(5 * 60); // 5 min di inattività massima

				if (uB.getRole().equals("admin")) {
					return adminPage;
				} else {
					return forward;
				}

			}

			return loginError;
		} catch (SQLException e) {
			throw e;
		}
	}
}


