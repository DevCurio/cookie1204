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
 * Servlet implementation class QnaAnswerServlet
 */
@WebServlet("/board/qnaAnswer")
public class QnaAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	QnaService qnaService = new QnaService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));
	
		Qna qna = qnaService.selectQnaOne(qnaNum);
		
		if(qna != null) {
			request.setAttribute("qna", qna);
			request.getRequestDispatcher("/WEB-INF/views/board/qnaAnswer.jsp").forward(request, response);;
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String qnaTitle = request.getParameter("qnaTitle");
		String qnaContent = request.getParameter("qnaContent");
		qnaContent = qnaContent.replaceAll("<br />", "\n");
		int qnaReRef = Integer.parseInt(request.getParameter("qnaReRef"));
		
		HttpSession session = request.getSession();
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
		String qnaWriter = memberLoggedIn.getMemberId();
		
		Qna qna = new Qna(0, qnaTitle, qnaContent, qnaWriter, qnaReRef, 2, null, null);
		
		int result = qnaService.insertQnaReRef(qna);
		
		if(result <= 0) {
			session.setAttribute("mesg", "답글 작성에 실패했습니다.");
		}
		
		response.sendRedirect(request.getContextPath() + "/board/qna");
		
	}

}
