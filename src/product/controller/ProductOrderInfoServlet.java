package product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product.model.service.ProductService;
import product.model.vo.Basket;

/**
 * Servlet implementation class ProductOrderInfoServlet
 */
@WebServlet("/product/orderInfo")
public class ProductOrderInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	ProductService productService = new ProductService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		
		List<Basket> list = productService.selectBasketList(memberId);
		
		if(list.size() > 0) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("/WEB-INF/views/product/orderInfo.jsp").forward(request, response);
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("msg", "잘못된 시도입니다.");			
			request.getRequestDispatcher("/WEB-INF/views/product/basket.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
