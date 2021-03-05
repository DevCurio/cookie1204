package admin.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import member.model.vo.Member;
import product.model.dao.ProductDao;
import product.model.vo.OrderDessert;
import product.model.vo.OrderDessertExt;
import product.model.vo.OrderTable;

public class AdminDao {
	
	Properties prop = new Properties();
	
	public AdminDao() {
		
		try {
			String fileName = 
					AdminDao.class.getResource("/sql/admin-query.properties").getPath();
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	public List<OrderTable> selectOrderTableList(Connection conn, int cpage, int numPerPage) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOrderTableList");
		List<OrderTable> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cpage - 1) * numPerPage + 1);
			pstmt.setInt(2, cpage * numPerPage);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				OrderTable ot = new OrderTable();
				
				ot.setOrderNum(rset.getInt("order_num"));
				ot.setOrderTradeNum(rset.getString("order_trade_num"));
				ot.setOrderTransNum(rset.getString("order_trans_num"));
				ot.setOrderReceiveName(rset.getString("order_receive_name"));
				ot.setOrderReceiveAddr(rset.getString("order_receive_addr"));
				ot.setOrderReceiveAddrDetail(rset.getString("order_receive_addr_detail"));
				ot.setOrderReceivePhone(rset.getString("order_receive_phone"));
				ot.setOrderReceiveMobile(rset.getString("order_receive_mobile"));
				ot.setOrderMemo(rset.getString("order_memo"));
				ot.setSumMoney(rset.getInt("order_sum_money"));
				ot.setOrderTradeType(rset.getString("order_trade_type"));
				ot.setOrderDate(rset.getDate("order_date"));
				ot.setOrderStatus(rset.getInt("order_status"));
				ot.setOrderDelete(rset.getString("order_delete"));
				ot.setMemberId(rset.getString("member_id"));
				ot.setCardNum(rset.getInt("card_num"));
				ot.setZipCode(rset.getString("zip_code"));
				ot.setOrderEmail(rset.getString("order_email"));

				list.add(ot);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public int selectOrderTableCount(Connection conn) {
		
		PreparedStatement pstmt = null;
		int cnt = 0;
		String sql  =prop.getProperty("selectOrderTableCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return cnt;
	}



	public List<OrderDessertExt> selectOrderDessertExtList(Connection conn, int cpage, int numPerPage) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<OrderDessertExt> list = new ArrayList<>();
		String sql = prop.getProperty("selectOrderDessertExtList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cpage-1)*numPerPage+1);
			pstmt.setInt(2, cpage*numPerPage);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				OrderDessertExt ode = new OrderDessertExt();
				
				ode.setDessertNum(rset.getInt("dessert_num"));
				ode.setOrderDessertAmount(rset.getInt("order_dessert_amount"));
				ode.setOrderDessertDelete(rset.getString("order_dessert_delete"));
				ode.setOrderTradeNum(rset.getString("order_trade_num"));
				ode.setDessertName(rset.getString("dessert_name"));
				
				list.add(ode);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}



	public int orderFinish(Connection conn, String orderTradeNum) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("orderFinish");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderTradeNum);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



	public int orderCancel(Connection conn, String orderTradeNum) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("orderCancel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderTradeNum);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



	public List<OrderTable> selectOrderTableRecord(Connection conn, int cpage, int numPerPage) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOrderTableRecord");
		List<OrderTable> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cpage - 1) * numPerPage + 1);
			pstmt.setInt(2, cpage * numPerPage);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				OrderTable ot = new OrderTable();
				
				ot.setOrderNum(rset.getInt("order_num"));
				ot.setOrderTradeNum(rset.getString("order_trade_num"));
				ot.setOrderTransNum(rset.getString("order_trans_num"));
				ot.setOrderReceiveName(rset.getString("order_receive_name"));
				ot.setOrderReceiveAddr(rset.getString("order_receive_addr"));
				ot.setOrderReceiveAddrDetail(rset.getString("order_receive_addr_detail"));
				ot.setOrderReceivePhone(rset.getString("order_receive_phone"));
				ot.setOrderReceiveMobile(rset.getString("order_receive_mobile"));
				ot.setOrderMemo(rset.getString("order_memo"));
				ot.setSumMoney(rset.getInt("order_sum_money"));
				ot.setOrderTradeType(rset.getString("order_trade_type"));
				ot.setOrderDate(rset.getDate("order_date"));
				ot.setOrderStatus(rset.getInt("order_status"));
				ot.setOrderDelete(rset.getString("order_delete"));
				ot.setMemberId(rset.getString("member_id"));
				ot.setCardNum(rset.getInt("card_num"));
				ot.setZipCode(rset.getString("zip_code"));
				ot.setOrderEmail(rset.getString("order_email"));

				list.add(ot);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}



	public List<OrderDessertExt> selectOrderDessertExtRecord(Connection conn, int cpage, int numPerPage) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<OrderDessertExt> list = new ArrayList<>();
		String sql = prop.getProperty("selectOrderDessertExtRecord");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cpage-1)*numPerPage+1);
			pstmt.setInt(2, cpage*numPerPage);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				OrderDessertExt ode = new OrderDessertExt();
				
				ode.setDessertNum(rset.getInt("dessert_num"));
				ode.setOrderDessertAmount(rset.getInt("order_dessert_amount"));
				ode.setOrderDessertDelete(rset.getString("order_dessert_delete"));
				ode.setOrderTradeNum(rset.getString("order_trade_num"));
				ode.setDessertName(rset.getString("dessert_name"));
				
				list.add(ode);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}




	public int selectOrderTableRecordCount(Connection conn) {
		
		PreparedStatement pstmt = null;
		int cnt = 0;
		String sql  =prop.getProperty("selectOrderTableRecordCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return cnt;
	}
	
	public List<Member> selectList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPagedList");
		List<Member> list = null;
		
		try {
			//1. PreparedStatement객체 생성
			//2. 미완성 쿼리 값대입
			pstmt = conn.prepareStatement(sql);
			//1 : 1 ~ 10
			//2 : 11 ~ 20
			//3 : 21 ~ 30
			//...
			//12 : 111 ~ 120
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);//시작 rnum
			pstmt.setInt(2, cPage * numPerPage);//마지막 rnum
			
			//3. 실행 및 ResultSet처리
			rset = pstmt.executeQuery();
			//4. Member --> List에 추가
			list = new ArrayList<>();
			while(rset.next()) {
				Member member = new Member();
				 member.setMemberId(rset.getString("member_id"));
	                member.setMemberPw(rset.getString("member_pw"));
	                member.setMemberName(rset.getString("member_name"));
	                member.setSocietyFrontNumber(rset.getString("Society_front_number"));
	                member.setSocietyBackNumber(rset.getString("Society_back_number"));
	                member.setEmail(rset.getString("email"));
	                member.setEmailGet(rset.getString("email_get"));
	                member.setMobileNum(rset.getString("mobile_number"));
	                member.setPhoneNum(rset.getString("phone_number"));
	                member.setZipCode(rset.getString("zip_code"));
	                member.setMemberAddr(rset.getString("member_addr"));
	                member.setMemberAddrDetail(rset.getString("member_addr_detail"));
	                member.setIsAdmin(rset.getString("is_admin"));
	                member.setEnrollDate(rset.getDate("enroll_date"));
	                member.setMemberDelete(rset.getString("member_delete"));
				list.add(member);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//5. 자원반납
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int selectTotalMember(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalContents = 0;
		String sql = prop.getProperty("selectTotalMember");
		//select count(*) from member
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalContents = rset.getInt(1);//컬럼순서로 가져옴.
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContents;
	
}

	public List<Member> selectMembersBy(Connection conn, Map<String, Object> param) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPagedMembersBy");
		//select * from (select M.*, row_number() over(order by enroll_date desc) rnum from member M where # like ? ) where rnum between ? and ?
		switch((String)param.get("searchType")) {
		case "memberId" : sql = sql.replace("#", "member_id"); break;
		case "memberName" : sql = sql.replace("#", "member_name"); break;
		case "gender" : sql = sql.replace("#", "gender"); break;
		}
		
		try{
			//미완성쿼리문을 가지고 객체생성. 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + param.get("searchKeyword") + "%");
			
			//1 : 1 ~ 10
			//2 : 11 ~ 20
			int cPage = (int)param.get("cPage");
			int numPerPage = (int)param.get("numPerPage");
			pstmt.setInt(2, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(3, cPage * numPerPage);
			
			
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Member member = new Member();
				 member.setMemberId(rset.getString("member_id"));
	                member.setMemberPw(rset.getString("member_pw"));
	                member.setMemberName(rset.getString("member_name"));
	                member.setSocietyFrontNumber(rset.getString("Society_front_number"));
	                member.setSocietyBackNumber(rset.getString("Society_back_number"));
	                member.setEmail(rset.getString("email"));
	                member.setEmailGet(rset.getString("email_get"));
	                member.setMobileNum(rset.getString("mobile_number"));
	                member.setPhoneNum(rset.getString("phone_number"));
	                member.setZipCode(rset.getString("zip_code"));
	                member.setMemberAddr(rset.getString("member_addr"));
	                member.setMemberAddrDetail(rset.getString("member_addr_detail"));
	                member.setIsAdmin(rset.getString("is_admin"));
	                member.setEnrollDate(rset.getDate("enroll_date"));
	                member.setMemberDelete(rset.getString("member_delete"));
				list.add(member);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public int selectTotalMembersBy(Connection conn, Map<String, Object> param) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalContents = 0;
		String sql = prop.getProperty("selectTotalMembersBy");
		//select count(*) from member where # like ?
		
		switch((String)param.get("searchType")) {
		case "memberId" : sql = sql.replace("#", "member_id"); break;
		case "memberName" : sql = sql.replace("#", "member_name");  break;
		case "gender" : sql = sql.replace("#", "gender"); break;
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + param.get("searchKeyword") + "%");
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalContents = rset.getInt(1);//컬럼순서로 가져옴.
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContents;
	}
	public int admindeleteMember(Connection conn, String memberId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("admindeleteMember"); 

		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			 pstmt.setString(1, "Y");
			pstmt.setString(2, memberId);
			  

			//쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			//DML은 executeUpdate()
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}