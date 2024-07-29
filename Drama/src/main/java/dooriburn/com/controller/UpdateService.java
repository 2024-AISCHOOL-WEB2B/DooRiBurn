package dooriburn.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dooriburn.com.model.MemberDAO;
import dooriburn.com.model.MemberDTO;
 
@WebServlet("/UpdateService")
public class UpdateService extends HttpServlet {
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();		
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		request.setCharacterEncoding("UTF-8");
		String email = info.getEmail();
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		  
		MemberDTO dto = new MemberDTO(email, pw, nick, phone, addr);
		MemberDAO dao = new MemberDAO();
		
		int cnt = dao.update(dto);
		if (cnt > 0) { 
			session.setAttribute("info", dto); 
		} else { 
			
		} 
		response.sendRedirect("Realindex.jsp");
	}

	

}
