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
 * Servlet implementation class DessertCategorySeperation
 */
@WebServlet("/product/dessertCategory")
public class DessertCategorySeperation extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private DessertService dessertService= new DessertService();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String category = request.getParameter("dessertCategory");
		List<Dessert> list = dessertService.selectDessertList();
		
		request.setAttribute("list",list);
		request.setAttribute("category", category);
		request.getRequestDispatcher("/WEB-INF/views/product/dessertCategorySpecific.jsp").forward(request, response);
	
	}

}
