package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.vo.Member;

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
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//3.자원반납(ResultSet, PreparedStatement)
			close(rset);
			close(pstmt);
		}
//		System.out.println("member@dao = " + member);
		return member;
	}
}
