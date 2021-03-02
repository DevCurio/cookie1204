package common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class idCheckServlet
 */
@WebServlet("/idCheckServlet")
public class idCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_Id = request.getParameter("member_Id");
        PrintWriter out = response.getWriter();
        if(member_Id.equals("hse")) {
            out.print("fail");
        }else {
            out.print("success");
        }
	}

}
