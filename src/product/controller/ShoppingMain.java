package product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.DessertService;
import product.model.vo.Dessert;

/**
 * Servlet implementation class ShoppingMain
 */
@WebServlet("/product/shoppingMain")
public class ShoppingMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DessertService dessertService= new DessertService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			List<Dessert> list = dessertService.selectDessertList();
			
			request.setAttribute("list",list);
//			request.getRequestDispatcher("/WEB-INF/views/board/boardList.jsp").forward(request, response);
			request.getRequestDispatcher("/WEB-INF/views/product/shop.jsp").forward(request, response);
			
		}
		catch(Exception e) {
			throw e;
		}
	}

}
