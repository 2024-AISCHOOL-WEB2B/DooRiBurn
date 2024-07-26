<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>like</title>

<style>
.heart {
	font-size: 24px;
	cursor: pointer;
}

.heart-liked {
	color: red;
}

.heart-not-liked {
	color: gray;
}
</style>

</head>
<body>

	<%@ page
		import="java.sql.*, javax.servlet.*, javax.servlet.http.*, javax.servlet.jsp.*"%>
	<%
	// 세션에서 이메일 가져오기
	HttpSession session = request.getSession();
	String email = (String) session.getAttribute("email");

	boolean liked = false;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		// 데이터베이스 연결 (DB 연결 정보는 실제 정보를 사용하세요)
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourdbname", "username", "password");

		// 좋아요 테이블에서 이메일로 조회
		String sql = "SELECT * FROM likes WHERE email = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			liked = true;
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (rs != null)
		rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (pstmt != null)
		pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (conn != null)
		conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	%>

	<div>
		<%
		if (liked) {
		%>
		<span class="heart heart-liked" onclick="toggleLike()">♥</span>
		<%
		} else {
		%>
		<span class="heart heart-not-liked" onclick="toggleLike()">♡</span>
		<%
		}
		%>
	</div>

	<script>
		function toggleLike() {
			// 좋아요 상태를 서버에 요청하는 AJAX 코드
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "toggleLike", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					location.reload(); // 상태 변경 후 페이지 새로고침
				}
			};
			xhr.send();
		}
	</script>


</body>
</html>