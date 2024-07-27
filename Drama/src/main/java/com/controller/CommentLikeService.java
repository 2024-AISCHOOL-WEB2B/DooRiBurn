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
 
@WebServlet("/CommentLikeService")
public class CommentLikeService extends HttpServlet {
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        int cmt_num = Integer.parseInt(request.getParameter("cmt_num"));

        CommentLikeDAO dao = new CommentLikeDAO();
        CommentLikeDTO dto = new CommentLikeDTO();
        dto.setEmail(email);
        dto.setCmt_num(cmt_num);

        List<CommentLikeDTO> likes = dao.getCommentLike(email);
        boolean alreadyLiked = likes.stream().anyMatch(like -> like.getCmt_num() == cmt_num);

        int cnt;
        if (alreadyLiked) {
            cnt = dao.commentUnlike(email, cmt_num);
        } else {
            cnt = dao.commentLike(dto);
        }

        if (cnt > 0) {
            int likeCount = dao.commentLikeCount(cmt_num); // Implement this method to count likes
            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"success\",\"likeCount\":" + likeCount + ",\"userLiked\":" + !alreadyLiked + "}");
        } else {
            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"error\",\"message\":\"댓글 좋아요 실패\"}"); 
        }
    }
}
