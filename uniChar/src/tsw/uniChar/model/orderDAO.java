package tsw.uniChar.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import tsw.uniChar.Beans.productBean;
import tsw.uniChar.Beans.cartBean;
import tsw.uniChar.Beans.orderBean;;

public class orderDAO {
	private Connection sqlConn = null;
	private PreparedStatement statement = null;
	
	public orderDAO() {
		try {
			sqlConn = DriverManagerConnectionPool.getConnection();
		}catch (SQLException e) {
			
		}
	}
	
	public void insertOrder(orderBean order) throws SQLException {
		int orderID = getNextOrderID();

		String sql = "INSERT INTO ORDERS VALUES(?, ?, ?, CURDATE(), ?, ?, ?)";

		try {
			statement = sqlConn.prepareStatement(sql);
			statement.setInt(1, order.getUserID());
			statement.setInt(2, orderID);
			statement.setInt(5, 2);

			for (Map.Entry<Integer, productBean> set : order.getCart().getProducts().entrySet()) {

				statement.setInt(3, set.getKey());
				statement.setInt(4, order.getCart().getQuantity(set.getKey()));
				statement.setFloat(6, set.getValue().getPrezzo());

				statement.executeUpdate();

			}
			statement.close();
			sqlConn.commit();
			releaseConn();

		} catch (SQLException e) {
			e.printStackTrace(System.out);
		}

	}
	
	private int getNextOrderID() throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		int nextOrder = -1;
		
		String sql = "SELECT MAX(ORDER_ID) + 1 FROM ORDERS ";
		try {
			ps = sqlConn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			if (rs.next())
				nextOrder = rs.getInt(1);
			
			
				
			
		}catch (SQLException e) {
			
		}
		
		return nextOrder;
		
	}
	private void releaseConn() throws SQLException{
		try {
			DriverManagerConnectionPool.releaseConnection(sqlConn);
		}catch (SQLException e) {
			throw e;
		}
	}
}
