package tsw.uniChar.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
	
	public Integer insertOrder(orderBean order) throws SQLException {
		int orderID = getNextOrderID();
		float donation = 0.f;
		String sql = "INSERT INTO ORDERS VALUES(?, ?, ?, CURDATE(), ?, ?, ?)";

		try {
			statement = sqlConn.prepareStatement(sql);
			statement.setInt(1, order.getUserID());
			statement.setInt(2, orderID);
			statement.setInt(5, 2);

			for (Map.Entry<Integer, productBean> set : order.getCart().getProducts().entrySet()) {

				statement.setInt(3, set.getKey());
				statement.setInt(4, order.getCart().getQuantity(set.getKey()));
				statement.setFloat(6, set.getValue().getPrezzo() + set.getValue().getPrezzo() * 0.05f );
				
				donation += set.getValue().getPrezzo() * 0.05f;
				
				statement.executeUpdate();

			}
			statement.close();
			sqlConn.commit();
			releaseConn();
			
			donationDAO dD = new donationDAO();
			
			dD.insertDonation(order.getUserID(), donation);

		} catch (SQLException e) {
			e.printStackTrace(System.out);
		}
		return orderID;
	}
	
	public orderBean getOrder(int id) {
		orderBean oB = new orderBean();
		cartBean cB = new cartBean();

		String sql = " SELECT " +
				" USER_ID, " + 
				" ORDER_ID, " + 
				" PRODUCT_ID, " + 
				" PURCH_DATE, " + 
				" QUANTITY, " + 
				" ORDER_STATUS ," + 
				" UNIT_PRICE " +
				
				" FROM ORDERS " +
				" WHERE ORDER_ID = ? ";

		try {
			statement = sqlConn.prepareStatement(sql);
			statement.setInt(1, id);

			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				oB.setUserID(rs.getInt(1));
				
				cB.addProduct(rs.getInt(3), rs.getInt(5));
				
				cB.setProductPrice(rs.getInt(3), rs.getFloat(7));

			}
			
			oB.setCart(cB);
			
			statement.close();
			rs.close();
		} catch (SQLException e) {
			oB = new orderBean();
		} finally {
			return oB;
		}

	}
	
	public orderBean getInvoice(int id) {
		orderBean oB = new orderBean();
		cartBean cB = new cartBean();

		String sql = " SELECT " +
				" USER_ID, " + 
				" ORDER_ID, " + 
				" PRODUCT_ID, " + 
				" PURCH_DATE, " + 
				" QUANTITY, " + 
				" ORDER_STATUS ," + 
				" UNIT_PRICE " +
				
				" FROM ORDERS " +
				" WHERE ORDER_ID = ? ";

		try {
			statement = sqlConn.prepareStatement(sql);
			statement.setInt(1, id);

			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				oB.setUserID(rs.getInt(1));
				
				cB.addProduct(rs.getInt(3), rs.getInt(5));
				
				cB.setProductPrice(rs.getInt(3), rs.getFloat(7));
				
				oB.setDate(rs.getString(4));
				oB.setOrderID(rs.getInt(2));

			}
			
			oB.setCart(cB);
			
			statement.close();
			rs.close();
		} catch (SQLException e) {
			
		} finally {
			return oB;
		}

	}
	
	public ArrayList<orderBean> getInvoices() {
		ArrayList<orderBean> orderlist = new ArrayList<orderBean>();
		

		String sql = " SELECT " +
				" DISTINCT ORDER_ID " + 
				
				" FROM ORDERS " +
				" WHERE 1 = 1 ";

		try {
			statement = sqlConn.prepareStatement(sql);

			ResultSet rs = statement.executeQuery();

			while (rs.next()) {

				orderlist.add(getInvoice(rs.getInt(1)));

			}
						
			statement.close();
			rs.close();
		} catch (SQLException e) {
			
		} finally {
			return orderlist;
		}

	}
	
	public ArrayList<orderBean> getUserInvoices(int userid) {
		ArrayList<orderBean> orderlist = new ArrayList<orderBean>();

		String sql = " SELECT " +
				" DISTINCT ORDER_ID" +
				
				" FROM ORDERS " +
				" WHERE USER_ID = ? ";

		try {
			statement = sqlConn.prepareStatement(sql);
			statement.setInt(1, userid);

			ResultSet rs = statement.executeQuery();

			
			while (rs.next()) {
				
				orderlist.add(getInvoice(rs.getInt(1)));

			}
						
			statement.close();
			rs.close();
		} catch (SQLException e) {
			
		} finally {
			return orderlist;
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
