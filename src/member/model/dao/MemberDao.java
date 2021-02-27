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
		String fileName = "/sql/member/member-query.properties";
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
			//쿼리문미완성
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getSocietyNum1());
			pstmt.setString(5, member.getSocietyNum2());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getEmailGet());
			pstmt.setString(8, member.getMobileNum());
			pstmt.setString(9, member.getPhoneNum());
			pstmt.setString(10, member.getZipCode());
			pstmt.setString(11, member.getMemberAddr());
			pstmt.setString(12, member.getMemberAddrDetail());
			pstmt.setString(13, member.getIsAdmin());
			pstmt.setDate(14, member.getEnrollDate());
			
			
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
