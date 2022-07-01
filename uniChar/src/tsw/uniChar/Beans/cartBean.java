package tsw.uniChar.Beans;



import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import tsw.uniChar.model.productDAO;

public class cartBean implements Serializable {
	private productDAO pD = new productDAO();
	
	private Map<Integer, Integer> quantity = new HashMap<>();
	private Map<Integer, productBean> products = new HashMap<>();
	
	public cartBean() {
		
	}
	
	public boolean isEmpty() {
		return products.size() == 0 ? true : false;
	}
	
	public void remove(int id) {
		quantity.remove(id);
		products.remove(id);
	}
	
	public productBean getProduct(int id) {
		return products.get(id);
	}
	
	public Integer getQuantity(int id) {
		return quantity.get(id);
	}
	
	public void addProduct(int id, int quantity) {
		if (getQuantity(id) == null)
			insertProduct(id, quantity);
		else
			updateQuantity(id, quantity);
	}
	
	private void insertProduct(int id, int quantity) {
		this.quantity.put(id, quantity);
		this.products.put(id, pD.getProduct(id));
	}
		
	private void updateQuantity(int id, int quantity) {
		setQuantity(id, this.quantity.get(id) + quantity);
	}
	
	public void setQuantity(int id, int quantity) {
		this.quantity.put(id, quantity);
	}
	
	public int getCartSize() {
		return products.size();
	}
	
	public Map<Integer, productBean> getProducts(){
		return this.products;
	}
	
	public Map <Integer, Integer> getQuantities(){
		return this.quantity;
	}
}
