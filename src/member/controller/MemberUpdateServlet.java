package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.MvcUtils;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/member/memberUpdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.전송값에 한글이 있을 경우 인코딩처리해야함.
		//void javax.servlet.ServletRequest.setCharacterEncoding(String arg0) throws UnsupportedEncodingException
		request.setCharacterEncoding("UTF-8");//대소문자 상관없음. 요청한 view단의 charset값과 동일해야 한다.
		
		//2.전송값 꺼내서 변수에 기록하기.
		String memberId = request.getParameter("member_id");
//		String memberPw = MvcUtils.getEncryptedPassword(request.getParameter("member_pw"));
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

		//isAdmin은 N, enrollDate는 null로 처리
		Member member = 
				new Member(memberId, "1234" , name, societyNum1, societyNum2, email, 
						emailGet, mobileNum, phoneNum, zipCode, 
						memberAddr, memberAddrDetail, "N", null, "N");
		
		
		
		//3.서비스로직호출
		int result = memberService.updateMember(member);  
		//4. 받은 결과에 따라 뷰페이지 내보내기
//		String view = "/index.jsp";
		String msg = null;
		String loc = request.getContextPath() + "/member/memberView?memberId=" + member.getMemberId();
		HttpSession session = request.getSession();
		if(result>0){
			msg = "성공적으로 회원정보를 수정했습니다.";
			
			//세션의 memberLoggedIn객체도 최신화
			session.setAttribute("memberLoggedIn", memberService.selectOne(memberId));
		}
		else {
			msg = "회원정보수정에 실패했습니다.";	
		}
		
		session.setAttribute("msg", msg);
		
		
		response.sendRedirect(loc);
//		RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
//		reqDispatcher.forward(request, response);
	}

}
