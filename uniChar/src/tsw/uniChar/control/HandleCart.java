package tsw.uniChar.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tsw.uniChar.model.cart;
import tsw.uniChar.model.productDAO;

/**
 * Servlet implementation class HandleCart
 */
@WebServlet(name="HandleCart", urlPatterns= {"/cart"})
public class HandleCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private productDAO pDAO = null;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleCart() {
        super();
        pDAO = new productDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward = "/cart.jsp";
		
		//trappiamo gli utenti non loggati
		if (request.getSession().getAttribute("user") == null) {
			response.sendRedirect("/loginPage.jsp");
			return;
		}
			
		
		String action = (String)request.getParameter("action");
		
		if (action == null)
			action = (String)request.getAttribute("action");
		
		cart carrello = (cart) request.getSession().getAttribute("cart");
		
		if (carrello == null) 
			carrello = new cart();
		
		Integer id = Integer.parseInt(request.getParameter("id"));
		Integer quantity = Integer.parseInt(request.getParameter("quantity"));

		try {
			if (action.equals("remove")) {
				carrello.remove(id);
			}
			if (action.equals("add")) {
				if (pDAO.getStock(id) > quantity)
					carrello.addProduct(id, quantity);
			}
			if (action.equals("modify")) {
				carrello.setQuantity(id, quantity);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		request.getSession().removeAttribute("cart");
		request.getSession().setAttribute("cart", carrello);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(forward);
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
