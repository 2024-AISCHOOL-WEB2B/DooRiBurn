<%@page import="dooriburn.com.model.MemberDTO"%>
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
   <link rel="stylesheet" href="css/animate.css"> 
   <link rel="stylesheet" href="css/icomoon.css"> 
   <link rel="stylesheet" href="css/bootstrap.css"> 
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
   
   	/* form-group 스타일 조정 */
	.form-group {
	    width: 100%; /* form-group의 너비를 100%로 설정하여 입력 필드가 세로로 쌓이도록 함 */
	    margin-bottom: 15px; /* 항목 간의 간격 조정 */
	}
	
	/* col-md-6 클래스의 너비 조정 */
	.col-md-6 {
	    max-width: 100% !important; /* 부모 컨테이너 너비에 맞게 조정 */
	    width: 100% !important; /* 너비를 100%로 설정 */
	}
	
	/* 중앙 정렬을 위한 form 스타일 조정 */
	form {
	    width: 100%;
	    max-width: 600px; /* 폼의 최대 너비를 설정하여 너무 넓어지지 않도록 함 */
	    margin: 0 auto; /* 중앙 정렬 */
	}
	
	/* 중앙 정렬을 위한 form 스타일 조정 */
	form {
	    width: 100%;
	    max-width: 600px; /* 폼의 최대 너비를 설정하여 너무 넓어지지 않도록 함 */
	    margin: 0 auto; /* 중앙 정렬 */
	}
	
	
	/* 입력창과 버튼의 너비 조정 */
	.form-control {
	    width: 100% !important; /* 입력창의 너비를 100%로 설정 */
	    max-width: 100% !important; /* 최대 너비를 부모 컨테이너의 너비에 맞게 설정 */
	    padding: 10px; /* 패딩 추가 */
	    box-sizing: border-box; /* 패딩과 보더를 포함한 너비 계산 */
	}
	
	/* 버튼 스타일 조정 */
	input[type="submit"] {
	    width: 200px !important; /* 버튼의 너비를 100%로 설정 */
	    max-width: 100% !important; /* 최대 너비를 부모 컨테이너의 너비에 맞게 설정 */
	    padding: 10px; /* 패딩 추가 */
	    background-color: #FFEEB9;
	    border: none;
	    color: #102770;
	    font-size: 16px;
	    cursor: pointer;
	    border-radius: 4px;
	    box-shadow: 0 8px 24px 0 rgba(255, 235, 167, .2);
	    transition: background-color 0.3s, color 0.3s;
	}
	 
	input[type="submit"]:hover {
	    background-color: #ffd964;
	    color: white;
	}
   </style>
    
   </head>
   <body>
   
   <% 
      MemberDTO info = (MemberDTO)session.getAttribute("info");  
      String error = (String)session.getAttribute("error");
      String currentPage = request.getRequestURI(); 
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

   <div id="fh5co-contact" style="align-content: center;">
      <div class="container">
         <div class="row" >

            <div class="col-md-6 animate-box" align="center" onsubmit="return validateForm()">
               <h2 align="left" style ="text-align:center;">Login</h2>
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
                     <a href="contact.jsp" style="color: #eea236;">회원가입</a>
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
   
   <!-- Side navigation script -->
   <script>
      function openNav() {
         document.getElementById("mySidenav").style.width = "80%";
      }

      function closeNav() {
         document.getElementById("mySidenav").style.width = "0";
      }
   </script>
   
   
   </body>
</html>

