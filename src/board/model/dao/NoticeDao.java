package board.model.dao;

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

import board.model.vo.Notice;
import board.model.vo.Qna;


public class NoticeDao {

	private Properties prop = new Properties();
	
	/**
	 * build-path의 board-query.properties의 내용을 읽어와 필드 prop에 저장한다.
	 */
	public NoticeDao() {
		try {
			//클래스객체 위치찾기 : 절대경로를 반환한다. 
			String fileName = NoticeDao.class.getResource("/sql/notice-query.properties").getPath();
			prop.load(new FileReader(fileName));

		} catch (IOException e) {
			e.printStackTrace();
		}	
	}

	public List<Notice> selectNoticeList(Connection conn, int cPage, int numPerPage) {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Notice> list = new ArrayList<>();

	
		String query = prop.getProperty("selectNoticeList");
		
		try{
			//미완성쿼리문을 가지고 객체생성. 
				pstmt = conn.prepareStatement(query);
			
			//시작 rownum과 마지막 rownum 구하는 공식
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			
			//쿼리문실
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Notice b = new Notice();
				
				b.setNoticeNum(rset.getInt("notice_num"));
				b.setNoticeTitle(rset.getString("notice_title"));
				b.setNoticeWriter(rset.getString("notice_writer"));
				b.setNoticeContent(rset.getString("notice_content"));
				b.setNoticeOriginalImage(rset.getString("notice_original_Image"));
				b.setNoticeRenameImage(rset.getString("notice_rename_Image"));
				b.setNoticeDate(rset.getDate("notice_date"));
				b.setNoticeDelete(rset.getString("notice_delete"));
				list.add(b);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		
		}finally{
			close(rset);
			close(pstmt);
		}

		return list;
	}
	
	

	public int selectNoticeCount(Connection conn) {
		PreparedStatement pstmt = null;
		int totalContents = 0;
		ResultSet rset = null;
	String query = prop.getProperty("selectNoticeCount");
		
	try{
			//미완성쿼리문을 가지고 객체생성. 
			pstmt = conn.prepareStatement(query);
			
			///쿼리문실행
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

	public Notice selectNoticeOne(Connection conn, int noticeNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectNoticeOne");
		//select * from board where board_no = ?
		Notice n = new Notice();
		
		try{
			//미완성쿼리문을 가지고 객체생성. 
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNum);
			
			//쿼리문실행
			
			rset = pstmt.executeQuery();
			while(rset.next()){
				
				//컬럼명은 대소문자 구분이 없다.
				n.setNoticeNum(rset.getInt("notice_Num"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeWriter(rset.getString("notice_writer"));
				n.setNoticeContent(rset.getString("notice_content"));
				n.setNoticeOriginalImage(rset.getString("notice_Original_Image"));
				n.setNoticeRenameImage(rset.getNString("notice_Rename_Image"));
				n.setNoticeDate(rset.getDate("notice_date"));
				n.setNoticeDelete(rset.getString("notice_delete"));
			
			}
			
		}catch(SQLException e){
			//런타임예외, 구체적인 의미를 가진 예외객체로 전환해서 다시 던지기
		
		}finally{
			close(rset);
			close(pstmt);
		}
		return n;
	}

	public int insertNotice(Connection conn, Notice notice) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());
			pstmt.setString(3, notice.getNoticeWriter());
			pstmt.setString(4, notice.getNoticeOriginalImage());
			pstmt.setString(5, notice.getNoticeRenameImage());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectNoticeNum(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeNum");
		int noticeNum = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				noticeNum = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return noticeNum;
	} 



	public int Noticedelete(Connection conn, int noticeNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("NoticeDelete");
		try {
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setInt(1, noticeNum);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
//	
//	public int updateBoard(Connection conn, Board b) {
//		int result = 0;
//		PreparedStatement pstmt = null;
//		String query = prop.getProperty("updateBoard"); 
//		
//		try {
//			//미완성쿼리문을 가지고 객체생성.
//			pstmt = conn.prepareStatement(query);
//			//쿼리문미완성
//			pstmt.setString(1, b.getBoardTitle());
//			pstmt.setString(2, b.getBoardContent());
//			pstmt.setString(3, b.getBoardOriginalFileName());
//			pstmt.setString(4, b.getBoardRenamedFileName());
//			pstmt.setInt(5, b.getBoardNo());
//			
//			//쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
//			//DML은 executeUpdate()
//			result = pstmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		
//		return result;
//	}
//


	


	
	
	
}
