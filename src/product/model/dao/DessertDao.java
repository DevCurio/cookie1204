package product.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import product.model.vo.Dessert;

public class DessertDao {
	
	private Properties prop = new Properties();
	
	
	public DessertDao() {
		String fileName = "/sql/product-query.properties";
		String path = DessertDao.class.getResource(fileName).getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Dessert> selectDessertList(Connection conn) {
		
		List<Dessert> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectDessertList");
		
		Dessert dessert=null;
			try {
				//1. PreparedStatement 생성, 미완성 쿼리 값 대입
				pstmt=conn.prepareStatement(query);
				
				//2.실행 및 ResultSet값  --> member객체
				rset = pstmt.executeQuery();

				while(rset.next()) {
					dessert =new Dessert();
					dessert.setDessertNum(rset.getInt("dessert_num"));
					dessert.setDessertCategory(rset.getString("dessert_category"));
					dessert.setDessertName(rset.getString("dessert_name"));
					dessert.setDessertContent(rset.getString("dessert_content"));
					dessert.setDessertAmount(rset.getInt("dessert_amount"));
					dessert.setDessertPrice(rset.getInt("dessert_price"));
					dessert.setDessertImage1(rset.getString("dessert_original_image"));
					dessert.setDessertImage2(rset.getString("dessert_rename_image"));
					dessert.setDessertIsBest(rset.getString("dessert_is_best"));
					dessert.setDessertEnrollDate(rset.getDate("dessert_enroll_date"));
					dessert.setDessertDelete(rset.getString("dessert_delete"));
					list.add(dessert);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
				
			}finally {
				//3.자원 반납
				close(rset);
				close(pstmt);
			}	
			
			return list;
	}

	
}
