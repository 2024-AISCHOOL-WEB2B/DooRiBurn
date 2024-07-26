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
	<style>
	/* 메뉴 위치 우상단으로 조정 */
	.menu-icon {
	    position: absolute;
	    top: 10px;  
	    right: 20px; 
	    cursor: pointer; 
	}
 
	/* 사진 업로드 style*/
	#uploadLabel .btn-file {
	    background-color: #FFEEB9 !important;  
	    border-color: #FFEEB9 !important;  
	    color: #000 !important;
		border: 1px solid; 
        border-radius: 25px; 
        box-shadow: none;
        padding: 8px 15px; 
	} 
	/* 댓글 작성 style*/
     #uploadInput {
        background-color: #FFEEB9 !important;
        border-color: #FFEEB9 !important; 
        color: #000 !important; 
        border: 1px solid; 
        border-radius: 25px; 
        box-shadow: none;
        padding: 8px 15px; 
	</style>  
	
	</head> 
	<body>
		<%  
			MemberDTO info = (MemberDTO)session.getAttribute("info"); 
		 
		int num = 0;
		try {
		    if (request.getParameter("c_num") != null){
		        num = Integer.parseInt(request.getParameter("c_num"));
		    }
		} catch (NumberFormatException e) {
		    // 숫자로 변환할 수 없는 경우 처리
		    PrintWriter script = response.getWriter();
		    script.println("<script>");
		    script.println("alert('유효하지 않은 글 번호입니다.');");
		    script.println("location.href = 'contestBoard.jsp';");
		    script.println("</script>");
		    return;  
		}

		if (num == 0) {
		    // 유효하지 않은 글 번호 처리
		    PrintWriter script = response.getWriter();
		    script.println("<script>");
		    script.println("alert('유효하지 않은 글입니다.');");
		    script.println("location.href = 'contestBoard.jsp';");
		    script.println("</script>");
		    return;  
		}
			ContestDTO dto = new ContestDAO().getView(num);
			 		
			MemberDAO memDAO = new MemberDAO();
			  
			// 댓글 작성
		    CommentDAO comDao = new CommentDAO();
		    ArrayList<CommentDTO> commentList = comDao.getComment(num); 
		
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
		<div class="container">  
		</div>
	</header>
	
    

  
	<!-- 공모전 게시글 ┗|｀O′|┛ -->
	<div class="container">
		<div class="row"> 
	        <table class="table table-striped" style="text-align: center; border:1px solid #f9f9f9">
	            <thead style="background-color: #f9f9f9;">
	                <tr>
	                    <th colspan="4" style="text-align: center; color: black;">공모전 게시글</th>
	                </tr>
	            </thead>
	            <tbody style="background-color: #f9f9f9;">
	                <tr>
	                    <td style="width: 20%; color: black;">제목</td>
	                    <td colspan="3"><%= dto.getC_title() %></td>
	                </tr>
	                <tr>
	                    <td style="color: black;">공모일</td>
	                    <td colspan="3"><%= dto.getC_create_date() %> ~ <%= dto.getC_delete_date() %></td>
	                </tr>
	                <tr> 
	                   <td colspan="4"><img src="boardImg/<%= dto.getC_img() %>" alt="공모전 이미지" style="max-width: 100%; height: auto;"></td>
	                </tr> 
	                <tr>
	                    <td colspan="4" ><%= dto.getC_content() %></td>
	                </tr>
	            </tbody>
			</table> 
		</div>
		
		<div>
<%-- 목록 / 작성 / 삭제 --%>
		    <a href="contestBoard.jsp" class="btn btn-primary pull-left" style="margin-left: 10px; padding: 10px 20px;">목록</a>
        	<a href="javascript:;" onclick="confirmDelete(<%= dto.getC_num() %>)" class="btn btn-primary pull-right" style="margin-right: 10px; padding: 10px 20px;">삭제</a>
			<a href="contestUpdate.jsp?c_num=<%= dto.getC_num() %>" class="btn btn-primary pull-right" style="margin-right: 10px; padding: 10px 20px;">수정</a>
<%--👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳 관리자만 글 작성 버튼 뜨게 만듦!!!! 위 삭제/수정 a태그 제거 해야됨--%>
	        <% if (info != null && info.getEmail().equals("admin@gmail.com")) { %>
	        	<a href="javascript:;" onclick="confirmDelete(<%= dto.getC_num() %>)" class="btn btn-primary pull-right" style="margin-right: 10px; padding: 10px 20px;">삭제</a>
				<a href="contestUpdate.jsp?c_num=<%= dto.getC_num() %>" class="btn btn-primary pull-right" style="margin-right: 10px; padding: 10px 20px;">수정</a>
			<% } %>
		</div>
		<br>
		<br>
		<div style="clear: both; text-align: center; margin-top: 20px;">
		    <header style="background-color: white;">
		        <h4 style="display: inline-block;  padding: 10px;">공모전 응모를 위해 댓글에 사진을 첨부해주세요.</h4>
		    </header>
		</div> 
		<!-- 해당 게시글에 작성된 댓글 리스트 가져오기!!!! ┗|｀O′|┛  수정 중~~~~~~~-->
		<div class="container">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<% for (CommentDTO comDto : commentList) { %>
					    <%
					        // 이메일로  MemberDTO의 nick 가져오기
					        String comEmail = comDto.getEmail();  
					        MemberDTO memDto = memDAO.getMemberByEmail(comEmail); 
					        String comNick = (memDto != null) ? memDto.getNick() : "Unknown";
					  
					    %>
					    <tr>
					    	<td style="text-align: left; margin-left: 10px;"><%= comNick %></td>
					    </tr>
						<tr> 
							<td><img src="commentImg/<%= comDto.getCmt_img() %>" alt="공모전 이미지" style="margin-left: 10px; max-width: 100%; height: auto;"></td>
	                    </tr>
	                    <tr>
	                    
	<%-- 좋아요 테이블 필요 --%>
							<td style="text-align: left; margin-left: 10px;">♥ 아이콘 + 좋아요 수</td>
					 
	                    </tr>
	                    <tr>	                    	
							<td style="text-align: left; margin-right: 10px; "><%= comDto.getCmt_date() %></td> 
	                    </tr>
	                     <tr>
	                    <% if (info != null && info.getEmail().equals(comEmail)) {%>
	                    	<td><a href="javascript:;" onclick="confirmCommentDelete(<%= comDto.getCmt_num() %>)" class="btn btn-primary pull-right" style="margin-right: 10px; padding: 10px 20px;">삭제</a></td>
						<%} %>
	                    </tr> 
<%-- 아래는 지워야함 test용 --%>
						<tr>
	                    	<td><a href="javascript:;" onclick="confirmCommentDelete(<%= comDto.getCmt_num() %>)" class="btn btn-primary pull-right" style="margin-right: 10px; padding: 10px 20px;">삭제</a></td>
						</tr>  
<%-- 댓글 작성자만 자율 수 있게 해야 함!!!!  수정하기 아래가 찐 코드
 	                    <% if (info != null && info.getEmail().equals(comEmail)) {%>
						<tr>
	                    	<td><a href="javascript:;" onclick="confirmCommentDelete(<%= comDto.getCmt_num() %>)" class="btn btn-primary pull-right" style="margin-right: 10px; padding: 10px 20px;">삭제</a></td>
						</tr>
						<% } %>  --%> 
	                    
					<% } %>
				</table>
			</div>
		</div>
		<br>
		
		
		<!-- 댓글 작성란 ┗|｀O′|┛ --> <!-- 수정중!!!!!!!!!!!!!!!!!!! -->
		<div class="container">
			<div class="form-group"> 
				<% CommentDTO commentDto = new CommentDTO();  %>
				<form method="post" encType = "multipart/form-data" action="commentPostAction.jsp?cmt_num=<%= commentDto.getCmt_num() %>&c_num=<%= commentDto.getC_num()%>">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
 						<tr>
							<td colspan="2" style="border-bottom:none; text-align: left;" valign="middle">
								<%if (info == null){%>
									<p></p>
								<% } else { %>
									<%= info.getNick() %>
								<%}%></td>
						</tr>
						<tr>
							<td>   
							
							
<%-- 👋👋👋👋👋👋👋  test용임 아래 코드는 지워야 됨 --%>
<!-- 								<ul class="fh5co-social-icons">
										<li><label for="file">
												<div class="btn btn-file">
													<i class="icon-camera"></i> 공모전 사진 선택
												</div>
										</label> <input type="file" name="commentImg" id="file"
											style="display: none;" onchange="previewImage(this);">
										</li> 미리보기 영역
										<div id="imagePreview">
											<img id="preview" src="" alt=""
												style="max-width: 100%; height: auto;">
										</div>
						        </ul> 
							</td>							
						</tr> 
						<tr> 
							<td><br><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
						</tr>  --> 
								
<%-- 👋👋👋👋👋👋👋 찐 코드 !!!!!!!!!!!!!!!! --%>
								<ul class="fh5co-social-icons">
 									<% if (info != null) { %>
									<li><label for="file" id="uploadLabel">
											<div class="btn btn-file">
												<i class="icon-camera"></i> 공모전 사진 선택
											</div>
									</label> <input type="file" name="commentImg" id="file"
										style="display: none;" onchange="previewImage(this);">
									</li>
									<div id="imagePreview">
										<img id="preview" src="" alt=""
											style="max-width: 100%; height: auto;">
									</div>
									<%
									} else {
									%>
									    <li>
									        <p><a href="login.jsp" style="color: #000">로그인 후 공모전에 응모할 수 있습니다.</a></p>
									    </li>
									<% } %>
								</ul> 
							</td>							
						</tr> 
						<tr> 
							<td><br><input type="submit" id="uploadInput" value="댓글 작성" onclick="checkLogin()"></td>
						</tr> 
						 
					</table>
				</form>
			</div>
		</div> 
		 
  
	
	
 	<footer id="fh5co-footer" role="contentinfo">
		<div class="container">
				  
			<div class="row copyright">
				<div class="col-md-12 text-center">
					<p>
						<small class="block">&copy; 2024 DOORIBURN. All Rights Reserved.</small> 
						<small class="block">Designed by DOORIBURN</small>
					</p>
 			
 			
<!-- 버튼 -->
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



	
	 
	<!-- 댓글 사진 업로드시 미리보기 -->
	<script>
	    function previewImage(input) {
	        var preview = document.getElementById('preview');
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function(e) {
	                preview.src = e.target.result;
	            }
	            reader.readAsDataURL(input.files[0]); // 파일을 읽어 데이터 URL로 변환
	        } else {
	            preview.src = ""; // 파일이 선택되지 않은 경우 미리보기 초기화
	        }
	    }	     
	</script>
	
	<!-- 댓글 작성 버튼 눌렀을 때 로그인 여부 확인하기 -->
 	<script>
    function checkLogin() {
        var loggedIn = <%= (info != null) %>;  
        if (!loggedIn) {
            var confirmLogin = confirm("로그인 후에 댓글을 작성할 수 있습니다. 로그인 페이지로 이동하시겠습니까?");
            if (confirmLogin) {
                window.location.href = "login.jsp"; 
            }
        } else {
        	location.reload();
        }
    }
	</script> -
	

	<!-- 해당 글 삭제시 Confirm 창 -->
	<script>
		function confirmDelete(c_num) {
			var result = confirm("글을 삭제하시겠습니까?");
			if (result) {
	            location.href = "ContestDeleteService?c_num=" + c_num;  
			}
		}
	</script>

	<!-- 댓글 삭제시 Confirm 창 -->
	<script>
		function confirmCommentDelete(cmt_num) {
			var result = confirm("댓글을 삭제하시겠습니까?");
			if (result) {
				location.href = "CommentDeleteService?c_num=<%= dto.getC_num() %>&cmt_num=" + cmt_num;  
			}
		}
	</script> 
	  
	 
	 
	 
	</body>
</html>
