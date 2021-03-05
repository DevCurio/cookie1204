package product.model.service;

import product.model.dao.BasketDao;


import java.sql.Connection;
import java.util.List;

import product.model.vo.Basket;

import product.model.vo.Basket;
import static common.JDBCTemplate.*;


public class BasketService {

	private BasketDao basketDao = new BasketDao();
	
	public List<Basket> selectBasketList(String memberId) {
		Connection conn = getConnection();

		List<Basket> list= basketDao.selectBasketList(conn,memberId);
		System.out.println("memberId "+memberId);
		close(conn);
		return list;
	}


	public int deleteBasketList(String memberId) {
		
		Connection conn = getConnection();
		
		int result = basketDao.deleteBasketList(conn, memberId);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	

	




}
