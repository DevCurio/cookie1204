package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.NoticeService;

import board.model.vo.Notice;


/**
 * Servlet implementation class BoardViewServlet
 */
@WebServlet("/board/noticeView")
public class NoticeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private NoticeService noticeService = new NoticeService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


			
			int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
			System.out.println("noticeNum"+noticeNum);
			Notice notice = new NoticeService().selectNoticeOne(noticeNum);//.메소드
			System.out.println("notice@noticeView = " + notice);
			
			
			//XSS공격대비
			String NoticeContent = notice.getNoticeContent()
									   .replaceAll("<", "&lt;")
									   .replaceAll(">", "&gt;");
			//개행문자
			NoticeContent = NoticeContent.replaceAll("\\n", "<br>");
			NoticeContent = NoticeContent.replaceAll("<br />", "\n");
			notice.setNoticeContent(NoticeContent);
		
			
			HttpSession session = request.getSession();
			if(notice == null || notice.getNoticeNum() == 0) {
				session.setAttribute("msg", "공지글이 없거나 잘못된 접근입니다.");
				response.sendRedirect(request.getContextPath() + "/WEB-INF/views/board/noticeList.jsp");
			} else {
				request.setAttribute("notice", notice);
				request.getRequestDispatcher("/WEB-INF/views/board/noticeView.jsp").forward(request, response);
			}
			
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}