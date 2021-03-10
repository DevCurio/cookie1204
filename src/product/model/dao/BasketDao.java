package product.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import product.model.vo.Basket;
import board.model.vo.Notice;
import board.model.vo.Qna;

public class BasketDao {
	
	Properties prop = new Properties();
	
	public BasketDao() {
		
		try {
			String fileName = BasketDao.class.getResource("/sql/product-order-query.properties").getPath();
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	

	public List<Basket> selectBasketList(Connection conn,String memberId) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Basket> list = new ArrayList<>();
		String sql = prop.getProperty("selectBasketList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,memberId);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Basket b= new Basket();
				b.setBasketNum(rset.getInt("basket_num"));
				b.setDessertName(rset.getString("dessert_Name"));
				b.setBasketAmountNum(rset.getInt("basket_Amount"));
				b.setBasketSumMoney(rset.getInt("basket_Sum_Money"));
				b.setBasketDelete(rset.getString("basket_Delete"));
				b.setBasketDate(rset.getDate("basket_Date"));
				b.setMemberId(rset.getString("member_Id"));
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}





	public int deleteBasketList(Connection conn, String memberId) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteBasketList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



	public int basketDeleteAjax(Connection conn, int basketNum) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("basketDeleteAjax");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, basketNum);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



	public int basketAmountAjax(Connection conn, int basketAmount, int basketNum) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("basketAmountAjax");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, basketAmount);
			pstmt.setInt(2, basketNum);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	
	public int insertBasket(Connection conn, Basket basket) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertBasket");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, basket.getBasketAmountNum());
			pstmt.setInt(2, basket.getDessertPrice());
			pstmt.setString(3, basket.getMemberId());
			pstmt.setInt(4, basket.getDessertNum());
			pstmt.setString(5, basket.getBasketDelete());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



	public int selectLastBasketNum(Connection conn) {
		int basketNum = 0;		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLastBasketNum");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next())
				basketNum = rset.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return basketNum;
	}
	
	
}
