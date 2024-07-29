<%@page import="com.model.MemberDTO"%>
<%@page import="com.model.ContestDAO"%>
<%@page import="com.model.ContestDTO"%> 
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>contestBoard</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="FreeHTML5.co" />
  
	
	<!-- realindex에서 가져온 것들 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" >
 	<!-- 폰트 -->
	<link href="https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
	
	<!-- Realstyle.css를 가장 먼저 연결 -->
	<link rel="stylesheet" href="css/Realstyle.css">
	
	<!-- 나머지 CSS 파일들 -->
	<link rel="stylesheet" href="css/other-style1.css">
	<link rel="stylesheet" href="css/other-style2.css">
	  
	<link href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700" rel="stylesheet"> 
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style2.css">
  
	<script src="js/modernizr-2.6.2.min.js"></script> 
	
	 <!-- 메뉴 위치 우상단으로 조정 -->
	<style>
	.menu-icon {
	    position: absolute;
	    top: 10px;  
	    right: 20px; 
	    cursor: pointer; 
	} 
	/* 버튼과 저작권 정보 사이에 여백 추가, 중간배열 */
	.button-container {
	    margin-bottom: 20px; 
		display: flex; 
		justify-content: center;
	}
	</style> 

	</head>  
	<body>
		<% 
		// 로그인 정보 가져오기  
		MemberDTO info = (MemberDTO) session.getAttribute("userInfo"); 

		// BoardDAO 객체 생성
		ContestDAO dao = new ContestDAO();
		
		// 게시판 DB에 있는 글 개수를 확인
		int cnt = dao.getCount();  
		//////////////////////////////////////////////////////////////////////////////////////////
		// 페이징 처리
		
		// 한 페이지에 출력될 글 수 
		int pageSize = 5;
		
		// 현 페이지 정보 설정
		int pageNum = 1;
		if (request.getParameter("pageNum") != null){
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} 
		
		// 첫행번호를 계산 
		int startRow = (pageNum - 1) * pageSize + 1; 
		
		// 게시글 목록 가져오기
        ArrayList<ContestDTO> list = dao.getBoardList(startRow, pageSize);
		%>  
 
		 
	<header>
		<div class="banner">여기가 거기여?</div>
		<div class="menu-icon" onclick="openNav()">☰</div>
	</header>
	<div class="fh5co-loader"></div> 
	<div id="page">
	<nav class="fh5co-nav" role="navigation">
	 
	<div id="mySidenav" class="sidenav" style="width: 0;">
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
				<a href="#">회원정보 수정</a> <a href="#">관심 촬영지</a> <a href="#">참여한
					공모전</a>
			</div>
		</div>
		<%} %>
	</div>
	</nav> 
	
	<header id="fh5co-header" class="fh5co-cover" style="height: 100px;"> 
		<div class="overlay"></div>
		<div class="container"></div>
	</header>
 
 
 	<div style="clear: both; text-align: center; margin-top: 20px;">
 		<h4 style="display: inline-block;">공모전 게시판</h4>
 	</div>
 	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th> 
						<th style="background-color: #eeeeee; text-align: center;">공모일</th>
					</tr>
				</thead>
				<tbody>
					<% for (ContestDTO dto : list) { %>
						<tr>
							<td><%= dto.getC_num() %></td>
							<td><a style="color:#000" href="contestView.jsp?c_num=<%= dto.getC_num() %>"><%= dto.getC_title() %></a></td>
							<td><%= dto.getC_create_date() %> ~ <%= dto.getC_delete_date() %></td>
					 	</tr>
					<% } %> 
				</tbody>
			</table>  
		</div>  
		<!-- 관리자만 글 작성 버튼 뜨게 만듦!!!! -->
		<% if (info != null && info.getEmail().equals("admin@gmail.com")) { %>
			<a href="contestPost.jsp" class="btn btn-primary pull-right">글 작성</a>
		<% } %>  
	</div>
	
	<!-- 페이징 처리 -->
	<div id="page_control">
		<% if(cnt != 0){  
				// 전체 페이지수 계산
				int pageCount = cnt / pageSize + (cnt%pageSize==0?0:1);
				
				// 한 페이지에 보여줄 페이지 블럭
				int pageBlock = 5;
				
				// 한 페이지에 보여줄 페이지 블럭 시작번호 계산
				int startPage = ((pageNum-1)/pageBlock)*pageBlock+1;
				
				// 한 페이지에 보여줄 페이지 블럭 끝 번호 계산
				int endPage = startPage + pageBlock-1;
				if(endPage > pageCount){
					endPage = pageCount;
				}
				if(startPage > pageBlock) { %>
					<a href="contestBoard.jsp?pageNum=<%=startPage - pageBlock%>">◀</a>
				<%} %>
			    
				<% for(int i=startPage ; i <= endPage ; i++) { %>
					<a href="contestBoard.jsp?pageNum=<%=i%>"><%=i %></a>
				<%} %>
			    
				<% if(endPage < pageCount){ %>
					<a href="contestBoard.jsp?pageNum=<%=startPage + pageBlock%>">▶</a>
				<%} %>
			<%} %>
	</div>


            
            
            

 

	
	
	
	
 	<footer id="fh5co-footer" role="contentinfo">
 		<!-- 버튼 -->
 			<div class="button-container">
			   	<div>    
					<%if(info == null) {%>
						<button class="btn" onclick="location.href='login.jsp'">로그인</button>
						<button class="btn" onclick="location.href='contact.jsp'">회원가입</button>
					<%}else{ %>
						<button class="btn" onclick="location.href='LogoutService'">로그아웃</button>
					<%} %>
						<button class="btn">한국어</button>
						<button class="btn">English</button>   
				</div>
			</div>				
		<div class="container">
			<div class="row copyright"> 
				<div class="col-md-12 text-center">
					<p>
						<small class="block">&copy; 2024 DOORIBURN. All Rights Reserved.</small> 
						<small class="block">Designed by DOORIBURN</small>
					</p>
 				</div>  
			</div>
		</div> 
	</footer>
 
	
	<!-- Side navigation script -->
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "80%";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://bootstrap.js"></script>
	 
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

	</body>
</html>
