package product.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

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
}
