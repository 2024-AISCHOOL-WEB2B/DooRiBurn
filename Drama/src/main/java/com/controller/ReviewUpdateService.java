package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.DramaSearchDAO;
import com.model.DramaSearchDTO;
import com.model.MemberDAO;
import com.model.MemberDTO;
import com.model.ReviewDAO;
import com.model.ReviewDTO;


@WebServlet("/ReviewUpdateService")
public class ReviewUpdateService extends HttpServlet {
	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		String index = request.getParameter("index");
		DramaSearchDAO Drama_dao = new DramaSearchDAO();
		ArrayList<DramaSearchDTO> film_detail = Drama_dao.film_detail(index);
		
		String email = info.getEmail();
		Double f_num = film_detail.get(0).getFNum();
		int rating = Integer.parseInt(request.getParameter("reviewStar"));
		String content = request.getParameter("content");
		String[] mood = request.getParameterValues("mood");
		
		System.out.println(email);
		System.out.println(f_num);
		System.out.println(rating);
		System.out.println(content);
		System.out.println(mood[0]);
		
		
		ReviewDTO dto = new ReviewDTO(email, f_num, rating, content, mood);
		ReviewDAO dao = new ReviewDAO();
		
		int cnt = dao.Insert(dto);
		
		if(cnt > 0) {
			System.out.println("리뷰 저장성공");
		}else {
			System.out.println("리뷰 저장실패");
		}
		
		response.sendRedirect("detail.jsp?index="+index);
	}

}
