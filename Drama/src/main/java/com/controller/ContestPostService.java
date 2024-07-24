package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.CommentDAO;
import com.model.CommentDTO;
import com.model.ContestDAO;
import com.model.ContestDTO;
import com.model.MemberDAO;
import com.model.MemberDTO;
 
@WebServlet("/ContestPostService")
public class ContestPostService extends HttpServlet { 
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		HttpSession session = request.getSession();	
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		request.setCharacterEncoding("EUC-KR");		 
		String title = request.getParameter("contestTitle"); 
		String img = request.getParameter("contestImg"); 
		String content = request.getParameter("contestContent"); 
		 
		ContestDTO dto = new ContestDTO(title, img, content);
		ContestDAO dao = new ContestDAO();  
		
		int cnt = dao.contestPost(dto);
		

		if(cnt > 0) {
			System.out.println("글 작성 성공");
			response.sendRedirect("contestBoard.jsp");
		}else {
			System.out.println("글 작성 실패");
            // JavaScript alert 창 띄우기
            response.setContentType("text/html; charset=EUC-KR");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('글 작성 실패');</script>");
            out.flush();
		}
		  
		
	}

}
