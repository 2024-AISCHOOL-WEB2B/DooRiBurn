package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.FilmLikeDAO;
import com.model.FilmLikeDTO;
import com.model.MemberDAO;
import com.model.MemberDTO;

import java.util.List;

@WebServlet("/FilmLikeService")
public class FilmLikeService extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String email = request.getParameter("email");
		int f_num = Integer.parseInt(request.getParameter("f_num"));
		 
			
		FilmLikeDTO dto = new FilmLikeDTO(email, f_num);
		FilmLikeDAO dao = new FilmLikeDAO();
		
		System.out.println(email);
		System.out.println(f_num);
		String message;

        if (dao.isLiked(dto)) {
        	int cnt = dao.removeLike(dto);
        	if(cnt>0) {
        		message = "좋아요가 취소성공";
        	}else {
        		message = "좋아요가 취소ㅅㅍ";
			}
            
        } else {
        	int cnt =dao.addLike(dto);
        	if(cnt>0) {
        		message = "좋아요가 추가성공";
        	}else {
        		message = "좋아요가 ㅊㄱㅅㅍ";
			}
           
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"message\":\"" + message + "\"}");
    }

	// 7/26 14:23 찜 목록 조회하는 기능 추가

	/*protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = (String) request.getSession().getAttribute("email");

		FilmLikeDAO likeDAO = new FilmLikeDAO();
		List<FilmLikeDTO> likes = likeDAO.getLikes(email);

		request.setAttribute("likes", likes);
		request.getRequestDispatcher("likeList.jsp").forward(request, response);
	}*/
}

