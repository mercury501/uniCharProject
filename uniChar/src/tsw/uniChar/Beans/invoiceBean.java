package tsw.uniChar.Beans;

import java.io.Serializable;

public class invoiceBean implements Serializable{
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
	
}
