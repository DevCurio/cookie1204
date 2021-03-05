package admin.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.MvcFileRenamePolicy;
import product.model.service.DessertService;
import product.model.vo.Dessert;

/**
 * Servlet implementation class DessertUpload
 */
@WebServlet("/admin/dessertUpload")
public class DessertUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DessertService dessertService = new DessertService();
	private static final String UPLOAD_DIR = "filefolder";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/admin/dessertUploadView.jsp")
		   .forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 파일이 포함된 사용자 요청 처리 MultipartRequest객체 생성 */
		/*
		 new MultipartRequest(
		 			HttpServletRequest request, 
		 			String saveDirectory, 		//업로드파일의 저장경로(절대경로)
		 			int maxPostSize, 			//최대크기제한 10mb
		 			String encoding, 			//인코딩
		 			FileRenamePolicy policy 	//파일이름 재지정 정책 객체
		 		)
		 */
		//application : WAS실행시부터 종료시까지 운영되는 객체
		String saveDirectory = getServletContext().getRealPath("/images/dessert");
		System.out.println("saveDirectory@DessertUpload = " + saveDirectory);
		System.out.println("web-content/img에 저장하기 위한 폴더:"+request.getContextPath()+"/images/dessert");
		
//		String uploadFilePath = applicationPath + UPLOAD_DIR;
		
		//byte단위 : 1mb = 1kb * 1kb
		int maxPostSize = 100 * 1024 * 1024;
		
		String encoding = "utf-8";
		
		//중복파일에 대해서 number부여
//		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		FileRenamePolicy policy = new MvcFileRenamePolicy();
		
		//MultipartRequest객체 생성
		MultipartRequest multipartReq = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		
		//MultipartRequest를 사용하면, 기존 request로 부터 사용자 입력값을 가져올 수 없다.
		//1.사용자 입력값으로 dessert객체 생성
		
		String category = multipartReq.getParameter("Category");
		String dessert_name =multipartReq.getParameter("dessert_name");
		int dessert_price =Integer.parseInt(multipartReq.getParameter("dessert_price"));
		String memo =multipartReq.getParameter("memo");
		int amount =Integer.parseInt(multipartReq.getParameter("amount"));
		String is_popular=multipartReq.getParameter("is_popular");
		String dessertOriginalFileName = multipartReq.getOriginalFileName("upload-file");
		String dessertRenamedFileName = multipartReq.getFilesystemName("upload-file");
		
		//기존첨부파일정보
//		String oldBoardOriginalFileName = multipartReq.getParameter("oldBoardOriginalFileName");
//		String oldBoardRenamedFileName = multipartReq.getParameter("oldBoardRenamedFileName");
		
		System.out.println("category:"+category);
		System.out.println("name:"+dessert_name);
		System.out.println("price:"+dessert_price);
		System.out.println("description: "+memo);
		System.out.println("amount : "+amount);
		System.out.println("is popular?:"+is_popular);
	
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String ss=sdf.format(new java.util.Date());
		java.sql.Date d= java.sql.Date.valueOf(ss);
		
		Dessert dessert = new Dessert(0, category, dessert_name,memo,amount,dessert_price,dessertOriginalFileName,dessertRenamedFileName, 
				is_popular,d,"N");
		
		
		//DML처리결과는  int타입
		int result = dessertService.insertDessert(dessert);
		System.out.println("result ="+result);
		String msg = result > 0 ? "게시글 등록 성공!" : "게시글 등록 실패!"; 
		//board.getBoardNo()를 통해서 새로 등록된 게시글 번호 가져오기
		
		String location = result > 0 ?
				request.getContextPath() + "/admin/dessertUploadView?dessertNum=" + dessert.getDessertNum() : 
					request.getContextPath() + "/product/shoppingMain";
		
		System.out.println("location = "+location);
						
		//3.사용자 피드백(msg) 및 redirect처리 (/mvc/board/boardList)
		//DML이후 반드시 요청url을 변경할 것
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(location);
		
	
	}

}
