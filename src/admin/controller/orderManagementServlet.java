package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import common.MvcUtils;
import member.model.vo.Member;
import product.model.service.ProductService;
import product.model.vo.OrderDessert;
import product.model.vo.OrderDessertExt;
import product.model.vo.OrderTable;

/**
 * Servlet implementation class orderManagementServlet
 */
@WebServlet("/admin/orderManagement")
public class orderManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	AdminService adminService = new AdminService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// cpage = 선택된 페이지
		int cpage = 1;
		try {
			cpage = Integer.parseInt(request.getParameter("cPage"));			
		} catch(NumberFormatException e) {
			// 예외가 발생한 경우, cpage는 1로 유지
		}
		
		int numPerPage = 10;
		
		// 2. 업무로직
		List<OrderTable> list = adminService.selectOrderTableList(cpage, numPerPage);
		List<OrderDessertExt> orderDessertExt = adminService.selectOrderDessertExtList(cpage, numPerPage);
		
		// 페이지바 처리
		int totalContents = adminService.selectOrderTableCount();
		
		String url = request.getRequestURI();	// 현재 경로 가져옴
		String pageBar = MvcUtils.getPageBar(totalContents, cpage, numPerPage, url);
		
		// 3. view단 처리 : forwarding
		request.setAttribute("list", list);
		request.setAttribute("orderDessertExt", orderDessertExt);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/WEB-INF/views/admin/orderManagement.jsp")
				.forward(request, response);
	}
	

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
