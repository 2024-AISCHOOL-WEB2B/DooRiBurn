<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Search</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by FreeHTML5.co" />
<meta name="keywords"
	content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
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
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<link
	href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700'
	rel='stylesheet' type='text/css'>
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
	
<!-- 얘가 문제임 -->	
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet" /> -->


<style type="text/css">
* {
	font-family: "IBM Plex Sans KR", sans-serif;
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
<link rel="stylesheet" href="css/styles.css">

<link rel="stylesheet" href="css/style.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 추가 1  -->

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
							<li class="has-dropdown"><a href="services.html">마이페이지</a>
								<ul class="dropdown">
									<li><a href="#">관심 촬영지</a></li>
									<li><a href="#">회원정보수정</a></li>
									<li><a href="#">참여한 공모전</a></li>
								</ul></li>
						</ul>
					</div>
					<div class="logo text-center">
						<div id="fh5co-logo">
							<a href="index.jsp">여</a>
						</div>
					</div>
					<div class="right-menu text-left menu-1">
						<ul>
							<li><a href="blog.html">공모전</a></li>
							<li class="has-dropdown"><a href="#">지역 별로 찾기</a>
								<ul class="dropdown">
									<li><a href="#">서울</a></li>
									<li><a href="#">부산</a></li>
									<li><a href="#">인천</a></li>
									<li><a href="#">대구</a></li>
								</ul></li>
							<li><a href="contact.html">Contact</a></li>
							<!-- <li class="btn-cta"><a href="#"><span>Login</span></a></li> -->
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
								<h1 style="font-style: normal; text-align: center; color: black">여기가
									거기여?</h1>
								<br>


								<div class="row">
									<form class="form-inline" id="fh5co-header-subscribe">
										<div class="col-md-6 col-md-offset-3">


											<div class="search-container"
												style="display: flex; align-items: center;">
												<select name="category" style="margin-right: 10px;">
													<option value="location">장소 및 지역</option>
													<option value="drama">드라마</option>
												</select> <input name="search" type="text"
													placeholder="지역 또는 드라마 명을 검색하세요."
													style="flex-grow: 1; margin-right: 10px;">
												<button type="submit" id="search-button">
													<i class="search-icon">&#128269;</i>
												</button>

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

		<div class="ranking">
			<div class="rank-item">
				<div class="rank-num">1</div>
				<div class="rank-text">선재 업고 튀어</div>
			</div>

			<div class="rank-item">
				<div class="rank-num">2</div>
				<div class="rank-text">광주</div>
			</div>

			<div class="rank-item">
				<div class="rank-num">3</div>
				<div class="rank-text">눈물의 여왕</div>
			</div>

			<div class="rank-item">
				<div class="rank-num">4</div>
				<div class="rank-text">제주도</div>
			</div>

			<div class="rank-item">
				<div class="rank-num">5</div>
				<div class="rank-text">전주</div>
			</div>
		</div>

		<div class="intro" style="height: 400px">
			<h2 class="highlight">선재 업고 튀어에 나온 그 장소!</h2>
			<h2 class="highlight">나도 가 볼까?</h2>

			<div id="carouselExampleCaptions" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="images/jeju_aquarium.png" class="d-block w-100"
							alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>제주 아쿠아리움</h5>
							<p>제주의 아름다운 바다 생물을 만날 수 있는 곳입니다.</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="images/jeonju_hanok_village.jpg" class="d-block w-100"
							alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>전주 한옥 마을</h5>
							<p>한국 전통 가옥을 체험할 수 있는 곳입니다.</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="images/seoulforest.jpeg" class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>서울숲</h5>
							<p>서울 도심 속의 자연을 느낄 수 있는 공원입니다.</p>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
				
			</div>

			


		</div>





		<footer>
			<button class="btn">로그인</button>
			<button class="btn">회원가입</button>
			<button class="btn">한국어</button>
			<button class="btn">English</button>
			<br>
		</footer>




	</div>

	<!-- <div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div> -->

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

