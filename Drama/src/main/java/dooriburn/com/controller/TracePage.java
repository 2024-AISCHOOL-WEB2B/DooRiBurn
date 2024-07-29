package dooriburn.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
@WebServlet("/TracePage")
public class TracePage extends HttpServlet { 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		 
        HttpSession session = request.getSession();
        String currentPage = request.getRequestURL().toString();
        
        // 현재 페이지 URL을 세션에 저장
        session.setAttribute("previousPage", currentPage);
        
        // 다음 페이지로 리다이렉트
        String nextPage = request.getParameter("nextPage");
        if (nextPage != null && !nextPage.isEmpty()) {
            response.sendRedirect(nextPage);
        } else {
            response.sendRedirect("Realindex.jsp"); // 기본 리다이렉트 페이지
        }
	}

}
