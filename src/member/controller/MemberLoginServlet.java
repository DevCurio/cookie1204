package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.MvcUtils;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * @WebServlet : web.xml에 servlet, servlet-mapping태그 등록을 대신해주는 annotation
 */
@WebServlet("/member/login")
public class MemberLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	MemberService memberService = new MemberService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 인코딩처리
//		request.setCharacterEncoding("utf-8");
		
		//2. 사용자입력값 처리
		String memberId = request.getParameter("memberId");
		String password = MvcUtils.getEncryptedPassword(request.getParameter("memberPw"));
		String saveId = request.getParameter("saveId");
		//3. 업무로직 : 사용자입력 아이디/비번이 DB에 저장된 아이디/비번과 일치 여부 판단
		
		Member member = memberService.selectOne(memberId);
		
		//로그인 성공
		if(member != null && password.equals(member.getMemberPw())) {
			//request.setAttribute("msg", "로그인 성공!");
			
			HttpSession session = request.getSession(true);
			session.setAttribute("memberLoggedIn", member);
			
			//saveId쿠키설정
			Cookie c = new Cookie("saveId", memberId);
			
			c.setPath(request.getContextPath());

			//saveId체크한 경우
			if(saveId != null) {
				//유효기간설정(초단위)
				//client(브라우져)에서 쿠키를 보관한 시간설정
				c.setMaxAge(7 * 24 * 60 * 60);
			}
			//saveId체크안한 경우 : 브라우져의 쿠키를 삭제
			else {
				c.setMaxAge(0);//즉시 삭제
			}
			response.addCookie(c);
			
			//4. redirection처리 : 요청 url을 변경
			//주어진 주소(location)로 클라이언트에게 다시 요청하라는 응답
			String location = request.getContextPath();
			response.sendRedirect(location);
			
		}
		//로그인 실패 : 아이디 존재X, 비번이 틀린 경우
		else {
			
			HttpSession session = request.getSession(true);
			session.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");

			//4. view단 처리 (jsp)
			response.sendRedirect(request.getContextPath());
		}

	}

}
