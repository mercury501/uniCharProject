package tsw.uniChar.control;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;

import tsw.uniChar.Beans.orderBean;
import tsw.uniChar.Beans.productBean;
import tsw.uniChar.Beans.userBean;
import tsw.uniChar.model.userDAO;

/**
 * Servlet implementation class HandleInvoices
 */
@WebServlet("/HandleInvoices")
public class HandleInvoices extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private userDAO uD = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleInvoices() {
    	
        super();
        uD = new userDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO gather all order data
		orderBean order = (orderBean)request.getAttribute("order");
		userBean user = null;
		
		try {
		user = uD.doGetUserByID(order.getUserID());
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			Document doc = new Document();
			
			PdfWriter.getInstance(doc, response.getOutputStream());
			
			Font font = new Font(Font.FontFamily.TIMES_ROMAN, 20, Font.BOLD);
			
			//TODO manca logo
			Image uniCharLogo = Image.getInstance(getServletContext().getRealPath("/images/logo.png"));
			uniCharLogo.scalePercent(20);
			
			
			PdfPTable head = new PdfPTable(2);
			PdfPCell logo = new PdfPCell(uniCharLogo);
			PdfPCell utente = new PdfPCell(new Phrase(user.toString()));
			
			logo.setBorder(Rectangle.NO_BORDER);
			utente.setBorder(Rectangle.NO_BORDER);
			
			head.addCell(logo);
			head.addCell(utente);
			
			head.setSpacingAfter(20);
			head.setWidthPercentage(90);
			
			doc.add(head);
			
			//table per i prodotti
			
			PdfPTable prodottiPdfTable = new PdfPTable(5);
            
            prodottiPdfTable.addCell("Immagine");
            prodottiPdfTable.addCell("Articolo");
            prodottiPdfTable.addCell("Quantita'");
            prodottiPdfTable.addCell("IVA");
            prodottiPdfTable.addCell("Prezzo IVAto totale");
			
			Map <Integer, productBean> prodotti = order.getCart().getProducts();
			Map <Integer, Integer> quantita = order.getCart().getQuantities();
			Set prodKeys = prodotti.keySet();
			
			Iterator <Integer> keyIter = prodKeys.iterator();
			
			while(keyIter.hasNext()) {
				int key = keyIter.next();
				productBean prod = prodotti.get(key);
				int quant = quantita.get(key);
				
				//TODO iva?
				double iva = 0.22;
				
				Image prodImage = Image.getInstance(getServletContext().getRealPath("/images/" + prod.getImageOne()));
				
				prodottiPdfTable.addCell(prodImage);
				prodottiPdfTable.addCell(prod.getTitolo());
				prodottiPdfTable.addCell(String.valueOf(quant));
				prodottiPdfTable.addCell(String.valueOf(iva * 100) + "%");
				todo
				
				
				
			}
			
		}catch (Exception e) {
			System.out.println("Errore nella generazione della invoice.");
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
