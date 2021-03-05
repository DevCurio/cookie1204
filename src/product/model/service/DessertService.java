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


	public List<Dessert> selectMadeleineList() {
		Connection conn = getConnection();
		List<Dessert> list= dessertDao.selectMadeleineList(conn);
		close(conn);
		return list;
	}


	public List<Dessert> selectFinancierList() {
		Connection conn = getConnection();
		List<Dessert> list= dessertDao.selectFinancierList(conn);
		close(conn);
		return list;
	}


	public List<Dessert> selectCakeList() {
		Connection conn = getConnection();
		List<Dessert> list= dessertDao.selectCakeList(conn);
		close(conn);
		return list;
	}


	public List<Dessert> selectSpecialList() {
		Connection conn = getConnection();
		List<Dessert> list= dessertDao.selectSpecialList(conn);
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
		return dessert;	}
}
