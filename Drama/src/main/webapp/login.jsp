<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>login.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="FreeHTML5.co" />


	<link href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	
	
	
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="css/styles.css">
	
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/Realstyle.css">
	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
	
	<%
			String error = (String)session.getAttribute("error");
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
		
	<header>
		<div class="banner">여기가 거기여?</div>
		<div class="menu-icon" onclick="openNav()">☰</div>
	</header>

	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div class="menu-section">
			<h2>지역별로 찾기</h2>
			<div class="menu-items">
				<a href="#">서울</a> <a href="#">부산</a> <a href="#">인천</a> <a href="#">대구</a>
				<a href="#">대전</a> <a href="#">광주</a> <a href="#">울산</a> <a href="#">세종</a>
				<a href="#">경기</a> <a href="#">충북</a> <a href="#">충남</a> <a href="#">전북</a>
				<a href="#">전남</a> <a href="#">경북</a> <a href="#">경남</a> <a href="#">강원</a>
				<a href="#">제주</a> <a href="#">-</a>
			</div>
		</div>
		<div class="menu-section">
			<h2>공모전</h2>
			<div class="menu-items">
				<a href="#">참여하기</a>
			</div>
		</div>
	</div>

	<div id="fh5co-contact" style="align-content: center;">
		<div class="container">
			<div class="row">

				<div class="col-md-6 animate-box" align="center" onsubmit="return validateForm()">
					<h2 align="left">Login</h3>
					<form action="LoginService" method="post" name="JoinForm">
						<div class="row form-group">
							<div class="col-md-6" >
								<input type="email" name="email" id="email" class="form-control" placeholder="Email">
							</div>		
						</div>
						<div class="row form-group">
							<div class="col-md-6">
								<input type="password" name="pw" id="password" class="form-control" placeholder="비밀번호">
							</div>
						</div>
						<div class="row form-group">
							<a href="contact.jsp" style="color: green;">회원가입</a>
						</div>
						<% if(error != null){ %>
						<div class="row form-group">
							<span><%= error %></span>
						</div>
						<% }%>
						<div class="row form-group">
							<input type="submit" id="submit" value="로그인">
						</div>
					</form>		
				</div>
			</div>
			
		</div>
	</div>

	






	<footer>
			
			<button class="btn" onclick="location.href='login.jsp'">로그인</button>
			<button class="btn" onclick="location.href='contact.jsp'">회원가입</button>
			<button class="btn">한국어</button>
			<button class="btn">English</button>
			<br>
		</footer>


	</div>


	

	
	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Main -->
	<!-- Google Map -->

	<script src="js/main.js"></script>
	
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

