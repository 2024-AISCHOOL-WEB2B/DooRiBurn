package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.DramaSearchDAO;
import com.model.DramaSearchDTO;

@WebServlet("/SearchService")
public class SearchService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String category = request.getParameter("category");
		String search = request.getParameter("search");
		
		int num =0;
		if(category.equals("1")) {
			num =1;
		}
		
		System.out.println(num);
		System.out.println(search);
//		
//		DramaSearchDAO dao = new DramaSearchDAO();
//		DramaSearchDTO dto = search.dao(num,search);
				

		response.sendRedirect("search.jsp");
	
	}

}
