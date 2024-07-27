package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;
 
@WebServlet("/findNickByEmailService")
public class findNickByEmailService extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
		MemberDAO dao = new MemberDAO();
        String email = request.getParameter("email");
        String nick = dao.findNickByEmail(email);
        request.setAttribute("nick", nick != null ? nick : "Not found");
        request.getRequestDispatcher("/contestView.jsp").forward(request, response);
    }
}


	 