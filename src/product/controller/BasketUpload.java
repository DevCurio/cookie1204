package product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import product.model.service.BasketService;
import product.model.service.DessertService;
import product.model.vo.Basket;
import product.model.vo.Dessert;

/**
 * Servlet implementation class BasketUpload
 */
@WebServlet("/product/BasketUpload")
public class BasketUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DessertService dessertService = new DessertService();
	BasketService basketService = new BasketService();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int amount = Integer.parseInt(request.getParameter("amount"));
		int dessertNum = Integer.parseInt(request.getParameter("dessertNum"));
		
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("memberLoggedIn");
		
		if(member == null) {
			String msg = "로그인 후에 이용할 수 있습니다."; 
			
			String location = request.getContextPath() + "/product/shoppingMain";
						
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect(location);
			
		}
		else {

			
			System.out.println("amount : "+amount);
			Dessert dessert = dessertService.selectOne(dessertNum);
			
			Basket basket=new Basket(0,amount,dessert.getDessertPrice()*amount,
									member.getMemberId(),dessertNum,"N",null,member.getMemberName(),dessert.getDessertPrice());
			
			int result = basketService.insertBasket(basket);
			
			String msg = result > 0 ? "장바구니 등록 성공!" : "장바구니 등록 실패!"; 
			
			String location = result > 0 ?
					request.getContextPath() + "/product/basketList" : 
						request.getContextPath() + "/product/shoppingMain";
			
							
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect(location);
			
		}


	}

}
