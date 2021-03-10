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

/**
 * Servlet implementation class QnaViewServlet
 */
@WebServlet("/board/qnaView")
public class QnaViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));

		Qna qna = new QnaService().selectQnaOne(qnaNum);
		
		// content 추가처리
		// xss 공격 대비 (cross site scripting)
		String qnaContent = qna.getQnaContent().replaceAll("<", "&lt;")
													.replaceAll(">", "&gt;");
		// 개행문자
		qnaContent = qnaContent.replaceAll("\\n", "<br>");
		qna.setQnaContent(qnaContent);
		
		HttpSession session = request.getSession();
		if(qna == null || qna.getQnaNum() == 0) {
			session.setAttribute("msg", "게시글이 없거나 잘못된 접근입니다.");
			response.sendRedirect(request.getContextPath() + "/WEB-INF/views/board/qnaList.jsp");
		} else {
			request.setAttribute("qna", qna);
			request.getRequestDispatcher("/WEB-INF/views/board/qnaView.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
