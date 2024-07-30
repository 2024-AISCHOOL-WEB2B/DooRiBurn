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

@WebServlet("/KakaoLoginService")
public class KakaoLoginService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public KakaoLoginService() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        String nick = request.getParameter("nickname");
        String email = request.getParameter("id");
        String pw = email;
        
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession(); 
		
		int check_cnt = dao.checkEmail(email);
		
		if(check_cnt==0) {
			MemberDTO dto = new MemberDTO(email, pw);
			MemberDTO info = dao.login(dto);
			String recentURI = request.getParameter("from");
			
	        request.getRequestDispatcher("Realindex.jsp").forward(request, response);
	        
	        if (info != null) {
				if (email.equals(info.getEmail()) && pw.equals(info.getPw())) {
					session.setAttribute("info", info); 
					System.out.println(info.getEmail()+info.getNick());
				} else { 
					if (recentURI != null) {
						response.sendRedirect("login.jsp?from="+recentURI);
					} else {
						response.sendRedirect("login.jsp"); 
					} 
				}
			}
	        
		}else {
			
			
			
			String name = nick;
			String phone = "kakao";
			String addr = "kakao";
			
			
			MemberDTO dto = new MemberDTO(email, pw, nick, name, phone, addr);

			
			String recentURI = request.getParameter("from");
			
			int cnt = dao.join(dto);
			
			if(cnt > 0) { 
				if (recentURI != null) {
					response.sendRedirect(recentURI); 
				} else {
					response.sendRedirect("login.jsp"); 
				} 
			} else {
				// 회원가입 실패
				if (recentURI != null) {
					response.sendRedirect("join.jsp?from="+recentURI);
				} else {
					response.sendRedirect("join.jsp"); 
				} 
			}
		}

        

//        ---------------------------------------------------------------
		
        
        
        
        
        
        
        
    }
}
