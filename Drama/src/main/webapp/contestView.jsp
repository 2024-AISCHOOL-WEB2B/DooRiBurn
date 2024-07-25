<%@page import="com.model.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.CommentDTO"%>
<%@page import="com.model.CommentDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.model.ContestDTO"%>
<%@page import="com.model.MemberDTO"%>
<%@page import="com.model.ContestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>contestView</title>
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

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	</head>
	<body>
		
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
						<!-- <li class="btn-cta"><a href="#"><span>Login</span></a></li> -->
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
 
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
   
		<%
			// 글 번호 가져오기
			int num = 0;
			if (request.getParameter("c_num") != null){
				num = Integer.parseInt(request.getParameter("c_num"));
			}
			if (num == 0) {
				PrintWriter script = response.getWriter();
		        script.println("<script>");
		        script.println("alert('유효하지 않는 글입니다.');"); // 경고창 메시지 오류 수정
		        script.println("location.href = 'contestBoard.jsp';");
		        script.println("</script>");
			}
			ContestDTO dto = new ContestDAO().getView(num);
			
			
			MemberDTO info = (MemberDTO)session.getAttribute("info"); 			
			MemberDAO memDAO = new MemberDAO();
			
			// 댓글 작성
		    CommentDAO comDao = new CommentDAO();
		    ArrayList<CommentDTO> commentList = comDao.getComment(num);
		    
		%>
  
	<!-- 공모전 게시글 작성 ┗|｀O′|┛ -->
	<div class="container">
		<div class="row"> 
	        <table class="table table-striped" style="text-align: center; border:1px solid #f9f9f9">
	            <thead>
	                <tr>
	                    <th colspan="4" style="background-color: #f9f9f9; text-align: center;">공모전 게시글</th>
	                </tr>
	            </thead>
	            <tbody style="background-color: #f9f9f9;">
	                <tr>
	                    <td style="width: 20%;">글 제목</td>
	                    <td colspan="3"><%= dto.getC_title() %></td>
	                </tr>
	                <tr>
	                    <td>공모일</td>
	                    <td colspan="3"><%= dto.getC_create_date() %> ~ <%= dto.getC_delete_date() %></td>
	                </tr>
	                <tr>
	                   <%--  <td colspan="4" ><%= dto.getC_img() %></td> --%>
	                   <td><img src="boarding/<%= dto.getC_img() %>" alt="공모전 이미지"></td>
	                </tr> 


	                <tr>
	                    <td colspan="4" ><%= dto.getC_content() %></td>
	                </tr>
	            </tbody>
			</table> 
		</div>
		
		<div>
		<!-- 목록 / 작성 / 삭제 -->
		    <a href="contestBoard.jsp" class="btn btn-primary pull-left" style="margin-left: 10px; padding: 10px 20px;">목록</a>
        	<a href="javascript:;" onclick="confirmDelete(<%= dto.getC_num() %>)" class="btn btn-primary pull-right" style="margin-right: 10px; padding: 10px 20px;">삭제</a>
			<a href="contestUpdate.jsp?c_num=<%= dto.getC_num() %>" class="btn btn-primary pull-right" style="margin-right: 10px; padding: 10px 20px;">수정</a>
	        <!-- 관리자만 글 작성 버튼 뜨게 만듦!!!! 위 삭제/수정 a태그 제거 해야됨-->
	        <% if (info != null && info.getEmail().equals("admin@gmail.com")) { %>
	        	<a href="javascript:;" onclick="confirmDelete(<%= dto.getC_num() %>)" class="btn btn-primary pull-right" style="margin-right: 10px; padding: 10px 20px;">삭제</a>
				<a href="contestUpdate.jsp?c_num=<%= dto.getC_num() %>" class="btn btn-primary pull-right" style="margin-right: 10px; padding: 10px 20px;">수정</a>
			<% } %>
		</div>
		
		
		
		
		<!-- 해당 게시글에 작성된 댓글 리스트 가져오기!!!! ┗|｀O′|┛  수정 중~~~~~~~-->
		<div class="container">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<% for (CommentDTO comDto : commentList) { %>
					    <%
					        // 이메일을 통해 MemberDTO의 nick을 가져오기 위한 예시 코드
					        String comEmail = comDto.getEmail(); // CommentDTO에서 가져온 email 값
					
					        // MemberDAO를 사용하여 MemberDTO 가져오기
					        MemberDTO memDto = memDAO.getMemberByEmail(comEmail);
					
					        // MemberDTO에서 nick 값 가져오기
					        String comNick = memDto != null ? memDto.getNick() : "";
					
					        // 가져온 nick 값 출력
					        out.println("작성자: " + comNick);
					    %>
						<tr> 
							<td colspan="5" style="margin-left: 10px;"><%= comDto.getCmt_img() %></td>
	                    </tr>
	                    <tr>
							<td colspan="2" style="margin-left: 10px;" ><%= comNick %> %>
							<td colspan="3" style="text-align: left; margin-right: 10px;">♥ 아이콘 + 좋아요 수</td>
							CommentLikeDTO comLikeDto = new CommentLikeDTO(); 
							comDto.getCmt_num(); <!-- 코멘트 번호 -->
							
							comLikeDto.getCmt_like(); 
							
	                    </tr>
	                    <tr>	                    	
							<td colspan="5" style="text-align: left; margin-right: 10px; "><%= comDto.getCmt_date() %></td> 
	                    </tr> 
					<% } %>  
				</table>
			</div>
		</div>
		
		
		
		<!-- 댓글 작성란 ┗|｀O′|┛ --> <!-- 수정중!!!!!!!!!!!!!!!!!!! -->
		<div class="container">
			<div class="form-group">
				<header>
					<h4>공모전 응모를 위한 사진을 댓글로 올려주세요.</h4>
				</header>
				<% CommentDTO commentDto = new CommentDTO();  %>
				<form method="post" encType = "multipart/form-data" action="commentPostAction.jsp?cmt_num=<%= commentDto.getCmt_num() %>&c_num=<%= commentDto.getC_num()%>">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
 						<tr>
							<td colspan="2" style="border-bottom:none; text-align: left;" valign="middle">
								<%if (info == null){%>
									<p>로그인 필요</p>
								<% } else { %>
									<%= info.getNick() %>
								<%}%></td>
						</tr>
						<tr>
							<td>   
								<ul class="fh5co-social-icons">
									<% if (info != null) { %>
									        <li>
									            <label for="file">
									                <div class="btn btn-file">
									                    <i class="icon-camera"></i> 공모전 사진 선택
									                </div>
									            </label>
									            <input type="file" name="commentImg" id="file" style="display: none;">
									        </li>
									<% } else { %>
									    <li>
									        <p><a href="login.jsp" >로그인 후 공모전에 응모할 수 있습니다.</a></p>
									    </li>
									<% } %>
								</ul> 
							</td>							
						</tr> 
						<tr> 
							<td><br><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
						</tr> 
					</table>
				</form>
			</div>
		</div> 
		 

	
	 
		<!-- 해당 글 삭제시 JavaScript Confirm 창 구현 -->
	<script>
		function confirmDelete(num) {
			var result = confirm("정말로 삭제하시겠습니까?");
			if (result) {
	            location.href = "ContestDeleteService?c_num=" + num; 
	            // alert("삭제 완료되었습니다.");
			}
		}
	</script>
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
