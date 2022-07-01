package tsw.uniChar.Beans;

import java.io.Serializable;

public class orderBean implements Serializable{
	
	private cartBean cart = new cartBean();
	private int userID = 0;
	
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
