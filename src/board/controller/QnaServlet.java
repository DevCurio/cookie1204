package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.QnaService;
import board.model.vo.Qna;
import common.MvcUtils;


/**
 * Servlet implementation class QnaServlet
 */
@WebServlet("/board/qna")
public class QnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	QnaService qnaService = new QnaService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 서블렛 문 전체를 트라이캐치에 집어넣음.
		try {
			//1. 사용자 입력값 처리 cpage, numPerPage = 10
			//1.파라미터 핸들링
			final int numPerPage = 10;	// 한 페이지에 나올 게시글 수
			int cPage = 1;
			
			try {
				cPage = Integer.parseInt(request.getParameter("cPage"));			
			}catch(NumberFormatException e) {
				
			}
			
			//2. 업무로직 : 각 페이지에 해당하는  게시글 가져오기
			List<Qna> list = qnaService.selectQnaList(cPage, numPerPage); 
			
			//페이지바 작성 
			//totalContents 총게시물수
			int totalContents = qnaService.selectQnaCount();
			//url 페이지링크를 클릭했을때 이동할 주소
			String url = request.getRequestURI();
			String pageBar = MvcUtils.getPageBar(totalContents, cPage, numPerPage, url);
			
			//3. view단 forwarding처리 /WEB-INF/views/board/boardList.jsp
			//jsp에 전달한 값은 request속성을 이용한다.
			request.setAttribute("list",list);
			request.setAttribute("pageBar",pageBar);		
			request.getRequestDispatcher("/WEB-INF/views/board/qnaList.jsp")
			.forward(request, response);
			
		} catch(Exception e) {
			//예외처리 
			e.printStackTrace();
			
			//WAS에게 예외를 다시 던지기
			throw e;
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
