package tsw.uniChar.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tsw.uniChar.Beans.cartBean;
import tsw.uniChar.Beans.orderBean;
import tsw.uniChar.model.orderDAO;
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
		
		Integer id=-1, quantity=-1;
		
		/*
		//trappiamo gli utenti non loggati
		if (request.getSession().getAttribute("user") == null) {
			response.sendRedirect("/loginPage.jsp");
			return;
		}*/
			
		
		String action = (String)request.getParameter("action");
		
		if (action == null)
			action = (String)request.getAttribute("action");
		
		cartBean carrello = (cartBean) request.getSession().getAttribute("cart");
		
		if (carrello == null) 
			carrello = new cartBean();
		try {
		id = Integer.parseInt(request.getParameter("id"));
		quantity = Integer.parseInt(request.getParameter("quantity"));
		} catch (Exception e) {
		
		}
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
			if (action.equals("order")) {
				orderDAO oD = new orderDAO();
				orderBean oB = new orderBean();
				
				oB.setCart(carrello);
				//oB.setUserID((int)request.getSession().getAttribute("userid"));
				oB.setUserID(1); //TODO debug
				oD.insertOrder(oB);
				
				carrello = new cartBean();
			}

		} catch (Exception e) {
			e.printStackTrace(System.out);
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
