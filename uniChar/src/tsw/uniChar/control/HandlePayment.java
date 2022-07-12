package tsw.uniChar.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tsw.uniChar.Beans.paymentBean;
import tsw.uniChar.model.paymentDAO;

/**
 * Servlet implementation class HandlePayment
 */
@WebServlet("/HandlePayment")
public class HandlePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandlePayment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
		paymentBean pyB = new paymentBean();
		paymentDAO pagamento = new paymentDAO();
		
		
		
		String action = request.getParameter("action");
		if (action == null)
			action = (String)request.getAttribute("action");
		
		String returnTo = request.getParameter("returnto");
		if (returnTo == null)
			returnTo = (String)request.getAttribute("returnto");
		
		if(action != null) {
			
			if (action.equalsIgnoreCase("insert")) {
				
				String numero_carta = request.getParameter("numero_carta");
				String intestatario = request.getParameter("intestatario");
				String mail = request.getParameter("mail");
				String mese = request.getParameter("mese");
				String anno = request.getParameter("anno");
				String scadenza = anno+"-"+mese+"-1";
				String cvv = request.getParameter("cvv");
				
				
				pyB.setNumeroCarta(numero_carta);
				pyB.setIntestatarioCarta(intestatario);
				pyB.setScadenza(scadenza);
				pyB.setCVV(cvv);
				pyB.setMailCliente(mail);
				
				
				pagamento.saveMethodPayment(pyB);
				
				
			}
			
			if(action.equalsIgnoreCase("delete")) {
				String numero_carta = request.getParameter("numero_carta");
				
				pagamento.DeleteMethodPayment(numero_carta, pyB.getMailCliente());
			}
			
			
			if(action.equalsIgnoreCase("update")) {
				String numero_carta = request.getParameter("numero_carta");
				String intestatario = request.getParameter("intestatario");
				String mail = request.getParameter("mail");
				String mese = request.getParameter("mese");
				String anno = request.getParameter("anno");
				String scadenza = anno+"-"+mese+"-1";
				String cvv = request.getParameter("cvv");
				
				
				pyB.setNumeroCarta(numero_carta);
				pyB.setIntestatarioCarta(intestatario);
				pyB.setScadenza(scadenza);
				pyB.setCVV(cvv);
				pyB.setMailCliente(mail);
				
				
				pagamento.UpdateMethodPayment(pyB);
				
				
			}
		}
		
		
	}

	

}
