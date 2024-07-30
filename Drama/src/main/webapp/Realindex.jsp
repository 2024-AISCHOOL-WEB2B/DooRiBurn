<%@page import="dooriburn.com.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dooriburn.com.model.RankingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Realindex</title>

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
<style type="text/css"></style>
<style>
.menu-icon {
	position: absolute;
	top: 10px;
	right: 20px;
	cursor: pointer;
	color: #545454;
}
.sidenav .menu-items a:hover {
    font-weight: bold !important;
}
footer {
    margin-bottom: 50px;
}
 
footer div {
    display: block !important;
    width: 100%;
    text-align: center;
    margin-bottom: 10px; 
} 
@media (max-width: 600px) {
    footer div {
        margin-bottom: 100px !important;  
    }
}

</style>
</head>
<body>

	<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	ArrayList<String> ranking = new RankingDAO().Ranking();
	String exUrl = "PracSearch2.jsp?s_option=1&search=";
	%>
	<header>
		<div class="banner" onclick="redirectToPage()">여기가 거기여?</div>
		<div class="menu-icon" onclick="openNav()">☰</div>
	</header>

	<div id="mySidenav" class="sidenav" style="width: 0;">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()"
			style="color: #545454;">&times;</a>
		<div class="menu-section">
			<h2>지역별로 찾기</h2>
			<div class="menu-items">
				<a href="<%=exUrl%>서울">서울</a> <a href="<%=exUrl%>부산">부산</a> <a
					href="<%=exUrl%>인천">인천</a> <a href="<%=exUrl%>대구">대구</a> <a
					href="<%=exUrl%>대전">대전</a> <a href="<%=exUrl%>광주">광주</a> <a
					href="<%=exUrl%>울산">울산</a> <a href="<%=exUrl%>세종">세종</a> <a
					href="<%=exUrl%>경기">경기</a> <a href="<%=exUrl%>충청북도">충북</a> <a
					href="<%=exUrl%>충청남도">충남</a> <a href="<%=exUrl%>전라북도">전북</a> <a
					href="<%=exUrl%>전라남도">전남</a> <a href="<%=exUrl%>경상북도">경북</a> <a
					href="<%=exUrl%>경상남도">경남</a> <a href="<%=exUrl%>강원">강원</a> <a
					href="<%=exUrl%>제주">제주</a> <a href="#"> </a>
			</div>
		</div>
		<div class="menu-section">
			<h2>여행사진 공모전</h2>
			<div class="menu-items">
				<a href="contestBoard.jsp">참가하기</a>
			</div>
		</div>
			<%if(info != null){ %>
			<div class="menu-section">
				<h2>마이 페이지</h2>
				<div class="menu-itemss">
					<a href="update.jsp">회원정보 수정</a> 
					<a href="likeList.jsp">관심 촬영지</a> 
					<a href="contestList.jsp">공모전 참가내역</a> 
				</div>
			<%} else { %>
				<div class="menu-section">
					<h2>마이 페이지</h2>
					<div class="menu-itemss">
						<a href="login.jsp">로그인</a> 
						<a href="join.jsp">회원가입</a>  
					</div>
				</div>
			<%}%> 
		</div>
	</div>

	<div class="main-content">
		<form action="PracSearch2.jsp" method="get">
			<div class="search-container" style="height: 30px;">
				<select name="s_option" style="margin-right: 7px;">
					<!-- name="category" -> s_option -->
					<option value="1">장소/지역</option>
					<option value="0">드라마</option>
				</select> <input name="search" type="text" placeholder="검색"
					style="flex-grow: 1; margin-right: 5px; font-size: 13px;">
				<button type="submit">
					<img src="images/search.png" style="width: 40px; height: 40px;" />
				</button>
			</div>
		</form>

		<div class="ranking">
			<div class="rank-item">
				<div class="rank-num">1</div>
				<div class="rank-text"><%=ranking.get(0)%></div>
			</div>
			<div class="rank-item">
				<div class="rank-num">2</div>
				<div class="rank-text"><%=ranking.get(1)%></div>
			</div>
			<div class="rank-item">
				<div class="rank-num">3</div>
				<div class="rank-text"><%=ranking.get(2)%></div>
			</div>
			<div class="rank-item">
				<div class="rank-num">4</div>
				<div class="rank-text"><%=ranking.get(3)%></div>
			</div>
			<div class="rank-item">
				<div class="rank-num">5</div>
				<div class="rank-text"><%=ranking.get(4)%></div>
			</div>
		</div>

		<!-- 후보 1. 오징어 게임
			<div class="intro">
			<h2 class="highlight">오징어 게임의 그 장소!</h2>
			<h2 class="highlight">나도 가 볼까?</h2>

			<div class="image-container">
				<a href="detail.jsp?index=5038"><img src="images/hanriver.png"
					alt="한강공원여의도지구"></a> <a href="detail.jsp?index=5043"><img
					src="images/jeonju_hanok_village.jpg" alt="선갑도"></a> <a
					href="detail.jsp?index=5035"><img src="detail.jsp?index=5035"
					alt="양재시민의숲역"></a>
			</div>
		</div> 
		후보 2. 그 해 우리는-->

		<div class="intro">
			<h2 class="highlight">그 해 우리는 그 장소!</h2>
			<h2 class="highlight">나도 가 볼까?</h2>

			<div class="image-container">
				<a href="detail.jsp?index=712"><img src="images/lotteworld.png"
					alt="롯데월드"></a> <a href="detail.jsp?index=698"><img
					src="images/musiclib.png" alt="의정부음악도서관"></a> <a
					href="detail.jsp?index=714"><img src="images/sbridge.png"
					alt="양재시민의숲역"></a>
			</div>
		</div>
	</div>
	
	<footer>
			<div style="display: block !important; width: 100%; text-align: center; margin-bottom: 10px;">    
				<%if(info == null) {%>
					<button class="btn" onclick="location.href='login.jsp'">로그인</button>
					<button class="btn" onclick="location.href='join.jsp'">회원가입</button>
				<%} else { %>
					<button class="btn" onclick="location.href='LogoutService'">로그아웃</button>
				<%} %>
					<button class="btn">한국어</button>
					<button class="btn">English</button>   
			</div>     
	 </footer>  
	<!-- Side navigation script -->
	<script> 
	    function redirectToPage() {
	        window.location.href = 'Realindex.jsp';
	    }
		function openNav() {
			document.getElementById("mySidenav").style.width = "80%";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>
	
	<!-- JavaScript 파일 연결 -->
	<!-- 여기서는 없어도 되긴 함 detail에서 먼저 js 만들고 여기도 연결해 봄 -->
	<!-- <script src="js/menu.js"></script> -->
	

</body>
</html>
