<%@page import="dooriburn.com.model.MemberDTO"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"> 
<title>update.jsp</title>
</head>
<body>
   <% 
      MemberDTO info = (MemberDTO)session.getAttribute("info");   
   %>
	<ul>
		<li><h5>회원정보수정</h5></li>
			<form action="UpdateService" method="post">
				<li>Email : <%= info.getEmail() %></li>
				<li><input type="password" name="pw" placeholder="비밀번호를 입력하세요" style="width: 500px; margin: 0 auto;"></li>
				<li><input type="text" name="nick" placeholder="닉네임을 입력하세요" style="width: 500px; margin: 0 auto;"></li>
				<li><input type="text" name="phone" placeholder="전화번호를 입력하세요" style="width: 500px; margin: 0 auto;"></li>
				<li><input type="text" name="addr" placeholder="집주소를 입력하세요" style="width: 500px; margin: 0 auto;"></li>
				<li><input type="submit" value="Update" class="button fit" style="width: 500px; margin: 0 auto;"></li>
			</form>
	</ul> 	
</body>
</html>