package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberEnrollServlet
 */
@WebServlet("/member/memberEnroll")
public class MemberEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService memberService = new MemberService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request
			.getRequestDispatcher("/WEB-INF/views/member/memberEnroll.jsp")
			.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		
		request.setCharacterEncoding("UTF-8");
		
		//2.전송값 꺼내서 변수에 기록
		String memberId = request.getParameter("member_Id");
		String memberPw = request.getParameter("member_pw");
		String name = request.getParameter("member_name");
		String societyNum1 = request.getParameter("society_front_number");
		String societyNum2 = request.getParameter("society_back_number");
		String email = request.getParameter("email");
		String emailGet = request.getParameter("email_get");
		String mobileNum = request.getParameter("mobile_number");
		String phoneNum = request.getParameter("phone_number");
		String zipCode = request.getParameter("zip_code");
		String memberAddr = request.getParameter("member_addr");
		String memberAddrDetail = request.getParameter("member_addr_detail");
		String isAdmin = request.getParameter("isAdmin");
		Date enrollDate = null;
		String memberDelete = request.getParameter("memberDelete");

		//날짜타입으로 변경 : 1990-09-09
//		Date enrollDate = null;
//		if(enrollDate != null && !"".equals(enrollDate))
//			enrollDate = Date.valueOf(enrollDate);
		
		//isAdmin은 N, enrollDate는 null로 처리
		Member member = 
				new Member(memberId, memberPw, name, societyNum1, societyNum2, email, 
						emailGet, mobileNum, phoneNum, zipCode, 
						memberAddr, memberAddrDetail, "N", null, "N");
		
		System.out.println("member@servlet = "+member);
		
		//3.서비스로직호출
		int result = memberService.insertMember(member);
		
		//4.view단 처리
		String msg = "";
		
		//DML, login등 요청후 반드시 url을 변경해서 새로고침 사고를 방지한다.
		String loc = request.getContextPath();
		String view = "/index.jsp";
		
		if(result>0)
			msg = "성공적으로 회원가입되었습니다.";
		else 
			msg = "회원등록에 실패했습니다.";	
		
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + view);

	}
}
