package tsw.uniChar.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import tsw.uniChar.Beans.userBean;

public class donationDAO {
	private Connection sqlConn = null;
	private PreparedStatement statement = null;
	
	public donationDAO() {
		try {
		sqlConn = DriverManagerConnectionPool.getConnection();
		}
		catch (SQLException e) {
			
		}
	}
	
	public Float getTotalDonations() throws SQLException {
		Float result = 0.f;
		String sql = "SELECT SUM(AMOUNT)"
				+ " FROM DONATIONS "
				
				+ "WHERE 1 = 1";
		
        try {
	        statement = sqlConn.prepareStatement(sql);
	        
	        ResultSet rs = statement.executeQuery();
        
	        if (rs.next()) 
	        	result = rs.getFloat(1);
	        
	        statement.close();
	        rs.close();
	        releaseConn();
	        
        } catch (SQLException e) {
        	throw e;
        }
		return result;
	}
	
	public Float getUserTotalDonations(int id) throws SQLException {
		Float result = 0.f;
		String sql = "SELECT SUM(AMOUNT)"
				+ " FROM DONATIONS "
				
				+ "WHERE USER_ID = ?";
		
        try {
	        statement = sqlConn.prepareStatement(sql);
	        
	        statement.setInt(1, id);
	        
	        ResultSet rs = statement.executeQuery();
        
	        if (rs.next()) 
	        	result = rs.getFloat(1);
	        
	        statement.close();
	        rs.close();
	        releaseConn();
	        
        } catch (SQLException e) {
        	throw e;
        }
		return result;
	}
	
	
	public int insertDonation(int userid, float amount) throws SQLException{
		String sql = "INSERT INTO DONATIONS "
				+ " (USER_ID, AMOUNT) "
				+ " VALUES "
				+ " (?, ?) ";
		
		try {
	        statement = sqlConn.prepareStatement(sql);
	        
	        statement.setInt(1, userid);
	        statement.setFloat(2, amount);
	       
		        
	        statement.execute();
	        
	         
	        
	        sqlConn.commit();
	        statement.close();

	      

        } catch (SQLException e) {
        	return 1;
        } finally{
        	releaseConn();
        	return 0;
        }
		
		
	}
	
	
	
	private void releaseConn() throws SQLException{
		try {
			DriverManagerConnectionPool.releaseConnection(sqlConn);
		}catch (SQLException e) {
			throw e;
		}
	}
	
}
