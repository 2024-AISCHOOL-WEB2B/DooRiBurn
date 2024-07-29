package dooriburn.com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dooriburn.com.model.CommentLikeDAO;
import dooriburn.com.model.CommentLikeDTO;
 
@WebServlet("/CommentLikeResult")
public class CommentLikeResult extends HttpServlet {
	
    private CommentLikeDAO dao;
 
    public void init() throws ServletException {
    	// init -> 서블릿 초기화 기능! 필수x  
        super.init();
        dao = new CommentLikeDAO();
    }
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String email = request.getParameter("email");
		int cmt_num = Integer.parseInt(request.getParameter("cmt_num"));
		
		boolean userLiked = dao.userLiked(email, cmt_num); 
		
		if (userLiked) {
			dao.commentUnlike(email, cmt_num);
		} else {
		    CommentLikeDTO dto = new CommentLikeDTO();
		    dto.setEmail(email);
		    dto.setCmt_num(cmt_num);
		    dao.commentLike(dto);
		}
		
		// 업데이트된 좋아요 수 조회
		int likeCount = dao.commentLikeCount(cmt_num);
	
		response.setContentType("application/json");  
		PrintWriter out = response.getWriter();
		out.print("{ \"likeCount\": " + likeCount + ", \"userLiked\": " + !userLiked + " }");
		out.flush();
		
	}

}
