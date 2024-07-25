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
 
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

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
	</head> 
	
	<body>
		<% 
		// 로그인 정보 가져오기 
		MemberDTO info = (MemberDTO)session.getAttribute("info");

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
 
		 
	<div class="fh5co-loader"></div> 
	<div id="page">
	<nav class="fh5co-nav" role="navigation">
		<div class="container">
			<div class="row">
				<div class="left-menu text-right menu-1">
					<ul>
						<li><a href="contact.jsp">회원가입</a></li>
						<li><a href="about.html">로그인</a></li>
						<li class="has-dropdown">
							<a href="services.html">마이페이지</a>
							<ul class="dropdown">
								<li><a href="#">관심 촬영지</a></li>
								<li><a href="#">회원정보수정</a></li>
								<li><a href="#">참여한 공모전</a></li>
								<li><a href="#">API</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="logo text-center">
					<div id="fh5co-logo"><a href="index.jsp">여</a></div>
				</div>
				<div class="right-menu text-left menu-1">
					<ul>
						<li><a href="blog.html">공모전</a></li>
						<li class="has-dropdown">
							<a href="#">카테고리</a>
							<ul class="dropdown">
								<li><a href="#">HTML5</a></li>
								<li><a href="#">CSS3</a></li>
								<li><a href="#">Sass</a></li>
								<li><a href="#">jQuery</a></li>
							</ul>
						</li>
						<li><a href="contact.html">Contact</a></li> 
					</ul>
				</div>
			</div>
			
		</div>
	</nav>
	<header id="fh5co-header" class="fh5co-cover" role="banner" style="background-image:url(images/img_bg_2.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 text-center">
					<div class="display-t" >
						<div class="display-tc animate-box" data-animate-effect="fadeIn" > 
							<div class="row"> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
 
 
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
							<td><a stlyle="color:#ffd964" href="contestView.jsp?c_num=<%= dto.getC_num() %>"><%= dto.getC_title() %></a></td>
							<td><%= dto.getC_create_date() %> ~ <%= dto.getC_delete_date() %></td>
					 	</tr>
					<% } %> 
				</tbody>
			</table>  
		</div>
			<a href="contestPost.jsp" class="btn btn-primary pull-right">글 작성</a>
			
			<!-- 관리자만 글 작성 버튼 뜨게 만듦!!!! 위 글작성 a태그 제거 해야됨-->
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
				int pageBlock = 2;
				
				// 한 페이지에 보여줄 페이지 블럭 시작번호 계산
				int startPage = ((pageNum-1)/pageBlock)*pageBlock+1;
				
				// 한 페이지에 보여줄 페이지 블럭 끝 번호 계산
				int endPage = startPage + pageBlock-1;
				if(endPage > pageCount){
					endPage = pageCount;
				}
				if(startPage > pageBlock) { %>
					<a href="contestBoard.jsp?pageNum=<%=startPage - pageBlock%>">prev</a>
				<%} %>
			    
				<% for(int i=startPage ; i <= endPage ; i++) { %>
					<a href="contestBoard.jsp?pageNum=<%=i%>"><%=i %></a>
				<%} %>
			    
				<% if(endPage < pageCount){ %>
					<a href="contestBoard.jsp?pageNum=<%=startPage + pageBlock%>">next</a>
				<%} %>
			<%} %>
	</div>



            
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://bootstrap.js"></script>
 
   

 	<footer id="fh5co-footer" role="contentinfo">
		<div class="container">
				  
			<div class="row copyright">
				<div class="col-md-12 text-center">
					<p>
						<small class="block">&copy; 2024 DOORIBURN. All Rights Reserved.</small> 
						<small class="block">Designed by DOORIBURN</small>
					</p>
					<p>
						<ul class="fh5co-social-icons">  
							<li><a href="#"><i class="icon-sun"></i></a></li>
							<li><a href="#"><i class="icon-cloud"></i></a></li>
						</ul>
					</p>
				</div>
			</div>

		</div>
	</footer>
	
	</div>
	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
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
	<script src="js/main.js"></script>

	</body>
</html>
