package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.model.service.AdminService;

/**
 * Servlet implementation class OrderCancelServlet
 */
@WebServlet("/admin/orderCancel")
public class OrderCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String orderTradeNum = request.getParameter("orderTradeNum");
		
		int result = new AdminService().orderCancel(orderTradeNum);
		
		if(result <= 0) {
			HttpSession session = request.getSession();
			session.setAttribute("msg", "취소작업에 문제가 있습니다.");
		}
		
		response.sendRedirect(request.getContextPath() + "/admin/orderManagement");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
