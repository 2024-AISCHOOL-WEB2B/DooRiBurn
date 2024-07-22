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
	</style>
	
	
	
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
						<li><a href="Join.jsp">회원가입</a></li>
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
					<div id="fh5co-logo"><a href="index.jsp">여기가 거기야!!</a></div>
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

	<header id="fh5co-header" class="fh5co-cover" role="banner" style="background-image:url(images/black.jpg);" >	
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

	

	<footer id="fh5co-footer" role="contentinfo">
		<div class="container">
			<div class="row row-pb-md">
				<div class="col-md-2 col-sm-4 col-xs-6">
					<ul class="fh5co-footer-links">
						<li><a href="#">About</a></li>
						<li><a href="#">Help</a></li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">Terms</a></li>
						<li><a href="#">Meetups</a></li>
					</ul>
				</div>

				<div class="col-md-2 col-sm-4 col-xs-6">
					<ul class="fh5co-footer-links">
						<li><a href="#">Shop</a></li>
						<li><a href="#">Privacy</a></li>
						<li><a href="#">Testimonials</a></li>
						<li><a href="#">Handbook</a></li>
						<li><a href="#">Held Desk</a></li>
					</ul>
				</div>

				<div class="col-md-2 col-sm-4 col-xs-6">
					<ul class="fh5co-footer-links">
						<li><a href="#">Find Designers</a></li>
						<li><a href="#">Find Developers</a></li>
						<li><a href="#">Teams</a></li>
						<li><a href="#">Advertise</a></li>
						<li><a href="#">API</a></li>
					</ul>
				</div>
				<div class="col-md-4 col-sm-12 col-xs-12 fh5co-widget col-md-push-1">
					<h3>A Little About Orange</h3>
					<p>Facilis ipsum reprehenderit nemo molestias. Aut cum mollitia reprehenderit. Eos cumque dicta adipisci architecto culpa amet.</p>
					<p><a href="#">Learn More</a></p>
				</div>
			</div>

			<div class="row copyright">
				<div class="col-md-12 text-center">
					<p>
						<small class="block">&copy; 2016 Free HTML5. All Rights Reserved.</small> 
						<small class="block">Designed by <a href="http://freehtml5.co/" target="_blank">FreeHTML5.co</a> Demo Images: <a href="http://unsplash.com/" target="_blank">Unsplash</a></small>
					</p>
					<p>
						<ul class="fh5co-social-icons">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-linkedin"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
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
	<!-- Google Map -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<script src="js/google_map.js"></script>

	<script src="js/main.js"></script>
	
	<script src="js/jquery-3.6.0.min.js"></script>
	
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
	
	
	</body>
</html>

