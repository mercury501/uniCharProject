package tsw.uniChar.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import tsw.uniChar.Beans.productBean;
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
	
	public void insertOrder(orderBean[] order) throws SQLException{
		String sql = "INSERT INTO ORDERS VALUES(?, ?, ?, ?, ?, ?, ?)";
		
		try {
			statement = sqlConn.prepareStatement(sql);
		for (productBean prod : products) {
			statement.setInt(1, );
		}
		}catch (SQLException e) {
			
		}
		
	}
	
}
