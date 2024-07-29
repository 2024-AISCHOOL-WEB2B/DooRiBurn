package dooriburn.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dooriburn.com.model.CommentDAO;
import dooriburn.com.model.CommentLikeDAO;
import dooriburn.com.model.CommentLikeDTO;
import dooriburn.com.model.MemberDTO;
 
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

        int cnt = dao.commentLike(dto);
        if (cnt > 0) {
            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"success\",\"message\":\"댓글 좋아요 성공\"}");
        } else {
            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"error\",\"message\":\"댓글 좋아요 실패\"}"); 
        }

    }
}
