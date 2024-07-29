<%@page import="dooriburn.com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/Asignupin.css">

</head>
<body>

	<!-- 로그인 -->

	<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	String error = (String) session.getAttribute("error");
	%>

	<script>
		function validateForm() {
			var email = document.getElementById("email").value;
			var password = document.getElementById("password").value;

			if (email == "") {
				alert("이메일 칸을 입력해 주세요.");
				return false;
			}

			if (password == "") {
				alert("비밀번호 칸을 입력해 주세요.");
				return false;
			}

			if (email == "" || password == "") {
				alert("모든 필드를 입력해 주세요.");
				return false;
			}
			return true;
		}
	</script>


	<!-- 회원가입 -->
	<script>
		function validateForm() {
			var email = document.getElementById("email").value;
			var password = document.getElementById("password").value;
			var nick = document.getElementById("nick").value;
			var name = document.getElementById("name").value;
			var phone = document.getElementById("phone").value;
			var addr = document.getElementById("addr").value;

			if (email == "" || password == "" || nick == "" || name == ""
					|| phone == "" || addr == "") {
				alert("모든 필드를 입력해 주세요.");
				return false;
			}
			return true;
		}
	</script>


	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form action="JoinService" method="post" name="JoinForm">
				<h1>Create Account</h1>

				<span>or use your email for registration</span> 
				
				<input type="email"
					name="email" class="form-control" placeholder="Email" /> <input
					type="password" class="form-control" placeholder="Password" />
				<button onclick="location.href='contact.jsp'">Sign Up</button>
				<%
				if (error != null) {
				%>
				<div class="form-container sign-up-container">
					<span><%=error%></span>
				</div>
				<%
				}
				%>

			</form>
		</div>
		<div class="form-container sign-in-container">
			<form action="Realindex.jsp" method="post"
				onsubmit="return validateForm()">
				<h1>Sign in</h1>

				<input type="email" name="email" class="form-control"
					placeholder="Email" /> <input type="password" class="form-control"
					placeholder="Password" />
					
					 <a href="#">Forgot your password?</a>
				<button onclick="location.href='contact.jsp'">Sign Up</button>
			</form>
		</div>

		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>To keep connected with us please login with your personal
						info</p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>여기가 거기여?</h1>
					<p>더 많은 정보를 이용하시려면 가입해 주세요!</p>
					<button class="ghost" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
	</div>

	<script src="js/Asignupin.js"></script>

</body>
</html>