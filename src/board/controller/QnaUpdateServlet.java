package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.QnaService;
import board.model.vo.Qna;
import member.model.vo.Member;



/**
 * Servlet implementation class QnaUpdateServlet
 */
@WebServlet("/board/qnaUpdate")
public class QnaUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	QnaService qnaService = new QnaService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));
		String memberId = request.getParameter("memberId");
		
		Qna qna = qnaService.selectQnaOne(qnaNum);
		
		HttpSession session = request.getSession();
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
		
		if(memberLoggedIn == null
			|| !qna.getQnaWriter().equals(memberId)) {
			session.setAttribute("msg", "해당 아이디로 접근해주세요.");
			response.sendRedirect(request.getContextPath());
		}
		
		
		String path = null;
		if(qna != null) {
			request.setAttribute("qna", qna);
			path = "/WEB-INF/views/board/qnaUpdate.jsp";
		} else {
			session.setAttribute("msg", "정보가 없습니다.");
			path = "/WEB-INF/views/board/qnaList.jsp";
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));
		String qnaTitle = request.getParameter("qnaTitle");
		qnaTitle = qnaTitle.replaceAll("(수정됨) ", "");
		qnaTitle = "(수정됨) " + qnaTitle;
		
		String qnaContent = request.getParameter("qnaContent");
		qnaContent = qnaContent.replaceAll("<br />", "\n");
		
		Qna qna = new Qna(qnaNum, qnaTitle, qnaContent, null, 0, 0, null, null);
		
		int result = new QnaService().qnaUpdate(qna);
		
		HttpSession session = request.getSession();
		
		String msg = result > 0 ? "내용을 변경했습니다." : "작업에 실패했습니다.";
	
		session.setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/board/qnaView?qnaNum=" + qnaNum);
	}

}
