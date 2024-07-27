package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import com.model.CommentLikeDAO;
import com.model.CommentLikeDTO; 
 
@WebServlet("/CommentLikeDelService")
public class CommentUnlikeService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		int cmt_num = Integer.parseInt(request.getParameter("cmt_num"));  
        
		CommentLikeDAO dao = new CommentLikeDAO();
        List<CommentLikeDTO> likes = dao.getCommentLike(email);
        boolean userLiked = likes.stream().anyMatch(like -> like.getCmt_num() == cmt_num);

        int likeCount = dao.commentLikeCount(cmt_num); 

        response.setContentType("application/json");
        response.getWriter().write("{\"likeCount\":" + likeCount + ",\"userLiked\":" + userLiked + "}");
	}
}
