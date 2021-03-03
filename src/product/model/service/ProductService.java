package product.model.service;

import java.sql.Connection;
import java.util.List;

import static common.JDBCTemplate.*;
import product.model.dao.ProductDao;
import product.model.vo.Basket;
import product.model.vo.OrderDessert;
import product.model.vo.OrderTable;

public class ProductService {

	ProductDao productDao = new ProductDao();

	public List<Basket> selectBasketList(String memberId) {
		
		Connection conn = getConnection();
		
		List<Basket> list = productDao.selectBasketList(conn, memberId);
		
		close(conn);
		
		return list;
	}

	
	
	public int insertOrderTable(OrderTable orderTable) {
		
		Connection conn = getConnection();
		
		int result = productDao.insertOrderTable(conn, orderTable);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}



	public int insertOrderDessert(OrderDessert orderDessert) {
		
		Connection conn = getConnection();
		
		int result = productDao.insertOrderDessert(conn, orderDessert);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
	
	
	
	
}
