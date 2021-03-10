package member.model.dao;

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

import member.model.vo.Member;
import product.model.vo.OrderDessertExt;
import product.model.vo.OrderTable;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	
	public MemberDao() {
		String fileName = "/sql/member-query.properties";
		String path = MemberDao.class.getResource(fileName).getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	
	
	//회원가입 정보 입력 메소드
	public int insertMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertMember");
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성(쿼리에 ?인 부분 채우기)
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPw());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getSocietyFrontNumber());
			pstmt.setString(5, member.getSocietyBackNumber());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getEmailGet());
			pstmt.setString(8, member.getMobileNum());
			pstmt.setString(9, member.getPhoneNum());
			pstmt.setString(10, member.getZipCode());
			pstmt.setString(11, member.getMemberAddr());
			pstmt.setString(12, member.getMemberAddrDetail());
			pstmt.setString(13, member.getIsAdmin());
			
			
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
	
	
	
	public Member selectOne(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOne");
		Member member = null;
		
		try {
			//1.PreparedStatement객체생성(미완성쿼리 값대입)
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			//2.Statement실행 및 결과처리:ResultSet -> Member
			rset = pstmt.executeQuery();
			while(rset.next()) {
				member = new Member();
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
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//3.자원반납(ResultSet, PreparedStatement)
			close(rset);
			close(pstmt);
		}
		return member;
	}
	
	
	
	public int updateMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateMember"); 

		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성(쿼리에 ?인 부분 채우기)
			/*updateMember = update member set 
			 * 				 member_name = ?, 
			 * 				 Society_front_number = ?, 
			 * 				 Society_back_number = ?, 
			 * 				 email = ?, 
			 * 				 email_get = ?, 
			 * 				 mobile_number = ?, 
			 * 				 phone_number = ?, 
			 * 				 zip_code = ?, 
			 * 				 member_addr = ?, 
			 * 				 member_addr_detail = ?,  
			 * 				 where member_id = ?
*/
			pstmt.setString(1, member.getMemberName());
			pstmt.setString(2, member.getSocietyFrontNumber());
			pstmt.setString(3, member.getSocietyBackNumber());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getEmailGet());
			pstmt.setString(6, member.getMobileNum());
			pstmt.setString(7, member.getPhoneNum());
			pstmt.setString(8, member.getZipCode());
			pstmt.setString(9, member.getMemberAddr());
			pstmt.setString(10, member.getMemberAddrDetail());
			pstmt.setString(11, member.getMemberId());
			
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
	
	public int deleteMember(Connection conn, String memberId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteMember"); 

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



	public List<OrderTable> selectMemberOrderList(Connection conn, int cpage, int numPerPage, String memberId) {

		PreparedStatement pstmt = null;
		List<OrderTable> list = new ArrayList<>();
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberOrderList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, (cpage-1)*numPerPage+1);
			pstmt.setInt(3, cpage*numPerPage);
			
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



	public List<OrderDessertExt> selectMemberOrderDessertExt(Connection conn, int cpage, int numPerPage, String memberId) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberOrderDessertExt");
		List<OrderDessertExt> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, (cpage-1)*numPerPage+1);
			pstmt.setInt(3, cpage*numPerPage);
			
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



	public int selectMemberOrderCount(Connection conn, String memberId) {
		
		PreparedStatement pstmt = null;
		int cnt = 0;
		String sql = prop.getProperty("selectMemberOrderCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return cnt;
	}
	
	
	
	public int updatePassword(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updatePassword"); 

		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setString(1, member.getMemberPw());
			pstmt.setString(2, member.getMemberId());
			
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
