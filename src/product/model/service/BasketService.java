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

	
	
	// 여기부터 ajax
	
	public int basketDeleteAjax(int basketNum) {
		
		Connection conn = getConnection();
		
		int result = basketDao.basketDeleteAjax(conn, basketNum);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}


	public int basketAmountAjax(int basketAmount, int basketNum) {
		
		Connection conn = getConnection();
		
		int result = basketDao.basketAmountAjax(conn, basketAmount, basketNum);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	
	public int insertBasket(Basket basket) {
		
		Connection conn = getConnection();
		int result = basketDao.insertBasket(conn,basket);
		
		if(result > 0) {
			int basketNum =basketDao.selectLastBasketNum(conn);
			basket.setBasketNum(basketNum);
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
}
