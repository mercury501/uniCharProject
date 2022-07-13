package tsw.uniChar.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import tsw.uniChar.Beans.productBean;
import tsw.uniChar.model.productDAO;

/**
 * Servlet implementation class HandleAjaxProduct
 */
@WebServlet("/HandleAjaxProduct")
public class HandleAjaxProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private productDAO pD = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleAjaxProduct() {
        super();
        pD = new productDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String JSONObj;
        
        String titolo = request.getParameter("prodtitle");
        
        try {
        	
    		JSONObj = new Gson().toJson(pD.controllaEsistenzaTitolo(titolo));
    		
    		out.print(JSONObj);
    		out.flush();
        	
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
