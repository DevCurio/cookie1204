package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.model.service.AdminService;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/admin/memberDeleteList")
public class AdminMemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//2.전송값 꺼내서 변수에 기록하기.
		String memberId = request.getParameter("memberId");
		System.out.println(memberId);
			//3.서비스로직호출
		int result = adminService.admindeleteMember(memberId);
		
		//4. 받은 결과에 따라 뷰페이지 내보내기
		String msg = "";
		String loc = request.getContextPath() +"/admin/memberList";
		//루트디렉토리를 가져온다 !http://localhost:9090/cookie__1204/
		HttpSession session = request.getSession();
		session = request.getSession();
		if(result>0) {
			msg = "성공적으로 회원정보를 삭제했습니다.";
			//세션무효화후 새로 생성
			
		}
		else {
			msg = "회원정보삭제에 실패했습니다.";
			
		}
		
		session.setAttribute("msg", msg);
//		request.setAttribute("loc", loc);
		
		response.sendRedirect(loc);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}