package board.model.service;

import java.sql.Connection;
import java.util.List;

import board.model.dao.QnaDao;
import board.model.vo.Qna;
import static common.JDBCTemplate.*;

public class QnaService {
	
	QnaDao qnaDao = new QnaDao();

	
	
	public List<Qna> selectQnaList(int cPage, int numPerPage) {
		
		Connection conn = getConnection();
		
		List<Qna> list = qnaDao.selectQnaList(conn, cPage, numPerPage);
		
		close(conn);
		
		return list;
	}

	
	
	public int selectQnaCount() {
		
		Connection conn = getConnection();
		
		int totalContents = qnaDao.selectQnaCount(conn);
		
		close(conn);
		
		return totalContents;
	}



	public Qna selectQnaOne(int qnaNum) {
		
		Connection conn = getConnection();
		
		Qna qna = qnaDao.selectQnaOne(conn, qnaNum);
		
		close(conn);
		
		return qna;
	}



	public List<Qna> selectQnaSearch(String qnaSearch, int cPage, int numPerPage) {
		
		Connection conn = getConnection();
		
		List<Qna> list = qnaDao.selectQnaSearch(conn, qnaSearch, cPage, numPerPage);
		
		close(conn);
		
		return list;
	}



	public int selectQnaSearchCount(String qnaSearch) {
		
		Connection conn = getConnection();
		
		int totalContents = qnaDao.selectQnaSearchCount(conn, qnaSearch);
		
		close(conn);
		
		return totalContents;
	}

	
	public int insertQna(Qna qna) {
		Connection conn = getConnection();
		int result = qnaDao.insertQna(conn, qna);
		if(result > 0) {
			//게시글 성공한 경우, 등록된 게시글 번호 가져오기
			int qnaNum = qnaDao.selectLastQnaNum(conn);
			qna.setQnaNum(qnaNum);
			commit(conn);
		}
		else rollback(conn);
		
		close(conn);
		return result;
	}
	
}
