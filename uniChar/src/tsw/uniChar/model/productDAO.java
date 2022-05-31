package tsw.uniChar.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.xdevapi.Statement;

import tsw.uniChar.Beans.productBean;

public class productDAO  {
	private Connection sqlConn = null;
	private PreparedStatement statement = null;
	private PreparedStatement countStatement = null;
	
	public productDAO() {
		try {
		sqlConn = DriverManagerConnectionPool.getConnection();
		}
		catch (SQLException e) {
			
		}
	}
	
	public boolean insertProduct(productBean pB) {
	
		
		
		
		
		String sql = "INSERT INTO PRODUCTS (PRICE, DESCR, TITLE, DEVELOPER, IMG_PATH_ONE, IMG_PATH_TWO, IMG_PATH_THREE"
				+ ") VALUES (?, ?, ?, ?, ?, ?, ?) ";
		
		try {
			statement = sqlConn.prepareStatement(sql);
			
			statement.setFloat(1, pB.getPrezzo());
			statement.setString(2, pB.getDescrizione());
			statement.setString(3, pB.getTitolo());
			statement.setString(4, pB.getSviluppatore());
			statement.setString(5, pB.getImageOne());
			statement.setString(6, pB.getImageTwo());
			statement.setString(7, pB.getImageThree());
			
			statement.execute();
			
			sqlConn.commit();
			statement.close();
			
			
		}catch (SQLException e) {
			return false;
		}finally {
			releaseConn();
			return true;
		}

	}
		
	public boolean controllaEsistenza(productBean pB)  {
		
		
		
		
		String sql = "SELECT COUNT(*) FROM PRODUCTS WHERE ID = ?";


		try {
			statement = sqlConn.prepareStatement(sql);
			statement.setInt(1,pB.getId());
			
			
			ResultSet rs = statement.executeQuery();
		
			rs.next();
			
			
			if(rs.getInt(1) == 1)
			{
				return true;
			}
			else {
				return false;
			}
		}
		
		 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
		
		
	
	
	public boolean gestisciSalvataggio(productBean pB) 
	{
		if(controllaEsistenza(pB) == false) {
			insertProduct(pB);
			return true;
		}
		else {
			updateProduct(pB);
			return false;
		}
	}
	
	public boolean updateProduct(productBean pB)
	{
		
		
	
		
		String sql = "UPDATE PRODUCTS SET PRICE = ?, DESCR = ?, TITLE = ?, DEVELOPER = ?, IMG_PATH_ONE = ?, IMG_PATH_TWO = ?, IMG_PATH_THREE = ? WHERE ID = ? ";
		
		try {
			statement = sqlConn.prepareStatement(sql);
			
			statement.setFloat(1, pB.getPrezzo());
			statement.setString(2, pB.getDescrizione());
			statement.setString(3, pB.getTitolo());
			statement.setString(4, pB.getSviluppatore());
			statement.setString(5, pB.getImageOne());
			statement.setString(6, pB.getImageTwo());
			statement.setString(7, pB.getImageThree());
			statement.setInt(8, pB.getId());
			
			statement.execute();
			
			sqlConn.commit();
			statement.close();
			
			
		}catch (SQLException e) {
			return false;
		}finally {
			releaseConn();
			return true;
		}
	}
	
	public boolean deleteProduct(int id)
	{
		
		String sql = "DELETE FROM PRODUCTS  WHERE ID = ?";
		try {
			statement = sqlConn.prepareStatement(sql);
			
			statement.setInt(1,id);
			
			statement.execute();
			
			sqlConn.commit();
			statement.close();
			
			
		}catch (SQLException e) {
			return false;
		}finally {
			releaseConn();
			return true;
		}
	}
	
		
	
	
	public productBean getProduct(int id) {
		productBean pB = null;
		
		String sql = "SELECT ID, PRICE, DESCR, TITLE, DEVELOPER, IMG_PATH_ONE, IMG_PATH_TWO, IMG_PATH_THREE " 
				+ " FROM PRODUCTS WHERE ID = ?";
		
	
		
		try {
			statement = sqlConn.prepareStatement(sql);
			statement.setInt(1,id);
			
			ResultSet rs = statement.executeQuery();
		
			while(rs.next()==true)
			
			pB = new productBean(rs.getInt(1), rs.getFloat(2), rs.getString(3), rs.getString(4),
					rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
			
		
		}catch (SQLException e) {
			pB = new productBean();
		}finally {
			return pB;
		}
		
		
	}
	
	public List<productBean> getProducts(int number) {
		List<productBean> pB = null;
		int count = 0;

		String sql = "SELECT ID, PRICE, DESCR, TITLE, DEVELOPER, IMG_PATH_ONE, IMG_PATH_TWO, IMG_PATH_THREE " 
		+ " FROM PRODUCTS ";

		String sqlCount = "SELECT COUNT (*) FROM (" + sql + ")";



		try {
			statement = sqlConn.prepareStatement(sql);
			statement.setInt(1, number);

			countStatement = sqlConn.prepareStatement(sqlCount);
			countStatement.setInt(1, number);

			ResultSet rsCount = countStatement.executeQuery();

			if (rsCount.getInt(1) == 0)
				return new ArrayList<productBean>();

			ResultSet rs = statement.executeQuery();

			pB = new ArrayList<productBean>();

			while (rs.next()) {
				pB.add(new productBean(rs.getInt(1), rs.getFloat(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
				
				count++;

			}
			
			statement.close();
			countStatement.close();

		} catch (SQLException e) {
			
		} finally {
			releaseConn();
			return pB;
		}
		
	}
	
	
	public List<productBean> getProducts()
	{
		List<productBean> products  = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM PRODUCTS";
			statement = sqlConn.prepareStatement(sql);
			ResultSet resultset = statement.executeQuery(sql);
			
			while(resultset.next())
			{
				productBean p = new productBean(
				
				resultset.getInt("ID"),
				resultset.getFloat("PRICE"),
				resultset.getString("DESCR"),
				resultset.getString("TITLE"),
				resultset.getString("DEVELOPER"),
				resultset.getString("IMG_PATH_ONE"),
				resultset.getString("IMG_PATH_TWO"),
				resultset.getString("IMG_PATH_THREE")
					
			);
				
				products.add(p);
		
			}
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return products;
		
	}
	
	
	
	
	
	
	private void releaseConn() {
		try {
			DriverManagerConnectionPool.releaseConnection(sqlConn);
		}catch (SQLException e) {
			
		}
	}

}