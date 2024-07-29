package dooriburn.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dooriburn.com.model.MemberDAO;
import dooriburn.com.model.MemberDTO;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");

		MemberDTO dto = new MemberDTO(email, pw);
		MemberDAO dao = new MemberDAO();

		MemberDTO info = dao.login(dto);

		HttpSession session = request.getSession();
		// 이전 페이지로 리다이렉트
	    String previousPage = (String) session.getAttribute("previousPage");
		if (info != null) {

			if (pw.equals(info.getPw())) {
				System.out.println("로그인 성공");
				session.setAttribute("info", info);
				session.setMaxInactiveInterval(3600);
			    if (previousPage != null) {
			        response.sendRedirect(previousPage);
			    } else {
			        response.sendRedirect("Realindex.jsp"); // 기본 리다이렉트 페이지
			    }

		}

		} else {
			System.out.println("로그인 실패");
			session.setAttribute("error", "존재 하지 않는 이메일입니다.");
			session.setMaxInactiveInterval(3);
			response.sendRedirect("login.jsp");
		}
		
		

	}

}
