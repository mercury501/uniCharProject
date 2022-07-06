package tsw.uniChar.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import tsw.uniChar.Beans.productBean;
import tsw.uniChar.model.productDAO;

/**
 * Servlet implementation class HandleProducts
 */
@WebServlet(name="HandleProducts", urlPatterns= {"/product"})
public class HandleProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private productDAO prodDao = null;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleProducts() {
        super();
        prodDao = new productDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String home = "/index.jsp";
		String admin = "/admin.jsp"; 
		String forward = "";
		
		productBean pB = new productBean();
		List<productBean> pBList = null;
		RequestDispatcher dispatcher = null;
		
		String action = (String)request.getParameter("action");
		
		if (action == null)
			action = (String)request.getAttribute("action");
		
		String returnTo = (String)request.getParameter("returnto");
		
		if (returnTo == null)
			returnTo = (String)request.getAttribute("returnto");
		
		if (action != null) {
			if (action.equalsIgnoreCase("insert")) {
				pB.setTitolo(request.getParameter("title"));
				pB.setDescrizione(request.getParameter("desc"));
				pB.setSviluppatore(request.getParameter("developer"));
				pB.setPrezzo(Float.valueOf(request.getParameter("price")));
				pB.setId(Integer.parseInt(request.getParameter("id")));
				pB.setImageOne(request.getParameter("imgpathone"));
				pB.setImageTwo(request.getParameter("imgpathtwo"));
				pB.setImageThree(request.getParameter("imgpaththree"));
				
				insertProduct(pB);
			}
			else if (action.equalsIgnoreCase("search")) {
				
				pB = searchProduct(Integer.parseInt((request.getParameter("SearchID")))); 
				request.removeAttribute("product");
				request.setAttribute("product", pB);

			}
			else if(action.equalsIgnoreCase("delete")) {
				
				pB.setId(Integer.parseInt(request.getParameter("id")));
				deleteProduct(pB.getId());
			}
			else if (action.equalsIgnoreCase("catalog")) {
				pBList = getCatalog();
				request.removeAttribute("catalog");
				request.setAttribute("catalog", pBList);
				
			}
			else if (action.equalsIgnoreCase("discountcatalog")) {
				Integer discount = Integer.parseInt(request.getParameter("discount"));
				if (discount == null)
					discount =(Integer)request.getAttribute("discount");
				
				Integer number = Integer.parseInt(request.getParameter("number"));
				if (number == null)
					number =(Integer)request.getAttribute("number");
				
				pBList = getDiscountedCatalog(discount, number);
				
				request.removeAttribute("catalog");
				request.setAttribute("catalog", pBList);
				
			}
			
			dispatcher = getServletContext().getRequestDispatcher("/" + returnTo);
			dispatcher.forward(request, response);
		}
	
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}
	
	private void insertProduct(productBean pB) {//TODO handle product
		prodDao.gestisciSalvataggio(pB);
	}
	
	private void deleteProduct(int id) {
		prodDao.deleteProduct(id);
	}

	private productBean searchProduct(int id) {
		return prodDao.getProduct(id);
	}
	
	private List<productBean> getCatalog() {
		return prodDao.getProducts();
	}
	
	private List<productBean> getDiscountedCatalog(int disc, int num){
		return prodDao.getDiscountedProducts(num, disc);
	}
	
}
