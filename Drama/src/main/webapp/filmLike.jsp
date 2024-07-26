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
	// ���ǿ��� �̸��� ��������
	HttpSession session = request.getSession();
	String email = (String) session.getAttribute("email");

	boolean liked = false;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		// �����ͺ��̽� ���� (DB ���� ������ ���� ������ ����ϼ���)
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourdbname", "username", "password");

		// ���ƿ� ���̺��� �̸��Ϸ� ��ȸ
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
		<span class="heart heart-liked" onclick="toggleLike()">��</span>
		<%
		} else {
		%>
		<span class="heart heart-not-liked" onclick="toggleLike()">��</span>
		<%
		}
		%>
	</div>

	<script>
		function toggleLike() {
			// ���ƿ� ���¸� ������ ��û�ϴ� AJAX �ڵ�
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "toggleLike", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					location.reload(); // ���� ���� �� ������ ���ΰ�ħ
				}
			};
			xhr.send();
		}
	</script>


</body>
</html>