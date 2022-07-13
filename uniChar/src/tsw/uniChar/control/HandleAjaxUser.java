package tsw.uniChar.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import tsw.uniChar.Beans.userBean;
import tsw.uniChar.model.userDAO;

/**
 * Servlet implementation class HandleAjaxUser
 */
@WebServlet("/HandleAjaxUser")
public class HandleAjaxUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleAjaxUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
		userBean utente;
		userDAO uD = new userDAO();
			
		try {
			utente = uD.getUser(request.getParameter("checkEmail"));
			String JSONObj;
			
			if(utente.getEmail().equalsIgnoreCase("")) {
				JSONObj = new Gson().toJson(true);
				System.out.println("JSON: " + JSONObj);
				out.print(JSONObj);
				out.flush();
			} else {
				JSONObj = new Gson().toJson(false);
				System.out.println("JSON: " + JSONObj);
				out.print(JSONObj);
				out.flush();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
