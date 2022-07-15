package tsw.uniChar.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tsw.uniChar.Beans.productBean;
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
	
	
	private userBean newUsers(ResultSet rs) throws SQLException{
		userBean uB = new userBean();
		try {

		uB =  new userBean(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(6), rs.getString(4), "",
				rs.getString(8));
		} catch (SQLException e) {
			throw e;
		} finally {
			return uB;
		}

	}
	
	
	private userBean newUser(ResultSet rs) throws SQLException{
		userBean uB = new userBean();
		try {

		uB =  new userBean(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),
				rs.getString(8));
		} catch (SQLException e) {
			throw e;
		} finally {
			return uB;
		}

	}
	
	public void gestisciInserimento(userBean user) throws Exception{
		if (user.getId() == -1)
				doAddUser(user);
		else
			doUpdateUser(user);				
	}

	public userBean doCheckLogin(userBean user) throws SQLException {
		userBean uB = new userBean();
		String sql = "SELECT ID, NAME, SURNAME, ROLE, EMAIL"
				+ " FROM USERS "
				+ "WHERE BINARY USERNAME = ? AND BINARY PASSWORD = ?";
		
        try {
	        statement = sqlConn.prepareStatement(sql);
	        
	        statement.setString(1, user.getUser());
	        statement.setString(2, user.getPassword());
	        
	        ResultSet rs = statement.executeQuery();
        
	        if (rs.next()) 
	        	uB = new userBean(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), "","", rs.getString(5));
	        
	        statement.close();
	        rs.close();
	        releaseConn();
	        
        } catch (SQLException e) {
        	throw e;
        }
		return uB;
	}
	
	public userBean doGetUserByID(int id) throws SQLException {
		userBean uB = new userBean();
		String sql = "SELECT ID, NAME, SURNAME, ROLE, USERNAME, EMAIL, PASSWORD"
				+ " FROM USERS "
				
				+ "WHERE ID = ?";
		
        try {
	        statement = sqlConn.prepareStatement(sql);
	        
	        statement.setInt(1, id);
	        
	        ResultSet rs = statement.executeQuery();
        
	        if (rs.next()) 
	        	uB = new userBean(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(7), rs.getString(6));
	        
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
				+ " (NAME, SURNAME, USERNAME, PASSWORD, EMAIL, ROLE) "
				+ " VALUES "
				+ " (?, ?, ?, ?, ?, ?) ";
		
		try {
	        statement = sqlConn.prepareStatement(sql);
	        
	        statement.setString(1, user.getName());
	        statement.setString(2, user.getSurname());
	        statement.setString(3, user.getUser());
	        statement.setString(4, user.getPassword());
	        statement.setString(5, user.getEmail());
	        statement.setString(6, "user");
		        
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
	
	public int doUpdateUser(userBean user) throws Exception{
		String sql = "UPDATE USERS "
				+ " SET " +
				" NAME = ?, " +
				" SURNAME = ?, " +
				" USERNAME = ?, " +
				" PASSWORD = ?, " +
				" ROLE = ?," +
				" EMAIL = ? " 
				
				+ " WHERE "
				+ " ID = ? ";
		
		try {
		
		
	        statement = sqlConn.prepareStatement(sql);
	        
	        statement.setString(1, user.getName());
	        statement.setString(2, user.getSurname());
	        statement.setString(3, user.getUser());
	        statement.setString(4, user.getPassword());
	        statement.setString(5, user.getRole());
	        statement.setString(6, user.getEmail());
	        
	        statement.setInt(7, user.getId());	        

	        statement.executeUpdate();
	        
	        sqlConn.commit();
	        statement.close();
	        releaseConn();
        } catch (SQLException e) {
        	throw e;
        }
		return 0;
		
	}
	
	
	public int updateUserAccount(userBean user) throws Exception{
		String sql = "UPDATE USERS "
				+ " SET " +
				" NAME = ?, " +
				" SURNAME = ?, " +
				" USERNAME = ?, " +
				" PASSWORD = ?, " +
				" EMAIL = ? " 
				
				+ " WHERE "
				+ " ID = ? ";
		
		try {
		
		
	        statement = sqlConn.prepareStatement(sql);
	        
	        statement.setString(1, user.getName());
	        statement.setString(2, user.getSurname());
	        statement.setString(3, user.getUser());
	        statement.setString(4, user.getPassword());
	        statement.setString(5, user.getEmail());
	        
	        statement.setInt(6, user.getId());	        

	        statement.executeUpdate();
	        
	        sqlConn.commit();
	        statement.close();
	        releaseConn();
        } catch (SQLException e) {
        	throw e;
        }
		return 0;
		
	}
	
	
	public int doDeleteUser(int id) {
		String sql = "DELETE FROM USERS "
				+ " WHERE "
				+ " ID = ? ";
		
		try {
	        statement = sqlConn.prepareStatement(sql);
	        
	        statement.setInt(1, id);

	        statement.executeUpdate();
	        
	        sqlConn.commit();
	        statement.close();
	        releaseConn();
        } catch (SQLException e) {
        	return 1;
        }
		return 0;
		
	}
	
	public int doDeleteUser(userBean user) {
		String sql = "DELETE FROM USERS "
				+ " WHERE "
				+ " USERNAME = ? AND PASSWORD = ? ";
		
		try {
	        statement = sqlConn.prepareStatement(sql);
	        
	        statement.setString(1, user.getUser());
	        statement.setString(2, user.getPassword());

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
	
	public List<userBean> showUsers(userBean users) {
		
		List<userBean> uD = null;
		
		String sql = "SELECT * FROM USERS";
		
		try {
			statement = sqlConn.prepareStatement(sql);

			ResultSet rs = statement.executeQuery();

			uD = new ArrayList<userBean>();

			while (rs.next()) {
				
				uD.add(newUsers(rs));
				

			}

			statement.close();
			statement.close();
			releaseConn();
			

		} catch (SQLException e) {

		} finally {
			
			return uD;
		}

	}
	
	public boolean controllaEsistenza(int id) {
		boolean ret = false;
		userBean uB = new userBean();
		
		String sql = "SELECT * FROM USERS WHERE ID = ?";
		
		
		try {
	        statement = sqlConn.prepareStatement(sql);
	        
	        statement.setInt(1, id);

	        ResultSet rs = statement.executeQuery();
	        
	        if (rs.next()) 
	        	ret = true;
	        
	        sqlConn.commit();
	        statement.close();
	        releaseConn();
        } catch (SQLException e) {
        	
        }
		return ret;
		
	}
	
	public userBean getUser(String email) {
		
		userBean uB = new userBean();
		
		String sql = "SELECT ID,NAME,SURNAME,USERNAME,PASSWORD,EMAIL"
				+ " FROM USERS WHERE EMAIL = ?";
		
		
		try {
	        statement = sqlConn.prepareStatement(sql);
	        
	        statement.setString(1, email);

	        ResultSet rs = statement.executeQuery();
	        
	        if (rs.next()) 
	        	uB = new userBean(rs.getInt(1), rs.getString(2), rs.getString(3),"", rs.getString(4),rs.getString(5),rs.getString(6));
	        
	        sqlConn.commit();
	        statement.close();
	        releaseConn();
        } catch (SQLException e) {
        	
        }
		return uB;
		
	}
	
	}



