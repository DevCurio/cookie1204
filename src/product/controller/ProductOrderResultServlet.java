package product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product.model.service.BasketService;
import product.model.service.ProductService;
import product.model.vo.Basket;
import product.model.vo.OrderDessert;
import product.model.vo.OrderTable;

/**
 * Servlet implementation class ProductOrderResultServlet
 */
@WebServlet("/product/orderResult")
public class ProductOrderResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ProductService productService = new ProductService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.getRequestDispatcher("/WEB-INF/views/product/orderResult.jsp").forward(request, response);
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("오더리절트 서블렛 도착");
		
		// 주문표 정보
		String orderTradeNum = request.getParameter("orderTradeNum");					// 주문번호
		String orderReceiveName = request.getParameter("orderReceiveName");				// 받는사람 이름
		String zipCode = request.getParameter("orderZipCode");							// 우편번호
		String orderReceiveAddr = request.getParameter("orderReceiveAddr");				// 기본 주소
		String orderReceiveAddrDetail = request.getParameter("orderReceiveAddrDetail");	// 상세 주소
		String orderReceivePhone = request.getParameter("orderReceivePhone");			// 전화번호 (집)
		String orderReceiveMobile = request.getParameter("orderReceiveMobile");			// 핸드폰 번호
		String orderMemo = request.getParameter("orderMemo");							// 요구사항
		int orderSumMoney = Integer.parseInt(request.getParameter("orderSumMoney"));	// 합계금액
		String orderEmail = request.getParameter("orderEmail");							// 이메일
		String memberId = request.getParameter("memberId");								// 아이디
		int cardNum = Integer.parseInt(request.getParameter("cardNum"));				// 카드 승인번호
		
		OrderTable orderTable = new OrderTable(0, orderTradeNum, null, orderReceiveName, zipCode, orderReceiveAddr, orderReceiveAddrDetail, orderReceivePhone, orderReceiveMobile, orderEmail, orderMemo, orderSumMoney, "card", 
												null, 0, null, memberId, cardNum);
		
		// 오더테이블 JDBC
		int result = productService.insertOrderTable(orderTable);
		
		// 문제가 있으면 바로 반환
		HttpSession session = request.getSession();
		if(result <= 0) {
			session.setAttribute("msg", "결제 처리 오류. 관리자에게 문의하세요.");
			response.sendRedirect(request.getContextPath());
		}
		
		// 장바구니 정보 가져오기
		List<Basket> list = productService.selectBasketList(memberId);
		
		// 오더디저트 테이블 작성
		OrderDessert orderDessert = null;
		for(Basket b : list) {
			orderDessert = new OrderDessert();
			result = 0;
			
			orderDessert.setOrderTradeNum(orderTradeNum);
			orderDessert.setDessertNum(b.getDessertNum());
			orderDessert.setOrderDessertAmount(b.getBasketAmountNum());
			orderDessert.setOrderDessertDelete("N");
			
			result = productService.insertOrderDessert(orderDessert);
			
			if(result <= 0) {
				session.setAttribute("msg", "결제 처리 오류. 관리자에게 문의하세요.");
				response.sendRedirect(request.getContextPath());
			}
		}
		
		result = 0;
		result = new BasketService().deleteBasketList(memberId);
		
		if(result > 0) {
			session.setAttribute("msg", "결제에 성공하였습니다.");
			response.sendRedirect(request.getContextPath() + "/product/orderResult");
		} else {
			session.setAttribute("msg", "결제 정보 처리에 문제가 생겼습니다. 관리자에게 문의해주세요.");
			response.sendRedirect(request.getContextPath());
		}
		
	}
}
