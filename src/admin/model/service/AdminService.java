package admin.model.service;

import admin.model.dao.AdminDao;
import member.model.vo.Member;
import product.model.vo.OrderDessert;
import product.model.vo.OrderDessertExt;
import product.model.vo.OrderTable;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;
import java.util.Map;


public class AdminService {
	
	AdminDao adminDao = new AdminDao();
	
	
	
	public List<OrderTable> selectOrderTableList(int cpage, int numPerPage) {
		
		Connection conn = getConnection();
		
		List<OrderTable> list = adminDao.selectOrderTableList(conn, cpage, numPerPage);
		
		close(conn);
		
		return list;
	}



	public int selectOrderTableCount() {
		
		Connection conn = getConnection();
		
		int cnt = adminDao.selectOrderTableCount(conn);
		
		close(conn);
		
		return cnt;
	}



	public List<OrderDessertExt> selectOrderDessertExtList(int cpage, int numPerPage) {

		Connection conn = getConnection();
		
		List<OrderDessertExt> list = adminDao.selectOrderDessertExtList(conn, cpage, numPerPage);
		
		close(conn);
		
		return list;
	}



	public int orderFinish(String orderTradeNum) {
		
		Connection conn = getConnection();
		
		int result = adminDao.orderFinish(conn, orderTradeNum);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}



	public int orderCancel(String orderTradeNum) {
		
		Connection conn = getConnection();
		
		int result = adminDao.orderCancel(conn, orderTradeNum);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}



	public List<OrderTable> selectOrderTableRecord(int cpage, int numPerPage) {
		
		Connection conn = getConnection();
		
		List<OrderTable> list = adminDao.selectOrderTableRecord(conn, cpage, numPerPage);
		
		close(conn);
		
		return list;
	}



	public List<OrderDessertExt> selectOrderDessertExtRecord(int cpage, int numPerPage) {
		
		Connection conn = getConnection();
		
		List<OrderDessertExt> list = adminDao.selectOrderDessertExtRecord(conn, cpage, numPerPage);
		
		close(conn);
		
		return list;
	}



	public int selectOrderTableRecordCount() {
		
		Connection conn = getConnection();
		
		int cnt = adminDao.selectOrderTableRecordCount(conn);
		
		close(conn);
		
		return cnt;
	}
	

	public List<Member> selectList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Member> list = adminDao.selectList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public int selectTotalMembers() {
		Connection conn = getConnection();
		int totalContents = adminDao.selectTotalMember(conn);
		close(conn);
		return totalContents;
	}

	public List<Member> selectMembersBy(Map<String, Object> param) {
		Connection conn = getConnection();
		List<Member> list= adminDao.selectMembersBy(conn, param);
		close(conn);
		return list;
	}

	public int selectTotalMembersBy(Map<String, Object> param) {
		Connection conn = getConnection();
		int totalContents = adminDao.selectTotalMembersBy(conn, param);
		close(conn);
		return totalContents;
	}
	
	public int admindeleteMember(String memberId) {
		Connection conn = getConnection();
		int result = adminDao.admindeleteMember(conn, memberId);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}
	
}
