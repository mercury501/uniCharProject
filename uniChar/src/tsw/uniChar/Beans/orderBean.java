package tsw.uniChar.Beans;

import java.io.Serializable;

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
	
}
