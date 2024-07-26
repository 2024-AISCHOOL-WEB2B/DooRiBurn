package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.model.MemberDAO;
import com.model.MemberDTO;


@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		MemberDTO dto = new MemberDTO(email, pw);
		MemberDAO dao = new MemberDAO();
		
		MemberDTO info = dao.login(dto);
		
		HttpSession session = request.getSession();
		if(info != null) {
			System.out.println("로그인 성공");
				session.setAttribute("info", info);
				session.setMaxInactiveInterval(3600);
				response.sendRedirect("Realindex.jsp");
			if(pw.equals(info.getPw())) {
				
			}
		}else {
			System.out.println("로그인 실패");
			session.setAttribute("error", "아이디 또는 비밀번호가 맞지 않습니다. 다시 확인해 주세요.");
			session.setMaxInactiveInterval(3);
			response.sendRedirect("login.jsp");
		}
		
		
	}

}
