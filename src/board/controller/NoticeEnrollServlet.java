package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import board.model.service.NoticeService;
import board.model.vo.Notice;
import common.MvcFileRenamePolicy;

/**
 * Servlet implementation class QnaEnrollServlet
 */
@WebServlet("/board/noticeEnroll")
public class NoticeEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeService noticeService = new NoticeService();
	private static final String UP_FILE = "filefolder";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/board/noticeEnroll.jsp")
		   .forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String saveDirectory = getServletContext().getRealPath("/images/notice");
		System.out.println("saveDirectory@DessertUpload = " + saveDirectory);
		System.out.println("web-content/img에 저장하기 위한 폴더:"+request.getContextPath()+"/images/notice");
		
//		String uploadFilePath = applicationPath + UPLOAD_DIR;
		
		//byte단위 : 1mb = 1kb * 1kb
		int maxPostSize = 100 * 1024 * 1024;
		
		String encoding = "utf-8";
		
		//중복파일에 대해서 number부여

		FileRenamePolicy policy = new MvcFileRenamePolicy();
		
		//MultipartRequest객체 생성
		MultipartRequest multipartReq = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		
		//1.사용자 입력값으로 qna 객체 생성
		String noticeTitle = multipartReq.getParameter("noticeTitle");
		String noticeContent = multipartReq.getParameter("noticeContent");
		String noticeWriter = multipartReq.getParameter("noticeWriter");
		String noticeOriginalFileName = multipartReq.getOriginalFileName("upFile");
		String noticeRenamedFileName = multipartReq.getFilesystemName("upFile");
		Notice notice = new Notice(0, noticeTitle, noticeContent, noticeWriter, noticeOriginalFileName, noticeRenamedFileName, null, null);
		
		//2.업무로직 : qna 객체 db저장 요청
		//DML처리 결과는 int 타입
		int result = noticeService.insertNotice(notice);
		String msg = result > 0 ? "공지글  등록 성공!" : "공지글  등록 실패!";
	
		//qna.getQnaNo()를 통해서 새로 등록된 게시글 번호 가져오기
		String location = result > 0 ?
							request.getContextPath() + "/board/noticeView?noticeNum=" + notice.getNoticeNum() :
								request.getContextPath() + "/board/noticeList";
		//3.사용자 피드백(msg) 및 redirect처리 (/cookie__1204/board/qnaList)
		//DML이후 반드시 요청url을 변경할 것
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(location);
		
		
	}
}