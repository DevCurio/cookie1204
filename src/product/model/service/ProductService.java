package product.model.service;

import java.sql.Connection;
import java.util.List;

import static common.JDBCTemplate.*;
import product.model.dao.ProductDao;
import product.model.vo.Basket;

public class ProductService {

	ProductDao productDao = new ProductDao();

	public List<Basket> selectBasketList(String memberId) {
		
		Connection conn = getConnection();
		
		List<Basket> list = productDao.selectBasketList(conn, memberId);
		
		close(conn);
		
		return list;
	}
	
	
	
	
}
