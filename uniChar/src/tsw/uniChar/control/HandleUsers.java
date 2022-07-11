package tsw.uniChar.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tsw.uniChar.Beans.cartBean;
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


            RequestDispatcher dispatcher = null;
			String returnTo = (String)request.getParameter("returnto");

            try {
            	String action = (String)request.getParameter("action");

        		if (action == null)
        			action = (String)request.getAttribute("action");

			if (action.equals("login")) {
				response.sendRedirect(loginHandler(request, response));

				return;
			}
			if (action.equals("register")) {
				dispatcher = getServletContext().getRequestDispatcher(registerHandler(request, response));
				dispatcher.forward(request, response);

				return;
			}
			if (action.equals("changePass")) {
				dispatcher = getServletContext().getRequestDispatcher(changePassHandler(request, response));
				dispatcher.forward(request, response);

				return;
			}

			if(action.equalsIgnoreCase("logout")) {
				LogOut(request,response);


			}


			if(action.equalsIgnoreCase("users")) {

				userBean uB = new userBean();


				System.out.print(uB.getRole());

					userDAO uD = new userDAO();

					List<userBean> listaUtenti = new ArrayList<userBean>();

					listaUtenti = uD.showUsers(uB);




					request.removeAttribute("users");
					request.setAttribute("users", listaUtenti);




			}

			if(action.equalsIgnoreCase("user")) {

				userBean uB = new userBean();
				userDAO uD = new userDAO();


				HttpSession session = request.getSession(false);
				String email = (String) session.getAttribute("email");

				uB = uD.getUser(email);


				request.removeAttribute("user");
				request.setAttribute("user", uB);


			}


            if(!action.equalsIgnoreCase("logout")) {

        	dispatcher = getServletContext().getRequestDispatcher("/" + returnTo);
    			dispatcher.forward(request, response);

            }

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


          }

	private String loginHandler(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String forward = "AreaUtente.jsp";
		String loginError = "invalidLogin.jsp";
		String adminPage = "AreaAdmin.jsp";

		userDAO uDs = new userDAO();
		String user = request.getParameter("username");
		String password = request.getParameter("password");

		try {
			userBean uB = uDs.doCheckLogin(new userBean(user, password));
			if (uB.getId() != -1) {

				// recupero la sessione
				HttpSession oldSession = request.getSession(false);
				cartBean cart = (cartBean) request.getSession().getAttribute("cart");

				if (oldSession != null) {
					oldSession.invalidate(); // invalido la sessione
				}

				HttpSession currentSession = request.getSession(); // creo una nuova connessione
				if (cart != null)
					currentSession.setAttribute("cart", cart);
				currentSession.setAttribute("user", user);
				currentSession.setAttribute("userid", uB.getId());
				currentSession.setAttribute("name", uB.getName());
				currentSession.setAttribute("email", uB.getEmail());
				currentSession.setAttribute("role", uB.getRole());
				currentSession.setMaxInactiveInterval(5 * 60); // 5 min di inattivita� massima

				System.out.println(uB.getRole());
				System.out.println(uB.getEmail());
				System.out.println(uB.getId());

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

	private String registerHandler(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String forward = "/index.jsp";

		userDAO uDs = new userDAO();
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String user = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");

		userBean uB = new userBean();
		uB.setName(name);
		uB.setSurname(surname);
		uB.setUser(user);
		uB.setPassword(password);
		uB.setEmail(email);
		uB.setRole("user");

		try {
			uDs.doAddUser(uB);

			request.setAttribute("registerResult", "success");


		} catch (SQLException e) {
			request.setAttribute("registerResult", "error");
		} finally {
			return forward;
		}
	}

	public void LogOut(HttpServletRequest request, HttpServletResponse response){


		String forward = "index.jsp";

		// recupero la sessione
		HttpSession oldSession = request.getSession(false);

		if (oldSession != null) {
			oldSession.invalidate(); // invalido la sessione
		}

		try {
			response.sendRedirect(forward);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}


	private String changePassHandler(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String forward = "/changePassword.jsp";

		userDAO uDs = new userDAO();

		HttpSession currentSession = request.getSession(); // creo una nuova connessione
		String user = (String) currentSession.getAttribute("user");



		String oldPassword = request.getParameter("oldpass");
		String newPassword = request.getParameter("newpass");

		userBean uB = new userBean();
		uB.setUser(user);
		uB.setPassword(oldPassword);
		uB.setNewPassword(newPassword);

		try {
			uDs.doChangePassword(uB);

			request.setAttribute("result", "success");


		} catch (SQLException e) {
			request.setAttribute("result", "error");
		} finally {
			return forward;
		}
	}


}
