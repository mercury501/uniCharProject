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
		} catch (SQLException e) {

		}
	}

	public paymentBean getPayment(int orderid) {

		String sql = "SELECT ORDER_ID," + "    NUMBER," + "    DATE," + "    NAME,"
				+ "    CVV, USER_ID FROM PAYMENTS WHERE ORDER_ID = ?";

		try {
			statement = sqlConn.prepareStatement(sql);

			statement.setInt(1, orderid);

			ResultSet rs = statement.executeQuery();

			while (rs.next()) {

				pyB.setNumeroCarta(rs.getString(2));
				pyB.setIntestatarioCarta(rs.getString(4));
				pyB.setCVV(rs.getString(5));
				pyB.setScadenza(rs.getString(3));
				pyB.setOrderid(rs.getInt(1));
				pyB.setUserid(rs.getInt(6));

			}

			sqlConn.commit();
			statement.close();

		} catch (SQLException e) {
		} finally {
			releaseConn();

		}
		return pyB;

	}

	public void insertPayment(paymentBean pagamento) {
		String insertSQL = "INSERT INTO PAYMENTS "
				+ " (ORDER_ID, " + 
				"    NUMBER, " + 
				"    DATE, " + 
				"    NAME, " + 
				"    CVV, " +
				" USER_ID " 
				+ ") "
				+ "VALUES (?,?,?,?,?,?)";

		try {

			statement = sqlConn.prepareStatement(insertSQL);

			statement.setInt(1, pagamento.getOrderid());
			statement.setString(2, pagamento.getNumeroCarta());
			statement.setString(3, pagamento.getScadenza());
			statement.setString(4, pagamento.getIntestatarioCarta());
			statement.setString(5, pagamento.getCVV());
			statement.setInt(6, pagamento.getUserid());

			statement.executeUpdate();

			sqlConn.commit();
			statement.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			releaseConn();

		}

	}

	// Salva il metodo di pagamento del cliente

	public void saveMethodPayment(paymentBean pagamento) {

		String insertSQL = "INSERT INTO PAYMENT "
				+ " (NUMERO_CARTA, INTESTATARIO, SCADENZA, CVV, MAIL_CLIENTE) VALUES (?,?,?,?,?)";

		try {

			statement = sqlConn.prepareStatement(insertSQL);

			statement.setString(1, pagamento.getNumeroCarta());
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

	// Permette di cercare una carta tramite il suo numero di carta

	public paymentBean SearchCard(String numero_carta) {

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

	// Permette di elminiare il metodo di pagamento abbinato ad un utente

	public void DeleteMethodPayment(String numero_carta, String email) {

		String sql = "DELETE FROM PAYMENT WHERE NUMERO_CARTA = ? AND MAIL_CLIENTE = ?";

		try {
			statement = sqlConn.prepareStatement(sql);

			statement.setString(1, numero_carta);
			statement.setString(2, email);

			statement.executeUpdate();

			sqlConn.commit();
			statement.close();

		} catch (SQLException e) {
		} finally {
			releaseConn();

		}
	}

	// Aggiorna dati di pagamento
	public void UpdateMethodPayment(paymentBean pyB) {

		String sql = "UPDATE PAYMENT SET NUMERO_CARTA = ?, MAIL_CLIENTE = ?, INTESTATARIO = ?, CVV = ?, SCADENZA = ? WHERE (NUMERO_CARTA = ?)";

		try {
			statement = sqlConn.prepareStatement(sql);

			statement.setString(1, pyB.getNumeroCarta());
			statement.setString(2, pyB.getMailCliente());
			statement.setString(3, pyB.getIntestatarioCarta());
			statement.setString(4, pyB.getCVV());
			statement.setString(5, pyB.getScadenza());

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