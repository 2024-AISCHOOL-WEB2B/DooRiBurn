package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ContestDAO; 
 
@WebServlet("/ContestDeleteService")
public class ContestDeleteService extends HttpServlet {
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ContestDAO dao = new ContestDAO(); 
		int num = Integer.parseInt(request.getParameter("c_num")); 
		
		int cnt = dao.contestDelete(num);
		if (cnt > 0) {
			System.out.println("글 삭제 성공");
		} else {
			System.out.println("글 삭제 실패");
		}
		response.sendRedirect("contestBoard.jsp"); 
		
	}

}
