package member.controller;

import java.io.IOException;

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
 * Servlet implementation class MemberUpdatePasswordServlet
 */
@WebServlet("/member/updatePassword")
public class MemberUpdatePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdatePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 전송값 꺼내서 변수에 기록하기.
		//String javax.servlet.ServletRequest.getParameter(String arg0)
		String memberId = request.getParameter("memberId");
		String memberPw = MvcUtils.getEncryptedPassword(request.getParameter("memberPw"));//암호화처리
		String newMemberPw = MvcUtils.getEncryptedPassword(request.getParameter("newMemberPw")); //암호화처리
		String newPasswordCheck = MvcUtils.getEncryptedPassword(request.getParameter("newPasswordCheck")); //암호화처리

		//2.서비스로직
		Member member = memberService.selectOne(memberId);
		//현재패스워드를 맞게 입력했으면, 비밀번호를 업데이트함. 
		//그렇지 않으면, 비밀번호변경폼으로 이동
		
		
		String msg = "";
		String loc = request.getContextPath();
		loc += "/member/memberView?memberId="+memberId;
		if(member != null && memberPw.equals(member.getMemberPw()) && newMemberPw.equals(newPasswordCheck)){
			//현재 member객체에 갱신할 비밀번호를 업데이트
			member.setMemberPw(newMemberPw);
			int result = memberService.updatePassword(member);
			if(result > 0)
				msg = "패스워드 변경 성공!";
			else 
				msg = "패스워드 변경 실패!";
		}
		else {
			msg = "패스워드를 잘못 입력하셨습니다.";
		}
		HttpSession session = request.getSession();
		session.setAttribute("msg", msg);
		response.sendRedirect(loc);

	}

}
