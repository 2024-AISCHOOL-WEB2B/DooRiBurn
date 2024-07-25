<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

<!-- CSS 파일 연결 -->
<link rel="stylesheet" href="css/Realstyle.css">
</head>
<body>
	
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
	%>
	
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
		<%if(info != null){ %>
		<div class="menu-section">
			<h2>마이 페이지</h2>
			<div class="menu-itemss">
				<a href="#">회원정보 수정</a> 
				<a href="#">관심 촬영지</a> 
				<a href="#">참여한 공모전</a>
			</div>
		</div>
		<%} %>
	</div>

	<div class="main-content">
		<div class="search-container" style="height: 30px;">
			<select name="category" style="margin-right: 7px;">
				<option value="location">장소 및 지역</option>
				<option value="drama">드라마</option>
			</select> <input name="search" type="text" placeholder="검색"
				style="flex-grow: 1; margin-right: 5px;">
			<button type="button">
				<img src="images/search.png" style="width: 40px; height: 40px;" />
			</button>
		</div>

		<div class="ranking">
			<div class="rank-item">
				<div class="rank-num">1</div>
				<div class="rank-text">선재 업고 튀어</div>
			</div>
			<div class="rank-item">
				<div class="rank-num">2</div>
				<div class="rank-text">광주</div>
			</div>
			<div class="rank-item">
				<div class="rank-num">3</div>
				<div class="rank-text">눈물의 여왕</div>
			</div>
			<div class="rank-item">
				<div class="rank-num">4</div>
				<div class="rank-text">제주도</div>
			</div>
			<div class="rank-item">
				<div class="rank-num">5</div>
				<div class="rank-text">전주</div>
			</div>
		</div>

		<div class="intro" style="height: 230px">
			<h2 class="highlight">선재 업고 튀어에 나온 그 장소!</h2>
			<h2 class="highlight">나도 가 볼까?</h2>

			<div class="image-container">
				<a href="detail.jsp"><img src="images/jeju_aquarium.png" alt="Aquarium"></a> 
				<a href="page2.html"><img src="images/jeonju_hanok_village.jpg" alt="Forest Path"></a> 
				<a href="page3.html"><img src="images/seoulforest.jpeg" alt="Traditional Village"></a>
			</div>
		</div>

		<footer>
			<%if(info == null) {%>
			<button class="btn" onclick="location.href='login.jsp'">로그인</button>
			<button class="btn" onclick="location.href='contact.jsp'">회원가입</button>
			<%}else{ %>
			<button class="btn" onclick="location.href='LogoutService'">로그아웃</button>
			<%} %>
			<button class="btn">한국어</button>
			<button class="btn">English</button>
			<br>
		</footer>
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
