package tsw.uniChar.Beans;

import java.io.Serializable;

public class paymentBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String NumeroCarta;
	private String MailCliente;
	private String IntestatarioCarta;
	private String CVV;
	private String Scadenza;
	  
	public paymentBean() {
		
		NumeroCarta = "";
		MailCliente = "";
		IntestatarioCarta = "";
		CVV = "";
		Scadenza = "";
		
	}

	public String getNumeroCarta() {
		return NumeroCarta;
	}

	public void setNumeroCarta(String numeroCarta) {
		NumeroCarta = numeroCarta;
	}

	public String getMailCliente() {
		return MailCliente;
	}

	public void setMailCliente(String mailCliente) {
		MailCliente = mailCliente;
	}

	public String getIntestatarioCarta() {
		return IntestatarioCarta;
	}

	public void setIntestatarioCarta(String intestatarioCarta) {
		IntestatarioCarta = intestatarioCarta;
	}

	public String getCVV() {
		return CVV;
	}

	public void setCVV(String cVV) {
		CVV = cVV;
	}

	public String getScadenza() {
		return Scadenza;
	}

	public void setScadenza(String date) {
		Scadenza = date;
	}
	
}