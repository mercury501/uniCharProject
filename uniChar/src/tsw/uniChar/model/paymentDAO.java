package tsw.uniChar.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import tsw.uniChar.Beans.paymentBean;

public class paymentDAO {
	private Connection sqlConn = null;
	private PreparedStatement statement = null;
	paymentBean pyB = new paymentBean();
	
		

	public paymentDAO() {
		try {
			sqlConn = DriverManagerConnectionPool.getConnection();
			}
			catch (SQLException e) {
				
			}
	}
	
	
	
	//Salva il metodo di pagamento del cliente
	
	public void saveMethodPayment(paymentBean pagamento) {
		

		
		String insertSQL = "INSERT INTO PAYMENT "
				+ " (NUMERO_CARTA, INTESTATARIO, SCADENZA, CVV, MAIL_CLIENTE) VALUES (?,?,?,?,?)";

		try {

			statement = sqlConn.prepareStatement(insertSQL);
			
			statement.setString(1, pagamento.getNumeroCarta() );
			statement.setString(2, pagamento.getIntestatarioCarta());
			statement.setString(3, pagamento.getScadenza());
			statement.setString(4, pagamento.getCVV());
			statement.setString(5, pagamento.getMailCliente()); 

			statement.executeUpdate();

			sqlConn.commit();
		
			
		sqlConn.commit();
		statement.close();

	} catch (SQLException e) {
	} finally {
		releaseConn();
		
	}

		
	}
	
	
	//Permette di cercare una carta tramite il suo numero di carta
	
	public paymentBean SearchCard (String numero_carta) {
		
		String sql = "SELECT * FROM PAYMENT WHERE NUMERO_CARTA = ?";
		
		try {
		statement = sqlConn.prepareStatement(sql);

		statement.setString(1, numero_carta);
		
		
		ResultSet rs = statement.executeQuery();

		while (rs.next()) {
			
			pyB.setNumeroCarta(rs.getString("numero_carta"));
			pyB.setMailCliente(rs.getString("mail_cliente"));
			pyB.setIntestatarioCarta(rs.getString("intestatario_carta"));
			pyB.setCVV(rs.getString("cvv"));
			pyB.setScadenza(rs.getString("scadenza"));
			
			
		}

			sqlConn.commit();
			statement.close();

			} catch (SQLException e) {
		} finally {
			releaseConn();
	
		}
	return pyB;
		
	}
	
	
	//Permette di elminiare il metodo di pagamento abbinato ad un utente
	
	public void DeleteMethodPayment(String numero_carta, String intestatario) {
		
		
		String sql = "DELETE FROM PAYMENT WHERE NUMERO_CARTA = ? AND MAIL_CLIENTE = ?";
		
		
		try {
			statement = sqlConn.prepareStatement(sql);
			
			
			statement.setString(1, numero_carta);
			statement.setString(2, intestatario);
			
			statement.executeUpdate();
			
			sqlConn.commit();
			statement.close();

			} catch (SQLException e) {
		} finally {
			releaseConn();
	
		}
	}
		
	
	
	
	
	
	private void releaseConn() {
		try {
			DriverManagerConnectionPool.releaseConnection(sqlConn);
		} catch (SQLException e) {

		}
	}

	
}