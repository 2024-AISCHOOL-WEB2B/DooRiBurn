package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;


@WebServlet("/EmailCheckService")
public class EmailCheckService extends HttpServlet {
	

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("userEmail");
		
		PrintWriter out = response.getWriter();
		
		MemberDAO dao = new MemberDAO();
		
		int cnt = dao.checkEmail(email);
		
		if(cnt == 0) {
			System.out.println("이미 존재하는 이메일입니다.");
		}else {
			System.out.println("사용 가능한 아이디입니다.");
		}
		
		out.write(cnt + "");
	}

}
