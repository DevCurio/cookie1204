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
	
	

	public List<Basket> selectBasketList(Connection conn, int cPage, int numPerPage) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Basket> list = new ArrayList<>();
		String sql = prop.getProperty("selectBasketList");
		System.out.println("conn시작");
		System.out.println(conn);
		System.out.println("conn끝");
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Basket b= new Basket();
				b.setBasketNum(rset.getInt("basket_num"));
				b.setDessertName(rset.getString("dessertName"));
				b.setBasketAmountNum(rset.getInt("basketAmount"));
				b.setBasketSumMoney(rset.getInt("basketSumMoney"));
				b.setBasketDelete(rset.getString("basketDelete"));
				b.setBasketDate(rset.getDate("basketDelete"));
				b.setMemberId(rset.getString("memberId"));
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



	public int selectBasketCount(Connection conn) {
		
		PreparedStatement pstmt = null;
		int totalContents = 0;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBasketCount");
		
		try{
			//미완성쿼리문을 가지고 객체생성. 
			pstmt = conn.prepareStatement(sql);
			
			//쿼리문실행
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				totalContents = rset.getInt("cnt");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return totalContents;
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
