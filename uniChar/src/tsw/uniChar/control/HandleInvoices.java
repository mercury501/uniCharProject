package tsw.uniChar.control;

import java.io.IOException;
import java.text.DecimalFormat;
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
import tsw.uniChar.model.orderDAO;
import tsw.uniChar.model.userDAO;

/**
 * Servlet implementation class HandleInvoices
 */
@WebServlet("/HandleInvoices")
public class HandleInvoices extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private userDAO uD = null;
	private orderDAO oD = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleInvoices() {
    	
        super();
        uD = new userDAO();
        oD = new orderDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		orderBean order = (orderBean)request.getAttribute("order");
		
		Integer id = Integer.valueOf(request.getParameter("id"));
		if (id == null)
			id = (Integer)request.getAttribute("id");
		if (id == null)
			return;
		
		order = oD.getOrder(id);
		
		if((Integer)request.getSession().getAttribute("userid") == null) {
			response.sendRedirect("index.jsp");
			return;
		}
		
		String role = (String)request.getSession().getAttribute("role");
		
		if (role == null)
			return;
		
		if (!role.equals("admin"))
			if (order.getUserID() != (Integer)request.getSession().getAttribute("userid")) {
				response.sendRedirect("index.jsp");
				return;
			}
		
		if (order == null)
			return;
		
		userBean user = null;
		
		try {
		user = uD.doGetUserByID(order.getUserID());
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			Document doc = new Document();
			
			PdfWriter.getInstance(doc, response.getOutputStream());
			
			doc.open();
			
			Font font = new Font(Font.FontFamily.HELVETICA, 20, Font.BOLD);
			
			Image uniCharLogo = Image.getInstance(getServletContext().getRealPath("/images/logoPDF.png"));
			uniCharLogo.scalePercent(30);
			
			
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
			prodottiPdfTable.setWidthPercentage(90);
			
			DecimalFormat formatPrice = new DecimalFormat();
			formatPrice.setMaximumFractionDigits(2);
			formatPrice.setMinimumFractionDigits(2);
            
            prodottiPdfTable.addCell("Immagine");
            prodottiPdfTable.addCell("Articolo");
            prodottiPdfTable.addCell("Quantita'");
            prodottiPdfTable.addCell("IVA");
            prodottiPdfTable.addCell("Totale IVAto");
			
			Map <Integer, productBean> prodotti = order.getCart().getProducts();
			Map <Integer, Integer> quantita = order.getCart().getQuantities();
			Set<Integer> prodKeys = prodotti.keySet();
			
			Iterator <Integer> keyIter = prodKeys.iterator();
			
			double prezzoIvatoTotale = 0.0;
			double iva = 0.22;
			String euro = "\u20ac";
			
			while(keyIter.hasNext()) {
				int key = keyIter.next();
				productBean prod = prodotti.get(key);
				int quant = quantita.get(key);
				
				double prezzoIvatoProd = prod.getPrezzo() * quant + ((prod.getPrezzo() * quant) * iva);
				
				prezzoIvatoTotale += prezzoIvatoProd;
				
				Image prodImage = Image.getInstance(getServletContext().getRealPath("/images/products/" + prod.getImageOne()));
				
				prodottiPdfTable.addCell(prodImage);
				prodottiPdfTable.addCell(prod.getTitolo());
				prodottiPdfTable.addCell(String.valueOf(quant));
				prodottiPdfTable.addCell(String.valueOf(iva * 100) + "%");
				prodottiPdfTable.addCell(euro + formatPrice.format(prezzoIvatoProd));

			}
			
			PdfPTable totaleTable = new PdfPTable(2);
			totaleTable.setWidthPercentage(90);
			
			totaleTable.addCell(new Phrase("Totale: ", font));
			totaleTable.addCell(new Phrase(euro + formatPrice.format(prezzoIvatoTotale), font));
			
			PdfPTable donationTable = new PdfPTable(2);
			donationTable.setWidthPercentage(90);
			
			donationTable.addCell(new Phrase("Totale in beneficenza: ", font));
			donationTable.addCell(new Phrase(euro + formatPrice.format(prezzoIvatoTotale / 0.05f)));
			
			doc.add(prodottiPdfTable);
			doc.add(totaleTable);
			doc.add(donationTable);
			doc.close();
			
		}catch (Exception e) {
			System.out.println("Errore nella generazione della invoice.");
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
