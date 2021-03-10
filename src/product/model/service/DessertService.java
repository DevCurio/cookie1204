package product.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import product.model.dao.DessertDao;
import product.model.vo.Dessert;


public class DessertService {
	
	private DessertDao dessertDao = new DessertDao();
	
	public List<Dessert> selectDessertList() {
		Connection conn = getConnection();
		List<Dessert> list= dessertDao.selectDessertList(conn);
		close(conn);
		return list;
	}



	public int insertDessert(Dessert dessert) {
		Connection conn = getConnection();
		int result = dessertDao.insertDessert(conn, dessert);
		if(result > 0) {
			int dessertNum = dessertDao.selectLastDessertNum(conn);
			dessert.setDessertNum(dessertNum);
			commit(conn);
		}
		else rollback(conn);
		
		close(conn);
		return result;
	}


	public Dessert selectOne(int dessertNum) {
		Connection conn = getConnection();
		Dessert dessert = dessertDao.selectOne(conn, dessertNum);
		close(conn);
		return dessert;	
		
	}


	public int updateIsBest(Dessert dessert) {
		Connection conn = getConnection();
		int result = dessertDao.updateIsBest(conn, dessert);
		if(result > 0) {
			if(dessert.getDessertIsBest().equals("Y")) {
				dessert.setDessertIsBest("N");
			}
			else {
				dessert.setDessertIsBest("Y");
			}
			commit(conn);
		}
		else rollback(conn);
		
		close(conn);
		return result;
	}


	public int updateDelete(Dessert dessert) {
		Connection conn = getConnection();
		int result = dessertDao.updateDelete(conn, dessert);
		if(result > 0) {
			if(dessert.getDessertDelete().equals("Y")) {
				dessert.setDessertDelete("N");
			}
			else {
				dessert.setDessertDelete("Y");
			}
			commit(conn);
		}
		else rollback(conn);
		
		close(conn);
		return result;
	}
}
