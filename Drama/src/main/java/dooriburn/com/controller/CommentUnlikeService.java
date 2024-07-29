package dooriburn.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dooriburn.com.model.CommentLikeDAO; 
 
@WebServlet("/CommentLikeDelService")
public class CommentUnlikeService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		int num = Integer.parseInt(request.getParameter("cmt_num")); 
        
        CommentLikeDAO dao = new CommentLikeDAO();  
		int cnt = dao.commentUnlike(email, num);
		
		if (cnt > 0) {
			System.out.println("댓글 좋아요 취소 완료");
		} else {
			System.out.println("댓글 좋아요 취소 실패");
		}  
		    
	}

}
