package board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.model.service.AdminService;
import board.model.service.NoticeService;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/board/NoitceDeleteList")
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeService noticeService = new NoticeService();
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//2.전송값 꺼내서 변수에 기록하기.
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
		String rName = request.getParameter("rName");
		//4. 받은 결과에 따라 뷰페이지 내보내기
	
		int result = noticeService.Noticedelete(noticeNum);
		String msg = result > 0 ? "공지글 삭제 성공!" : "공지글 삭제 실패!";
		

		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/board/noticeList");
	}


}