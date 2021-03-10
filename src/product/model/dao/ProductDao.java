package product.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static common.JDBCTemplate.*;
import product.model.vo.Basket;
import product.model.vo.OrderDessert;
import product.model.vo.OrderTable;

public class ProductDao {
	
	Properties prop = new Properties();
	
	public ProductDao() {
		
		try {
			String fileName = 
					ProductDao.class.getResource("/sql/product-order-query.properties").getPath();
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	

	public List<Basket> selectBasketList(Connection conn, String memberId) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBasketList");
		List<Basket> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Basket basket = new Basket();
				
				basket.setBasketNum(rset.getInt("basket_num"));
				basket.setBasketAmountNum(rset.getInt("basket_amount"));
				basket.setBasketSumMoney(rset.getInt("basket_sum_money"));
				basket.setMemberId(rset.getString("member_id"));
				basket.setDessertNum(rset.getInt("dessert_num"));
				basket.setBasketDelete(rset.getString("basket_delete"));
				basket.setBasketDate(rset.getDate("basket_Date"));
				basket.setDessertName(rset.getString("dessert_name"));
				
				list.add(basket);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public int insertOrderTable(Connection conn, OrderTable orderTable) {

		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertOrderTable");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderTable.getOrderTradeNum());
			pstmt.setString(2, orderTable.getOrderTransNum());
			pstmt.setString(3, orderTable.getOrderReceiveName());
			pstmt.setString(4, orderTable.getOrderReceiveAddr());
			pstmt.setString(5, orderTable.getOrderReceiveAddrDetail());
			pstmt.setString(6, orderTable.getOrderReceivePhone());
			pstmt.setString(7, orderTable.getOrderReceiveMobile());
			pstmt.setString(8, orderTable.getOrderMemo());
			pstmt.setInt(9, orderTable.getSumMoney());
			pstmt.setString(10, orderTable.getOrderTradeType());
			
			pstmt.setInt(11, orderTable.getOrderStatus());
			
			pstmt.setString(12, orderTable.getMemberId());
			pstmt.setInt(13, orderTable.getCardNum());
			pstmt.setString(14, orderTable.getZipCode());
			pstmt.setString(15, orderTable.getOrderEmail());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();			
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int insertOrderDessert(Connection conn, OrderDessert orderDessert) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertOrderDessert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderDessert.getOrderTradeNum());
			pstmt.setInt(2, orderDessert.getDessertNum());
			pstmt.setInt(3, orderDessert.getOrderDessertAmount());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
