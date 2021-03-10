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

	public Notice selectNoticeOne(int noticeNum) {
		Connection conn = getConnection();
		Notice notice = noticeDao.selectNoticeOne(conn, noticeNum);
		close(conn);
		return notice;
		
	}

	
	public int insertNotice(Notice notice) {
		Connection conn = getConnection();
		int result = noticeDao.insertNotice(conn, notice);
		if(result > 0) {
			//게시글 성공한 경우, 등록된 게시글 번호 가져오기
			int noitceNum = noticeDao.selectNoticeNum(conn);
			notice.setNoticeNum(noitceNum);
			commit(conn);
		}
		else rollback(conn);
		
		close(conn);
		return result;
	}



	public int Noticedelete(int noticeNum) {
		Connection conn = getConnection();
		int result = noticeDao.Noticedelete(conn, noticeNum);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
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

//	


}
