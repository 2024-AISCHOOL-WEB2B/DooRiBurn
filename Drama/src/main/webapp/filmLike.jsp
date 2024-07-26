
<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<!-- 추가된 부분 -->

<%@page import="com.model.MemberDTO"%>

<!-- 7/26 오전 11:23 추가 -->
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*"%>
<%@ page import="java.util.*"%>
<%
String email = (String) session.getAttribute("email"); // 세션에서 이메일 값 가져오기
int filmNum = Integer.parseInt(request.getParameter("filmNum")); // 영화 번호 가져오기

boolean isLiked = false;

try {
	Context initContext = new InitialContext();
	Context envContext = (Context) initContext.lookup("java:/comp/env");
	DataSource ds = (DataSource) envContext.lookup("jdbc/YourDB");
	Connection conn = ds.getConnection();

	String query = "SELECT * FROM TB_FILM_LIKE WHERE EMAIL = ? AND F_NUM = ?";
	PreparedStatement pstmt = conn.prepareStatement(query);
	pstmt.setString(1, email);
	pstmt.setInt(2, filmNum);
	ResultSet rs = pstmt.executeQuery();

	if (rs.next()) {
		isLiked = true;
	}

	rs.close();
	pstmt.close();
	conn.close();
} catch (Exception e) {
	e.printStackTrace();
}
%>



<!DOCTYPE HTML>
<html lang="ko">
<head>
    <title>filmLike</title>
    
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
	
<!-- style css -->
<link rel="stylesheet" href="css/PracSearch.css">

</head>
<body>
    <div>
        <form action="ToggleLikeServlet" method="post">
            <input type="hidden" name="filmNum" value="<%= filmNum %>">
            <%
                if (isLiked) {
            %>
                <button type="submit" style="display: none;" id="likeButton">Like</button>
                <button type="submit" style="background-color: red;" id="unlikeButton">Unlike</button>
            <%
                } else {
            %>
                <button type="submit" id="likeButton">Like</button>
                <button type="submit" style="display: none;" id="unlikeButton">Unlike</button>
            <%
                }
            %>
        </form>
    </div>


	<!-- Side navigation script -->
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "50%";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>
</body>


</html>

