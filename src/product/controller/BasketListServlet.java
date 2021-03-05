package product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import product.model.service.BasketService;
import product.model.vo.Basket;


/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/product/basketList")
public class BasketListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BasketService  basketService = new BasketService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
			//2. 업무로직 : 각 페이지에 해당하는  게시글 가져오기
				
			
				HttpSession session = request.getSession();
			
				Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
				System.out.println("memberL"+memberLoggedIn.getMemberId());
			List<Basket> basketlist = basketService.selectBasketList(memberLoggedIn.getMemberId()); 
			
			System.out.println(basketlist);
			
			
			//jsp에 전달한 값은 request속성을 이용한다.
			request.setAttribute("basketlist",basketlist);
	
			
			request.getRequestDispatcher("/WEB-INF/views/product/basketList.jsp")
				   .forward(request, response);
			
		} catch(Exception e) {
			//예외처리 
			e.printStackTrace();
			
			//WAS에게 예외를 다시 던지기
		
			
		}
}
}