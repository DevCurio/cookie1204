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
		System.out.println("conn시작");
		System.out.println(conn);
		System.out.println("conn끝");
		System.out.println("memberId"+memberId);
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
		for(Basket B : list) {
			System.out.println(B.toString());			
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

}
