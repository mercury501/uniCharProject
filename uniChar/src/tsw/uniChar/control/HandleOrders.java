package tsw.uniChar.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tsw.uniChar.Beans.cartBean;
import tsw.uniChar.Beans.orderBean;
import tsw.uniChar.Beans.paymentBean;
import tsw.uniChar.Beans.productBean;
import tsw.uniChar.model.orderDAO;
import tsw.uniChar.model.paymentDAO;

/**
 * Servlet implementation class HandleOrders
 */
@WebServlet("/HandleOrders")
public class HandleOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private orderDAO oD = null;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleOrders() {
        super();
        oD = new orderDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
		Integer orderID = 0;
		cartBean cart = (cartBean) request.getSession().getAttribute("cart");
		
		String returnTo = (String)request.getParameter("returnto");
		
		String action = (String)request.getParameter("action");
		
		if (action == null)
			action = (String)request.getAttribute("action");
		
	
		
		if (action.equals("createorder")) {
			if (cart == null)
				return;
			orderBean order = new orderBean();
			
			Integer userID = (Integer)request.getSession().getAttribute("userid");
			if (userID == null)
				return;
			
			order.setCart(cart);
			order.setUserID(userID);
			
			
			
			try {
				
				orderID = oD.insertOrder(order);
				
				savePayment(request, response, orderID);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			request.getSession().removeAttribute("cart");
			
			dispatcher = getServletContext().getRequestDispatcher("/HandleInvoices?id=" + orderID.toString()); 
			dispatcher.forward(request, response);
			
		}
		
		
		if(action.contentEquals("getOrders")) {
		
			ArrayList<orderBean> orders = new ArrayList<orderBean>();
			Integer userID = (Integer)request.getSession().getAttribute("userid");
			
			String role = (String)request.getSession().getAttribute("role");
			if (role == null || !role.equalsIgnoreCase("admin")) 
				orders = oD.getUserInvoices(userID);	
			else
				orders = oD.getInvoices(); 

			request.setAttribute("orders", orders);
			
			dispatcher = getServletContext().getRequestDispatcher("/" + returnTo);
			dispatcher.forward(request, response);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void savePayment(HttpServletRequest request, HttpServletResponse response, Integer orderid) {
		
		paymentBean pB = new paymentBean();
		
		pB.setOrderid(orderid);
		String cardNumber = request.getParameter("cardNumber");
		pB.setNumeroCarta(padLeftZeros(cardNumber, 16));
		pB.setCVV(request.getParameter("cvv"));
		pB.setIntestatarioCarta(request.getParameter("name"));
		pB.setScadenza(request.getParameter("expiry"));
		pB.setUserid((Integer)request.getSession().getAttribute("userid"));
		
		paymentDAO pD = new paymentDAO();
		
		pD.insertPayment(pB);
		
	}
	
	public String padLeftZeros(String inputString, int length) {
	    if (inputString.length() >= length) {
	        return inputString;
	    }
	    StringBuilder sb = new StringBuilder();
	    while (sb.length() < length - inputString.length()) {
	        sb.append('0');
	    }
	    sb.append(inputString);

	    return sb.toString();
	}

}
