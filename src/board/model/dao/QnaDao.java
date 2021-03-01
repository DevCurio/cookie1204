package board.model.dao;

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

import board.model.vo.Qna;
import static common.JDBCTemplate.*;

public class QnaDao {
	
	Properties prop = new Properties();
	
	public QnaDao() {
		
		try {
			String fileName = QnaDao.class.getResource("/sql/qna-query.properties").getPath();
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	

	public List<Qna> selectQnaList(Connection conn, int cPage, int numPerPage) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Qna> list = new ArrayList<>();
		String sql = prop.getProperty("selectQnaList");
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Qna qna = new Qna();
				qna.setQnaNum(rset.getInt("qna_num"));
				qna.setQnaTitle(rset.getString("qna_title"));
				qna.setQnaContent(rset.getString("qna_content"));
				qna.setQnaWriter(rset.getString("qna_writer"));
				qna.setQnaReRef(rset.getInt("qna_re_ref"));
				qna.setQnaReLev(rset.getInt("qna_re_lev"));
				qna.setQnaDate(rset.getDate("qna_date"));
				qna.setQnaDelete(rset.getString("qna_delete"));
				
				list.add(qna);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		for(Qna q : list) {
			System.out.println(q.toString());			
		}
		
		return list;
	}



	public int selectQnaCount(Connection conn) {
		
		PreparedStatement pstmt = null;
		int totalContents = 0;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQnaCount");
		
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



	public Qna selectQnaOne(Connection conn, int qnaNum) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQnaOne");
		Qna qna = new Qna();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNum);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				qna.setQnaNum(rset.getInt("qna_num"));
				qna.setQnaTitle(rset.getString("qna_title"));
				qna.setQnaContent(rset.getString("qna_content"));
				qna.setQnaWriter(rset.getString("qna_writer"));
				qna.setQnaReRef(rset.getInt("qna_re_ref"));
				qna.setQnaReLev(rset.getInt("qna_re_lev"));
				qna.setQnaDate(rset.getDate("qna_date"));
				qna.setQnaDelete(rset.getString("qna_delete"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return qna;
	}



	public List<Qna> selectQnaSearch(Connection conn, String qnaSearch, int cPage, int numPerPage) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQnaSearch");
		List<Qna> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" + qnaSearch + "%");
			pstmt.setString(2, "%" + qnaSearch + "%");
			pstmt.setInt(3, (cPage-1)*numPerPage+1);
			pstmt.setInt(4, cPage*numPerPage);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Qna qna = new Qna();
				qna.setQnaNum(rset.getInt("qna_num"));
				qna.setQnaTitle(rset.getString("qna_title"));
				qna.setQnaContent(rset.getString("qna_content"));
				qna.setQnaWriter(rset.getString("qna_writer"));
				qna.setQnaReRef(rset.getInt("qna_re_ref"));
				qna.setQnaReLev(rset.getInt("qna_re_lev"));
				qna.setQnaDate(rset.getDate("qna_date"));
				qna.setQnaDelete(rset.getString("qna_delete"));
				
				list.add(qna);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}



	public int selectQnaSearchCount(Connection conn, String qnaSearch) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQnaSearchCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + qnaSearch + "%");
			pstmt.setString(2, "%" + qnaSearch + "%");
			
			rset = pstmt.executeQuery();
		
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
