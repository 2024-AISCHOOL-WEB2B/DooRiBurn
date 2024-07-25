<%@page import="com.model.ContestDAO"%>
<%@page import="com.model.ContestDTO"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>contestPost</title>
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
 
	/* .btn-file 클래스에 대한 스타일 조정 */
	#uploadLabel .btn-file {
	    background-color: #FFEEB9 !important;  
	    border-color: #FFEEB9 !important;  
	    color: #000 !important;
	} 
	 
	</style> 
	</head> 
	<body>
		<%  
			MemberDTO info = (MemberDTO)session.getAttribute("info"); 
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
	 
  		<%
			// 글 번호 가져오기
			int num = 0;
			if (request.getParameter("num") != null){
				num = Integer.parseInt(request.getParameter("num"));
			} 

			ContestDTO dto = new ContestDAO().getView(num); 
		%>
		
	<!-- 공모전 게시글 작성 -->
	<div class="container">
	    <div class="row">
	        <form method="post" action="contestPostAction.jsp" enctype="multipart/form-data">
	            <table class="table table-striped" style="text-align: center; border:1px solid #f9f9f9">
	                <thead>
	                    <tr>
	                        <th style="background-color: #f9f9f9; text-align: center;">공모전 게시글 작성</th> 
	                    </tr>
	                </thead>
	                <tbody style="background-color: #f9f9f9;"> 
	                    <tr> 
	                        <td><input type="text" class="form-control" placeholder="제목을 입력해주세요." name="contestTitle" required></td>
	                    </tr> 
	                    <tr> 
	                        <td><textarea class="form-control" placeholder="내용을 입력해주세요." name="contestContent" style="height: 350px;" required></textarea></td>
	                    </tr>
	                    <tr>
							<td>
							    <label for="file" id="uploadLabel">
							        <div class="btn btn-file">
							            <i class="icon-camera"></i> 사진 업로드
							        </div>
							    </label>
							    <input type="file" name="contestImg" id="file" style="display: none;" onchange="previewImage(event);">
							</td>   
						</tr>
						<tr>
						    <td>
                            <div id="imagePreview"></div>
                                <img id="preview" src="" alt="" style="max-width: 100%; height: auto;">
						    </td>
						</tr>	 
	                </tbody>
	            </table>
	            <input type="submit" class="btn btn-primary pull-right" value="작성">
	        </form>  
	    </div>
	</div>
		 
	</div> <!-- page div -->
 
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
	
	
		
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://bootstrap.js"></script>
 
	<!-- 업로드한 사진 미리보기 --> 
	<script> 
    function previewImage(event) {
        var input = event.target; 
        var reader = new FileReader();

        reader.onload = function() {
            var dataURL = reader.result; 
            var imagePreview = document.getElementById('imagePreview'); 
 
            imagePreview.innerHTML = '<img src="' + dataURL + '" alt="이미지 미리보기" style="max-width: 100%; height: auto;">';
        }

        // 파일이 선택되었을 때만 FileReader를 통해 파일을 읽음
        if (input.files && input.files[0]) {
            reader.readAsDataURL(input.files[0]);
        }
    }
	</script> 
	
	<!-- Side navigation script -->
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "80%";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>
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
