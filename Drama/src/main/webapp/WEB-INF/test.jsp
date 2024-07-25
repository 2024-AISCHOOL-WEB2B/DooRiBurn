<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Orange &mdash; Free Website Template, Free HTML5 Template by FreeHTML5.co</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="FreeHTML5.co" />

	<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FreeHTML5.co
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

  	<!-- Facebook and Twitter integration -->
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
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	
	<style type="text/css">
		*{
			font-family: "Jua", sans-serif;
  			font-weight: 400;
  			font-style: normal;
		}
		
	.horizontal-menu {
		display: flex !important;
		flex-wrap: wrap !important;
	}
	
	.horizontal-menu li {
		width: 25% !important; /* 4개씩 나열하기 위해 각 항목의 너비를 25%로 설정 */
		margin-bottom: 10px !important; /* 항목 간의 간격 설정 */
		list-style-type: none;
	}
	
	.horizontal-menu li a {
		display: block;
		padding: 5px 0;
	}
	
	#fh5co-header{
		height: 180px !important;
	}
	</style>
	
	<style>
.background {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.3);
  z-index: 1000;
}

.window {
  position: relative;
  width: 100%;
  height: 100%;
}

.popup {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #ffffff;
  box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
  
  /* 임시 지정 */
  width: 500px;
  height: 500px;
}

.background {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.3);
  z-index: 1000;
  
  /* 숨기기 */
  z-index: -1;
  opacity: 0;
}

.show {
  opacity: 1;
  z-index: 1000;
  transition: all .5s;
}

.popup {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #ffffff;
  box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
  
  /* 임시 지정 */
  width: 500px;
  height: 500px;
  
  /* 초기에 약간 아래에 배치 */
  transform: translate(-50%, -40%);
}

.show .popup {
  transform: translate(-50%, -50%);
  transition: all .5s;
}
</style>
	
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="css/styles.css">
	
	<link rel="stylesheet" href="css/style.css">
	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
	
	
	
	<script>
        function validateForm() {
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            var nick = document.getElementById("nick").value;
            var name = document.getElementById("name").value;
            var phone = document.getElementById("phone").value;
            var addr = document.getElementById("addr").value;

            if (email == "" || password == "" || nick == "" || name == "" || phone == "" || addr == "") {
                alert("모든 필드를 입력해 주세요.");
                return false;
            }
            return true;
        }
    </script>
    
    
		
	<div class="fh5co-loader"></div>
	
	<div id="page">
	<nav class="fh5co-nav" role="navigation">
				<div class="container">
					<div class="row">
						<div class="left-menu text-right menu-1">
							<ul>
								<li><a href="contact.jsp">회원가입</a></li>
								<li><a href="about.html">로그인</a></li>
								<li class="has-dropdown"><a href="#">마이페이지</a>
									<ul class="dropdown">
										<li><a href="#">관심 촬영지</a></li>
										<li><a href="#">회원정보 수정</a></li>
										<li><a href="#">참여한 공모전</a></li>
									</ul>
								</li>
							</ul>
						</div>
	
						<div class="right-menu text-left menu-1">
							<ul>
								<li><a href="blog.html">공모전</a></li>
								<li class="has-dropdown"><a href="">지역 별로 찾기</a>
									<ul class="horizontal-menu">
										<li><a href="#">서울</a></li>
										<li><a href="#">부산</a></li>
										<li><a href="#">인천</a></li>
										<li><a href="#">대구</a></li>
										<li><a href="#">대전</a></li>
										<li><a href="#">광주</a></li>
										<li><a href="#">울산</a></li>
										<li><a href="#">세종</a></li>
										<li><a href="#">경기</a></li>
										<li><a href="#">충북</a></li>
										<li><a href="#">충남</a></li>
										<li><a href="#">전북</a></li>
										<li><a href="#">전남</a></li>
										<li><a href="#">경북</a></li>
										<li><a href="#">경남</a></li>
										<li><a href="#">강원</a></li>
										<li><a href="#">제주</a></li>
									</ul>
								</li>
								<li><a href="contact.html">Contact</a></li>
							</ul>
						</div>
					</div>
	
				</div>
			</nav>

	<header id="fh5co-header" class="fh5co-cover" role="banner"
			style="background-image: url(images/backgroundco.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 text-center">
						<div class="display-t">
							<div class="display-tc animate-box" data-animate-effect="fadeIn">
								<h1 style="font-style: normal; text-align: center; color: black">
									여기가 거기여?</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>

	<div id="fh5co-contact">
		<div class="container">
			<div class="row">

				<div class="col-md-6 animate-box" align="center" onsubmit="return validateForm()">
					<h3>회원가입</h3>
					<form action="JoinService" method="post" name="JoinForm">
						<div class="row form-group">
							<div class="col-md-6" >
								<input type="email" name="email" id="email" class="form-control" placeholder="아이디(이메일)" >
								<font id="checkEmail" size = "2"></font>
							</div>
							<div class="col-md-6">
								<input type="password" name="pw" id="password" class="form-control" placeholder="비밀번호">
							</div>	
						</div>
						<div class="row form-group">
							<div class="col-md-6">
								<input type="text" name="nick" id="nick" class="form-control" placeholder="닉네임">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-6">
								<input type="text" name="name" id="name" class="form-control" placeholder="이름">
							</div>
							<div class="col-md-6">
								<input type="text" name="phone" id="phone" class="form-control" placeholder="전화번호">
							</div>
							<div class="col-md-6">
								<input type="text" name="addr" id="addr" class="form-control" placeholder="주소">
							</div>
						</div>
						<div class="row form-group">
							<input type="submit" id="submit" value="회원가입">
						</div>
					</form>		
				</div>
			</div>
			
		</div>
	</div>

	

	<button id="show">팝업열기</button>
    <div class="background">
      <div class="window">
        <div class="popup">
	        <div align="right">
				<button id="close">팝업닫기</button>
        	</div>
        	<div style="margin: auto;">
        		<form action="#" method="get">
        			<input type="text" 
        			style="width: 100%; height: 175px; padding: 10px 20px; margin: 5px 0; box-sizing: border-box;
        			border: solid; text-align: left;" placeholder="리뷰작성">
        		</form>
        	</div>
        </div>
        <div>
          <div></div>
        </div>
      </div>
    </div>




	<footer>
		<button class="btn" onclick="location.href='login.jsp'">로그인</button>
		<button class="btn">한국어</button>
		<button class="btn">English</button>
		<br>
	</footer>


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
	<!-- Google Map -->

	<script src="js/main.js"></script>
	
	
	<script>
	$('#email').focusout(function(){
		let userEmail = $('#email').val();
		
		$.ajax({
			url : "EmailCheckService",
			type : "post",
			data : {userEmail: userEmail},
			dataType : 'json',
			success : function(result){
				if(result == 0){
					$("#checkEmail").html('사용할 수 없는 이메일입니다.');
					$("#checkEmail").attr('color', 'red');
				}else{
					$("#checkEmail").html('사용할 수 있는 이메일입니다.');
					$("#checkEmail").attr('color', 'green');
				}
			},
			error : function(){
				alert("서버요청실패");
			}
			
			
		})
	})
	
	
	</script>
	<script>
      function show() {
        document.querySelector(".background").className = "background show";
      }

      function close() {
        document.querySelector(".background").className = "background";
      }

      document.querySelector("#show").addEventListener("click", show);
      document.querySelector("#close").addEventListener("click", close);
    </script>
	
	</body>
</html>

