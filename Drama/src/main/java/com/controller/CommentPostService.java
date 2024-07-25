package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.ContestDAO;
import com.model.ContestDTO;
import com.model.CommentDAO;
import com.model.CommentDTO; 
import com.model.MemberDTO;
 
@WebServlet("/CommentPostService")
public class CommentPostService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();		
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		 
		String img = request.getParameter("conmmentImg");  
		int num = Integer.parseInt(request.getParameter("c_num"));
		String email = info.getEmail();
		 
		// cmt_content, cmt_title 삭제 필요~~ !!!!!!!!!!!!!!!!!!!!
		
		CommentDTO dto = new CommentDTO(img, num, email);
		CommentDAO dao = new CommentDAO(); 
		
		int cnt = dao.commentPost(dto);
		
		
		if(cnt > 0) {
			System.out.println("댓글 작성 성공");
			response.sendRedirect("contestBoard.jsp");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('댓글 작성 성공');</script>");
            out.flush();
		}else {
			System.out.println("댓글 작성 실패");
            // JavaScript alert 창 띄우기
            response.setContentType("text/html; charset=EUC-KR");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('댓글 작성 실패');</script>");
            out.flush();
		}
		
		
		
		
		  
		
		
		
		
		
	}

}
