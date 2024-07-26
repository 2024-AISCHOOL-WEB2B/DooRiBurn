package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.FilmLikeDAO;
import com.model.FilmLikeDTO;

import java.util.List;

@WebServlet("/FilmLike")
public class FilmLike extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = (String) request.getSession().getAttribute("email");
		int filmNum = Integer.parseInt(request.getParameter("filmNum"));

		FilmLikeDAO likeDAO = new FilmLikeDAO();

		if (likeDAO.isLiked(email, filmNum)) {
			likeDAO.removeLike(email, filmNum);
		} else {
			FilmLikeDTO like = new FilmLikeDTO(email, filmNum);
			likeDAO.addLike(like);
		}

		response.sendRedirect("LikeButton.jsp?filmNum=" + filmNum);
	}
	
	// 7/26 14:23 찜 목록 조회하는 기능 추가

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = (String) request.getSession().getAttribute("email");

		FilmLikeDAO likeDAO = new FilmLikeDAO();
		List<FilmLikeDTO> likes = likeDAO.getLikes(email);

		request.setAttribute("likes", likes);
		request.getRequestDispatcher("likeList.jsp").forward(request, response);
	}
}
