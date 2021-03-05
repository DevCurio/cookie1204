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
 * Servlet implementation class MadelenList
 */
@WebServlet("/product/madeleine")
public class MadeleineListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DessertService dessertService= new DessertService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<Dessert> list = dessertService.selectMadeleineList();
			
			
			request.setAttribute("list",list);
			request.getRequestDispatcher("/WEB-INF/views/product/madeleineSpecific.jsp").forward(request, response);
			
		}
		catch(Exception e) {
			throw e;
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}