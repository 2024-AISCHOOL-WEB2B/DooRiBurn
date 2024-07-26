<%@page import="com.model.DramaSearchDTO"%>
<%@page import="com.model.DramaSearchDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.ContestDTO"%>
<%@page import="com.model.ContestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Detail</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://font.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">

<!-- CSS 파일 연결 -->
<link rel="stylesheet" href="css/detail.css">
<link rel="stylesheet" href="css/Realstyle.css">

<!-- 카카오 맵 API 스크립트 찾아서 연결해야 함!! -->

</head>
<body>
	<%
	String index = request.getParameter("index");
	
	DramaSearchDAO dao = new DramaSearchDAO();
	ArrayList<DramaSearchDTO> film_detail = dao.film_detail(index);
	
	String drama = film_detail.get(0).getDrama();
	String place = film_detail.get(0).getFName();
	String addr = film_detail.get(0).getFAddr();
	double lat = film_detail.get(0).getLat();
	double lon = film_detail.get(0).getLon();
	String tel = film_detail.get(0).getScene();
	String time = film_detail.get(0).getFTel();
	String scene = film_detail.get(0).getFTime();
	String img_src = film_detail.get(0).getFimg();
	%>
	<div class="fh5co-loader">
		<div id="page"></div>
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
									<li><a href="#">API</a></li>
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
							<li class="has-dropdown"><a href="#">카테고리</a>
								<ul class="dropdown">
									<li><a href="#">HTML5</a></li>
									<li><a href="#">CSS3</a></li>
									<li><a href="#">Sass</a></li>
									<li><a href="#">jQuery</a></li>
								</ul></li>
							<li><a href="contact.html">Contact</a></li>
							<!-- <li class="btn-cta"><a href="#"><span>Login</span></a></li> -->
						</ul>
					</div>
				</div>
			</div>
		</nav>
	</div>
	<!-- 배너 -->
	<header>
		<div class="banner">여기가 거기여?</div>
		<div class="menu-icon" onclick="openNav()">☰</div>
	</header>

	<!-- 메뉴 -->
	<div id="mySidenav" class="sidenav">
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
		<div class="menu-section">
			<h2>마이 페이지</h2>
			<div class="menu-itemss">
				<a href="#">회원정보 수정</a> <a href="#">관심 촬영지</a> <a href="#">참여한
					공모전</a>
			</div>
		</div>
	</div>

	<!-- 검색 입력 ????????? -->
	<!-- <div>
        <input type="text" id="searchQuery" placeholder="검색어 입력"> <select
            id="searchOption">
            <option value="0">제목</option>
            <option value="1">장소</option>
        </select>
        <button onclick="search()">검색</button>
    </div>
 -->

	<!-- 상세 페이지 -->

	<!-- 추가 -->
	<div class="container">
		<header class="header">
			<img src=<%=img_src %> alt="Aquarium" class="header-img">
		</header>
	</div>
	<section class="info">
		<h1><%=place%></h1>
		<p class="address"><%=addr%></p>
		<p class="hours">
			영업시간:
			<%=time%></p>
		<p class="phone">
			전화번호:
			<%=tel%></p>
		<p class="phone">
			촬영지속 드라마 장면 :
			<%=scene%></p>
		<div class="tags">
			<span>#데이트</span> <span>#가족</span> <span>#선암귀</span> <span>#수족관</span>
		</div>
	</section>
	<!-- 여기까지 -->

	<div id="fh5co-blog" class="fh5co-bg-section">
		<div class="container">
			<!-- 검색명에 대한 검색 결과! 촬영지 목록 -->
			<div class="row">
				<div class="col-lg-4 col-md-4">
					<div class="fh5co-blog animate-box">
						<a href="#"><img class="img-responsive"
							src="images/work-4.jpg" alt=""></a>
						<!-- 해당 장소 사진 -->
						<div class="blog-text">
							<h3>
								<a href="" #>수원 행궁동 행리단길</a>
							</h3>
							<!-- 장소명 -->
							<span class="posted_on">선재 업고 튀어</span>
							<!-- 드라마명 -->
							<span class="favorites">⭐</span>
							<!-- 즐겨찾기 -->
							<p>'선재 업고 튀어' 9화에서 선재와 솔이가 첫 데이트를 하는 장소로..</p>
							<!-- 상세줄거리 미리보기 -->
							<a href="#" class="btn btn-primary">상세보기</a>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- 드라마 상세 줄거리 -->
		<div class="drama">
			<!-- 왼쪽 사진 -->
			<img src="images/cover.jpg" alt="선재 업고 튀어" class="image">
			<!-- 오른쪽 텍스트 -->
			<div class="text">
				<h1>선재 업고 튀어 6화</h1>
				<p>태성의 사귀자는 고백의 내막을 알게 된 솔은 태성에게 이별을 고한다. 이후, 선재와 함께 수족관을
					방문하는데... (중략) mp3에 녹음된 선재의 고백을 수족관에서 뒤늦게 듣게 된 솔. 그때부터 선재가 의식되고 가슴이
					두근두근거린다.</p>
			</div>
		</div>
		<div id="lat" style="display: none;"><%=lat%></div>
		<div id="lon" style="display: none;"><%=lon%></div>
		<div id="place" style="display: none;"><%=place%></div>
		<!-- 카카오 맵 지도 연결 -->
		<div id="staticMap" style="width: 100%; height: 350px;"></div>
		
		<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1cac00685a32d9d2daf6b4bdb4fc80e"></script>
		

		<!-- 리뷰 섹션 -->
		<div class="review">
			<div class="review-header">
				<h2 style="font-weight: bold;">Review</h2>
				<button class="review-btn" onclick="window.location.href='pop.jsp';">리뷰
					작성하기</button>
			</div>
			<div class="submitted-reviews">
				<div class="review-item">
					<div class="rating">
						<span>⭐</span> <span>⭐</span> <span>⭐</span> <span>⭐</span> <span>⭐</span>
					</div>
					<h3>제주도 가시면 꼭 들러야 할 장소 1위!</h3>
					<p>선재 업고 튀어 보고 방문했는데</p>
					<p class="nickname">개나리</p>
					<p class="date">2023. 04. 01</p>
				</div>
			</div>
		</div>
	</div>

	<!-- JavaScript 파일 연결 -->
	<script src="js/menu.js"></script>
	<script src="js/map.js"></script>
	<!-- 카카오 맵 초기화 스크립트 파일 연결 -->

	<script>
	
	var lat = parseFloat(document.getElementById('lat').innerText);
	var lon = parseFloat(document.getElementById('lon').innerText);
	var place = document.getElementById('place').innerText;
		// 이미지 지도에 표시할 마커입니다
		var marker = {
			position : new kakao.maps.LatLng(lat, lon),
			text : place // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다
		};

		var staticMapContainer = document.getElementById('staticMap'), // 이미지 지도를 표시할 div
		staticMapOption = {
			center : new kakao.maps.LatLng(lat, lon), // 이미지 지도의 중심좌표
			level : 3, // 이미지 지도의 확대 레벨
			marker : marker
		// 이미지 지도에 표시할 마커
		};

		// 이미지 지도를 생성합니다
		var staticMap = new kakao.maps.StaticMap(staticMapContainer,
				staticMapOption);
	</script>


</body>
</html>
