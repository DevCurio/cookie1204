package board.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import board.model.dao.NoticeDao;
import board.model.vo.Notice;


public class NoticeService {

	private NoticeDao noticeDao = new NoticeDao();
	
	public List<Notice> selectNoticeList(int cpage, int numPerPage) {
		Connection conn = getConnection();

		List<Notice> list= noticeDao.selectNoticeList(conn, cpage, numPerPage);
	
		close(conn);
		return list;
	}

	public int selectNoticeCount() {
		Connection conn = getConnection();
		int totalBoardCount = noticeDao.selectNoticeCount(conn);
		close(conn);
		return totalBoardCount;
	}

	

	

//	public int insertBoard(Notice notice) {
//		Connection conn = getConnection();
//		int result = noticeDao.insertBoard(conn, notice);
//		if(result > 0) {
//			//게시글 성공한 경우, 등록된 게시글 번호 가져오기
//			int boardNo = noticeDao.selectLastBoardNo(conn);
//			board.setBoardNo(boardNo);
//			commit(conn);
//		}
//		else rollback(conn);
//		
//		close(conn);
//		return result;
//	}
//
//	public Board selectOne(int boardNo) {
//		Connection conn = getConnection();
//		Board board = boardDao.selectOne(conn, boardNo);
//		close(conn);
//		return board;
//	}
//
//	public int updateBoardReadCount(int boardNo) {
//		Connection conn = getConnection();
//		int result = boardDao.updateBoardReadCount(conn, boardNo);
//		if(result > 0) commit(conn);
//		else rollback(conn);
//		close(conn);
//		return result;
//	}
//
//	public int deleteBoard(int boardNo) {
//		Connection conn = getConnection();
//		int result = boardDao.deleteBoard(conn, boardNo);
//		if(result > 0) commit(conn);
//		else rollback(conn);
//		close(conn);
//		return result;
//	}
//	
//	public int updateBoard(Board b) {
//		Connection conn = getConnection();
//		int result = boardDao.updateBoard(conn, b);
//		if(result>0)
//			commit(conn);
//		else 
//			rollback(conn);
//		close(conn);
//		return result;
//	}
//
//	public int insertBoardComment(BoardComment bc) {
//		Connection conn = getConnection();
//		int result = boardDao.insertBoardComment(conn, bc);
//		if(result>0)
//			commit(conn);
//		else 
//			rollback(conn);
//		close(conn);
//		return result;
//	}
//	
//	public List<BoardComment> selectCommentList(int board_no) {
//		Connection conn = getConnection();
//		List<BoardComment> list= boardDao.selectCommentList(conn, board_no);
//		close(conn);
//		return list;
//	}


}
