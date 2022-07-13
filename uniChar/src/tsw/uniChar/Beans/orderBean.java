package tsw.uniChar.Beans;

import java.io.Serializable;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import com.itextpdf.text.Image;

public class orderBean implements Serializable{
	
	private cartBean cart = new cartBean();
	private int userID = 0;
	private orderBean order = null;
	private String date = "";
	private int orderID = 0;
	
	public orderBean getOrder() {
		return order;
	}
	public void setOrder(orderBean order) {
		this.order = order;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public cartBean getCart() {
		return cart;
	}
	public void setCart(cartBean cart) {
		this.cart = cart;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	
	public double getTotale() {
		
		Map <Integer, productBean> prodotti = order.getCart().getProducts();
		Map <Integer, Integer> quantita = order.getCart().getQuantities();
		Set<Integer> prodKeys = prodotti.keySet();
		
		Iterator <Integer> keyIter = prodKeys.iterator();
		
		double prezzoIvatoTotale = 0.0;
		double iva = 0.22;
		
		while(keyIter.hasNext()) {
			int key = keyIter.next();
			productBean prod = prodotti.get(key);
			int quant = quantita.get(key);
			
			double prezzoIvatoProd = prod.getPrezzo() + (prod.getPrezzo() * iva);
			
			prezzoIvatoTotale += prezzoIvatoProd;
		
			
		}
			return prezzoIvatoTotale;
		
	
	}
	
}
