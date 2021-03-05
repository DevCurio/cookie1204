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

	public List<Dessert> selectMadeleineList(Connection conn) {
		List<Dessert> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectCategoryList");
		
		Dessert dessert=null;
			try {
				//1. PreparedStatement 생성, 미완성 쿼리 값 대입
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1,"마들렌");
				
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

	public List<Dessert> selectFinancierList(Connection conn) {
		List<Dessert> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectCategoryList");
		
		Dessert dessert=null;
			try {
				//1. PreparedStatement 생성, 미완성 쿼리 값 대입
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1,"휘낭시에");
				
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

	public List<Dessert> selectCakeList(Connection conn) {
		List<Dessert> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectCategoryList");
		
		Dessert dessert=null;
			try {
				//1. PreparedStatement 생성, 미완성 쿼리 값 대입
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1,"케익");
				
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

	public List<Dessert> selectSpecialList(Connection conn) {
		List<Dessert> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectSpecialList");
		
		Dessert dessert=null;
			try {
				//1. PreparedStatement 생성, 미완성 쿼리 값 대입
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1,"마들렌");
				pstmt.setString(2,"케이크");
				pstmt.setString(3,"휘낭시에");
				
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

	public int insertDessert(Connection conn, Dessert dessert) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertDessert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dessert.getDessertCategory());
			pstmt.setString(2, dessert.getDessertName());
			pstmt.setString(3, dessert.getDessertContent());
			pstmt.setInt(4, dessert.getDessertAmount());
			pstmt.setInt(5, dessert.getDessertPrice());
			pstmt.setString(6, dessert.getDessertImage1());
			pstmt.setString(7, dessert.getDessertImage2());
			pstmt.setString(8, dessert.getDessertIsBest());
//			pstmt.setString(9,"sysdate");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectLastDessertNum(Connection conn) {
		
		int dessertNum = 0;		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLastDessertNum");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next())
				dessertNum = rset.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return dessertNum;
	}

	public Dessert selectOne(Connection conn, int dessertNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOne");
		//select * from board where desser_num = ?
		Dessert dessert = null;
		
		try{
			//미완성쿼리문을 가지고 객체생성. 
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, dessertNum);
			
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			while(rset.next()){
				dessert = new Dessert();
				//컬럼명은 대소문자 구분이 없다.
				dessert.setDessertNum(rset.getInt("dessert_num"));
				dessert.setDessertCategory(rset.getString("dessert_category"));
				dessert.setDessertName(rset.getString("dessert_name"));
				dessert.setDessertContent(rset.getString("dessert_content"));
				dessert.setDessertAmount(Integer.parseInt(rset.getString("dessert_amount")));
				dessert.setDessertPrice(Integer.parseInt(rset.getString("dessert_price")));
				dessert.setDessertImage1(rset.getString("dessert_original_image"));
				dessert.setDessertImage2(rset.getString("dessert_rename_image"));
				dessert.setDessertIsBest(rset.getString("dessert_is_best"));
				dessert.setDessertEnrollDate(rset.getDate("dessert_enroll_date"));
				dessert.setDessertDelete(rset.getString("dessert_delete"));
				
			}
			
		}catch(Exception e){
			//런타임예외, 구체적인 의미를 가진 예외객체로 전환해서 다시 던지기
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return dessert;
	}

	
}
