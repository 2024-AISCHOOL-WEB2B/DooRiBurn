<%@page import="com.model.ContestDAO"%>
<%@page import="com.model.ContestDTO"%> 
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="css/style.css">
 
	<script src="js/modernizr-2.6.2.min.js"></script> 
	</head> 
	
	<body>
		<%
		// BoardDAO 객체 생성
		ContestDAO dao = new ContestDAO();
		// 게시판 DB에 있는 글 개수를 확인
		int cnt = dao.getCount(); 
		//////////////////////////////////////////////////////////////////////////////////////////
		// 페이징 처리
		
		// 한 페이지에 출력될 글 수 
		int pageSize = 3;
		
		// 현 페이지 정보 설정
		int pageNum = 1;
		if (request.getParameter("pageNum") != null){
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} 
		
		// 첫행번호를 계산
		int currentPage = pageNum;	
		int startRow = (currentPage-1)*pageSize + 1; 
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
								<form class="form-inline" id="fh5co-header-subscribe">
									<div class="col-md-6 col-md-offset-3">
										<div class="form-group">
											<input type="text" class="form-control" id="email" >
											<button type="submit" class="btn btn-default">검색</button>
										</div>
									</div>
								</form>
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
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
				
				<%-- 😎😎 수정 필수!!!!!!!!!!!!!!!!!!!!!!!!!! --%>
					<% 
						ContestDTO dto = new ContestDTO();
						ArrayList<ContestDTO> list = dao.getContests(dto); 
						for (int i = 0; i < list.size(); i++){
					%>
					<tr>  
						<td><%= list.get(i).getC_num() %></td> 
						<td><a href="contestBoard?C_num=<%=list.get(i).getC_num()%>"><%= list.get(i).getC_title() %></a></td> 
						<td><%= list.get(i).getC_date() %></td> 
					</tr> 
				 	<%
				 		}
				 	%>
<%-- 					<tr>  
						<td>c_num1</td> 
						<td>c_title'선재 업고 튀어' 사진 공모전</td> 
						<td>c_date2024-07-23</td>
						<td> <a href="contestBoard?C_num=<%=list.get(i).getC_num()%>"><%= list.get(i).getC_title() %></a></td>
					</tr>  
				 --%>
				</tbody>
			</table>
			<!-- 관리자만 글 작성할 수 있게 해야 함!!!!!! -->
			<a href="contestPost.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	  
	<div id="page_control">
		<%if(cnt != 0){ 
			////////////////////////////////////////////////////////////////
			// 페이징 처리
			// 전체 페이지수 계산
			int pageCount = cnt / pageSize + (cnt%pageSize==0?0:1);
			
			// 한 페이지에 보여줄 페이지 블럭
			int pageBlock = 10;
			
			// 한 페이지에 보여줄 페이지 블럭 시작번호 계산
			int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
			
			// 한 페이지에 보여줄 페이지 블럭 끝 번호 계산
			int endPage = startPage + pageBlock-1;
			if(endPage > pageCount){
				endPage = pageCount;
			}	
		%>
	    
		<% if(startPage>pageBlock){ %>
			<a href="notice.jsp?pageNum=<%=startPage-pageBlock%>">이전</a>
		<%} %>
	    
		<% for(int i=startPage;i<=endPage;i++){ %>
			<a href="notice.jsp?pageNum=<%=i%>"><%=i %></a>
		<%} %>
	    
		<% if(endPage<pageCount){ %>
			<a href="notice.jsp?pageNum=<%=startPage+pageBlock%>">다음</a>
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
						<small class="block">Designed by DOORIBURN</a></small>
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
