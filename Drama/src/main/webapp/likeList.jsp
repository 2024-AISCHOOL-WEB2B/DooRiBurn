<%@page import="dooriburn.com.model.DramaSearchDAO"%>
<%@page import="dooriburn.com.model.DramaSearchDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="dooriburn.com.model.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아요 누른 촬영지 목록</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/PracSearch.css">
<!-- 하이.. -->

<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f9;
}

h1 {
	text-align: center;
	color: #333;
	margin-top: 50px;
}

a {
	text-decoration: none;
	color: #333;
}

.box .image img {
	width: 150px;
	height: 150px;
	object-fit: cover;
	margin: 0;
	display: block;
	margin-left: 10px;
	border-radius: 7px;
}

.star-button {
	background: none;
	border: none;
	font-size: 24px;
	cursor: pointer;
	color: black;
	margin-bottom: 170px;
}

.star-button.liked {
	color: gold;
}

.star-button:focus {
	outline: none;
}

a {
	display: block;
	padding: 10px;
	background: #fff;
	border-radius: 5px;
	margin: 10px auto;
	width: 80%;
	max-width: 800px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	transition: background-color 0.3s, box-shadow 0.3s;
}

a:hover {
	background-color: #f4f4f9;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

h2 {
	text-align: center;
	font-weight: bold;
	color: #444;
}


@media (max-width: 768px) {
	a {
		width: 95%;
	}
	h2, h3 {
		font-size: 16px;
		margin-left: 60px;
	}
}
</style>

</head>
<body>

	<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	%>
	<header>
		<button class="banner" onclick="location.href='Realindex.jsp'">여기가
			거기여?</button>
		<div class="menu-icon" onclick="openNav()">☰</div>
	</header>

	<!-- 메뉴 -->
	<div id="mySidenav" class="sidenav" style="width: 0;">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()"
			style="color: #333333;">&times;</a>
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
				<a href="contestBoard.jsp">참여하기</a>
			</div>
		</div>
		<%
		if (info != null) {
		%>
		<div class="menu-section">
			<h2>마이 페이지</h2>
			<div class="menu-itemss">
				<a href="#">회원정보 수정</a> <a href="likeList.jsp">관심 촬영지</a> <a
					href="#">참여한 공모전</a>
			</div>
		</div>
		<%
		}
		%>
	</div>

	<!-- 즐겨찾기 목록 -->
	<%
	DramaSearchDAO dao = new DramaSearchDAO();
	if (info != null) {
		List<DramaSearchDTO> likes = dao.getLikes(info.getEmail());
		if (likes == null || likes.size() == 0) {
	%>
	<h1>좋아요 목록이 없습니다.</h1>
	<%
	} else {
	%>
	<!-- <h1>좋아요 누른 촬영지 목록</h1> ⭐ -->
	<br>
	<br>
	<%
	for (DramaSearchDTO like : likes) {
	%>
	
	<a
		style="color: #000; text-decoration: none; display: block; width: 100%;" href="detail.jsp?index=<%=like.getFNum()%>">
		<br>
		<h2 style="font-weight: bold; text-align: left; margin: 0; width: 100%;"> 📍 <%=like.getFName()%> </h2>
		<h3 style="margin-left: 30px;"><%=like.getDrama()%></h3>
	</a>
	<br> 
	

	<%
	}
	%>


	<%
	}
	%>
	<%
	}
	%>

	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "50%";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}

		function goToAddress(event, url) {
			event.stopPropagation();
			location.href = url;
		}
	</script>


</body>
</html>
