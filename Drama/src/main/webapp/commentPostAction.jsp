<%@page import="com.model.MemberDTO"%>
<%@page import="com.model.CommentDAO"%>
<%@page import="com.model.CommentDTO"%>
<%@page import="com.model.ContestDAO"%>
<%@page import="com.model.ContestDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>commentPostAction.jsp</title>
</head>
<body>


<!-- 댓글 작성 action  --> 
	<% 
     
	request.setCharacterEncoding("UTF-8");
	
	int maxFileSize = 1024 * 1024 * 1024;
	String path = request.getRealPath("commentImg");
	 
	MemberDTO info = (MemberDTO)session.getAttribute("info");
	
	
    try { 
		MultipartRequest multi = new MultipartRequest(request, path, maxFileSize, "UTF-8", new DefaultFileRenamePolicy());
 
	 
        String img = multi.getFilesystemName("commentImg");
        int c_num = Integer.parseInt(multi.getParameter("c_num"));
        String email = info.getEmail();

        CommentDTO dto = new CommentDTO(img, c_num, email);
        CommentDAO dao = new CommentDAO(); 
		
		int cnt = dao.commentPost(dto);
		 
	    if (cnt > 0) {  
	        response.sendRedirect("contestView.jsp?c_num=" + c_num); 
	    } else { 
	        out.println("<script>alert('댓글 작성 실패');</script>");
	        response.sendRedirect("contestView.jsp?c_num=" + c_num);   
	    }
    } catch (Exception e) {
        out.println("<script>alert('댓글 작성 중 오류 발생: " + e.getMessage() + "');</script>");
        out.flush();
        e.printStackTrace();
    }
    
    
	%>
</body>
</html>