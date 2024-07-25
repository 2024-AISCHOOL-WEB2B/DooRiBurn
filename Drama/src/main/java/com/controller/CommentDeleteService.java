package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.CommentDAO;
 
 
@WebServlet("/CommentDeleteService")
public class CommentDeleteService extends HttpServlet { 
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		CommentDAO dao = new CommentDAO(); 
		int cmt_num = Integer.parseInt(request.getParameter("cmt_num")); 
		int c_num = Integer.parseInt(request.getParameter("c_num")); 
		
		int cnt = dao.commentDelete(cmt_num);
		if (cnt > 0) {
			System.out.println("댓글 삭제 성공");
		} else {
			System.out.println("댓글 삭제 실패");
		} 
		response.sendRedirect("contestView.jsp?c_num=" + c_num); 
	}

}
