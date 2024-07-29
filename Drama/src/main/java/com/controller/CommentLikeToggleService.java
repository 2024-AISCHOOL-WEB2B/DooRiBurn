package com.controller;

import java.io.IOException; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.model.CommentLikeDAO;
import com.model.CommentLikeDTO;
import org.json.JSONObject;

@WebServlet("/CommentLikeToggleService")
public class CommentLikeToggleService extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        // 이메일이 세션에 저장되어 있는지 확인하는 로그
        System.out.println("Session Email: " + email);

        if (email == null) {
            response.getWriter().write("{\"status\":\"error\",\"message\":\"로그인이 필요합니다.\"}");
            return;
        }

        int cmt_num = Integer.parseInt(request.getParameter("cmt_num"));
        String action = request.getParameter("action");

        CommentLikeDAO dao = new CommentLikeDAO();
        if ("toggle".equals(action)) {
            boolean alreadyLiked = dao.userLiked(email, cmt_num);
            int cnt;
            if (alreadyLiked) {
                cnt = dao.commentUnlike(email, cmt_num);
            } else {
                cnt = dao.commentLike(new CommentLikeDTO(email, cmt_num));
            }

            if (cnt > 0) {
                int likeCount = dao.commentLikeCount(cmt_num);
                response.getWriter().write("{\"status\":\"success\",\"likeCount\":" + likeCount + ",\"userLiked\":" + !alreadyLiked + "}");
            } else {
                response.getWriter().write("{\"status\":\"error\",\"message\":\"댓글 좋아요 처리에 실패했습니다.\"}");
            }
        } else {
            boolean userLiked = dao.userLiked(email, cmt_num);
            int likeCount = dao.commentLikeCount(cmt_num);
            JSONObject result = new JSONObject();
            result.put("userLiked", userLiked);
            result.put("likeCount", likeCount);
            response.getWriter().print(result);
        } 
    }
}
