package product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.DessertService;
import product.model.vo.Dessert;

/**
 * Servlet implementation class ProductSpecificView
 */
@WebServlet("/product/productSpecificView")
public class ProductSpecificView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DessertService dessertSerivce = new DessertService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1. 사용자 입력값 처리
			int dessertNum = 0;
			try {
				dessertNum = Integer.parseInt(request.getParameter("dessertNum"));
			} catch (NumberFormatException e) {
				throw new Exception("유효한 게시글 번호가 아닙니다 : \"" + request.getParameter("dessertNum") + "\"", e);
			}
			
			//2. 업무로직 : 게시글 조회
			//조회수 증가
			Dessert dessert = dessertSerivce.selectOne(dessertNum);
			
			if(dessert == null)
				throw new Exception("해당 제품이 존재하지 않습니다. : " + dessertNum);
			
			
		
			
			//3. view단처리 : jsp forwarding
			request.setAttribute("dessert", dessert);
			
			request.getRequestDispatcher("/WEB-INF/views/product/dessertDescription.jsp")
				   .forward(request, response);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
