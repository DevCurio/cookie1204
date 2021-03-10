package common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.QnaService;
import board.model.vo.Qna;
import member.model.vo.Member;

/**
 * Servlet Filter implementation class AuthOrAdminFilter
 */
@WebFilter({"/board/qnaDelete"})
public class AuthOrAdminFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AuthOrAdminFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		HttpServletRequest httpReq = (HttpServletRequest)request;
		HttpSession session  = httpReq.getSession();
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
		HttpServletResponse httpResp = (HttpServletResponse)response;

		int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));
		Qna qna = new QnaService().selectQnaOne(qnaNum);
		
		
		if(memberLoggedIn == null
			|| qna == null
			|| !("Y".equals(memberLoggedIn.getIsAdmin())
				|| memberLoggedIn.getMemberId().equals(qna.getQnaWriter()))) {
			
			session.setAttribute("msg", "잘못된 시도입니다.");
			httpResp.sendRedirect(httpReq.getContextPath());
			return;
		}
		
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
