package tsw.uniChar.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import tsw.uniChar.Beans.userBean;
import tsw.uniChar.control.HandleUsers;;

public class userDAO  {
	private Connection sqlConn = null;
	private PreparedStatement statement = null;
	
	public userDAO() {
		try {
		sqlConn = DriverManagerConnectionPool.getConnection();
		}
		catch (SQLException e) {
			
		}
	}
	

	public userBean doCheckLogin(userBean user) throws SQLException {
		userBean uB = new userBean();
		String sql = "SELECT ID, NAME, SURNAME, ROLE"
				+ " FROM USERS "
				+ "WHERE USERNAME = ? AND PASSWORD = ?";
		
        try {
	        statement = sqlConn.prepareStatement(sql);
	        
	        statement.setString(1, user.getUser());
	        statement.setString(2, user.getPassword());
	        
	        ResultSet rs = statement.executeQuery();
	        
	        if (rs.next()) 
	        	uB = new userBean(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), user.getUser(), "");
	        
	        statement.close();
	        rs.close();
	        releaseConn();
	        
        } catch (SQLException e) {
        	throw e;
        }
		return uB;
	}
	
	public int doAddUser(userBean user) throws SQLException{
		String sql = "INSERT INTO USERS "
				+ " (NAME, SURNAME, ROLE, USERNAME, PASSWORD, ROLE) "
				+ " VALUES "
				+ " (?, ?, ?, ?, ?, ?) ";
		
		try {
	        statement = sqlConn.prepareStatement(sql);
	        
	        statement.setString(1, user.getName());
	        statement.setString(2, user.getSurname());
	        statement.setString(3, user.getRole());
	        statement.setString(4, user.getUser());
	        statement.setString(5, user.getPassword());
	        statement.setString(6, "USER");
	        
	        
	        statement.executeUpdate();
	        
	        statement.close();
	        
	        sqlConn.commit();
	        releaseConn();
        } catch (SQLException e) {
        	return 1;
        }
		return 0;
		
	}
	
	private void releaseConn() throws SQLException{
		try {
			DriverManagerConnectionPool.releaseConnection(sqlConn);
		}catch (SQLException e) {
			throw e;
		}
	}
	
	public int doChangePassword(userBean user) throws Exception{
		String sql = "UPDATE USERS "
				+ " SET PASSWORD = ? "
				+ " WHERE "
				+ " USERNAME = ? AND PASSWORD = ? ";
		
		try {
			if (!doCheckPassword(user))
				throw new Exception();
			
	        statement = sqlConn.prepareStatement(sql);
	        
	        statement.setString(1, user.getNewPassword());
	        statement.setString(2, user.getUser());
	        statement.setString(3, user.getPassword());

	        statement.executeUpdate();
	        
	        sqlConn.commit();
	        statement.close();
	        releaseConn();
        } catch (Exception e) {
        	throw e;
        }
		return 0;
		
	}
	
	public int doDeleteUser(userBean user) {
		String sql = "DELETE FROM USERS "
				+ " WHERE "
				+ " USERNAME = ? AND PASSWORD = ? ";
		
		try {
	        statement = sqlConn.prepareStatement(sql);
	        
	        statement.setString(2, user.getUser());
	        statement.setString(3, user.getPassword());

	        statement.executeUpdate();
	        
	        sqlConn.commit();
	        statement.close();
	        releaseConn();
        } catch (SQLException e) {
        	return 1;
        }
		return 0;
		
	}
	
	private boolean doCheckPassword(userBean user) {
		String pass = "";
		String sql = "SELECT PASSWORD"
				+ " FROM USERS "
				+ "WHERE USERNAME = ?";
		
        try {
	        statement = sqlConn.prepareStatement(sql);
	        
	        statement.setString(1, user.getUser());
	        
	        ResultSet rs = statement.executeQuery();
	        
	        if (rs.next()) 
	        	pass = rs.getString(1);

	        statement.close();
	        rs.close();
	        releaseConn();
	        
	        if (pass.equals(user.getPassword()))
	        	return true;
	        return false;
	        
        } catch (SQLException e) {
        	return false;
        }
	}


}
