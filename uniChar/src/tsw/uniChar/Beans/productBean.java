package tsw.uniChar.Beans;

import java.io.Serializable;

public class productBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id = -1;
	private float prezzo = 0;
	private String descrizione = "";
	private String titolo = "";
	private String sviluppatore = "";
	
	private String imageOne = "";
	private String imageTwo = "";
	private String imageThree = "";
	private float discountPerc = 0;
	private int stock = 0;

	public productBean(int id, float prezzo, String descrizione, String titolo,
			String sviluppatore, String imageOne, String imageTwo, String imageThree,
			float discountPerc, int stock) {
		this.id = id;
		this.prezzo = prezzo;
		this.descrizione = descrizione;
		this.titolo = titolo;
		this.sviluppatore = sviluppatore;
		this.imageOne = imageOne;
		this.imageTwo = imageTwo;
		this.imageThree = imageThree;
		this.discountPerc = discountPerc;
		this.stock = stock;
	}

	public productBean() {
		
	}
	
	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getPrezzo() {
		return this.prezzo;
	}

	public void setPrezzo(float prezzo) {
		this.prezzo = prezzo;
	}

	public String getDescrizione() {
		return this.descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public String getTitolo() {
		return this.titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getSviluppatore() {
		return this.sviluppatore;
	}

	public void setSviluppatore(String sviluppatore) {
		this.sviluppatore = sviluppatore;
	}

	public String getImageOne() {
		return this.imageOne;
	}

	public void setImageOne(String imageOne) {
		this.imageOne = imageOne;
	}

	public String getImageTwo() {
		return this.imageTwo;
	}

	public void setImageTwo(String imageTwo) {
		this.imageTwo = imageTwo;
	}

	public String getImageThree() {
		return this.imageThree;
	}

	public void setImageThree(String imageThree) {
		this.imageThree = imageThree;
	}

	public void setDiscountPerc(float discountPerc) {
		this.discountPerc = discountPerc;
	}
	
	public float getDiscountPerc() {
		return this.discountPerc;
	}
	
	
	
}