package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.MvcUtils;
import member.model.service.MemberService;
import member.model.vo.Member;
import product.model.vo.OrderDessertExt;
import product.model.vo.OrderTable;

/**
 * Servlet implementation class MemberOrderListServlet
 */
@WebServlet("/member/orderList")
public class MemberOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	MemberService memberService = new MemberService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if(session == null) {
			session = request.getSession();
			session.setAttribute("msg", "잘못된 접근입니다.");
			response.sendRedirect(request.getContextPath());
		}
		Member member = (Member)session.getAttribute("memberLoggedIn");
		
		// cpage = 선택된 페이지
		int cpage = 1;
		try {
			cpage = Integer.parseInt(request.getParameter("cPage"));			
		} catch(NumberFormatException e) {
			// 예외가 발생한 경우, cpage는 1로 유지
		}
		
		int numPerPage = 10;
		
		// 2. 업무로직
		List<OrderTable> otList = memberService.selectMemberOrderList(cpage, numPerPage, member.getMemberId());
		List<OrderDessertExt> odeList = memberService.selectMemberOrderDessertExt(cpage, numPerPage, member.getMemberId());
		
		// 페이지바 처리
		int totalContents = memberService.selectMemberOrderCount(member.getMemberId());
		
		String url = request.getRequestURI();	// 현재 경로 가져옴
		String pageBar = MvcUtils.getPageBar(totalContents, cpage, numPerPage, url);
		
		// 3. view단 처리 : forwarding
		request.setAttribute("otList", otList);
		request.setAttribute("odeList", odeList);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/WEB-INF/views/member/orderList.jsp")
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
