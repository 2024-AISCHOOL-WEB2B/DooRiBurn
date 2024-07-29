<%@page import="com.model.RankingDAO"%>
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
<!-- <link rel="stylesheet" href="style.css/rivew.css">
 --><!-- 카카오 맵 API 스크립트 찾아서 연결해야 함!! -->
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
  width: 90%;
  height: 70%;
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
  border-radius: 10px;
  /* 임시 지정 */
  width: 500px;
  height: 400px;
  
  /* 초기에 약간 아래에 배치 */
  transform: translate(-50%, -40%);
}

.show .popup {
  transform: translate(-50%, -50%);
  transition: all .5s;
}

#Post_a_review{
	padding: 5px 15px;
	border-radius: 5px;
}
</style>



<style>
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 2em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
</style>
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
	RankingDAO rdao = new RankingDAO();
	rdao.Update(index);
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
		<div class="tags">
			<span>#데이트</span> <span>#가족</span> <span>#선암귀</span> <span>#수족관</span>
		</div>
		<h1><%=place%></h1>
		<p class="address"><%=addr%></p>
		<p class="hours">
			영업시간:<%= scene%>
			</p>
		<p class="phone">
			전화번호: <%= time%>
			</p>
		<div class="tags">
			
			
			<div class="drama">
			<!-- 왼쪽 사진 -->
			<img src="images/<%=drama %>.jpg" alt="선재 업고 튀어" class="image">
			<!-- 오른쪽 텍스트 -->
			<div class="text">
				<h1><%=drama %></h1>
				<p><%=tel%></p>
			</div>
		</div>
		
		</div>
	
	
		
	</section>
	<!-- 여기까지 -->

	
		
		<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1cac00685a32d9d2daf6b4bdb4fc80e"></script>
		

		<!-- 리뷰 섹션 -->
		<div class="review">
			<div class="review-header">
				<h2 style="font-weight: bold;">Review</h2>
					 <div>
				<button class="review-btn" id="show" onclick="">리뷰
					작성하기</button>
				    <div class="background">
				      <div class="window">
				        <div class="popup">
					        <div align="right">
								<button id="close">닫기</button>
				        	</div>
				        	<div style="margin: auto;">
				        		<form class="mb-3" name="myform" id="myform" method="post" action="ReviewUpdateService">
					     			<input name="index" type="text" value= <%=index %> style="display: none;">
									<fieldset style="display: inline-block ; direction: rtl ; border:0 ;">
										<span class="text-bold">별점을 선택해주세요</span>
										<input type="radio" name="reviewStar" value="5" id="rate1"><label
											for="rate1">★</label>
										<input type="radio" name="reviewStar" value="4" id="rate2"><label
											for="rate2">★</label>
										<input type="radio" name="reviewStar" value="3" id="rate3"><label
											for="rate3">★</label>
										<input type="radio" name="reviewStar" value="2" id="rate4"><label
											for="rate4">★</label>
										<input type="radio" name="reviewStar" value="1" id="rate5"><label
											for="rate5">★</label>
									</fieldset>
									<div>
										<input type="checkbox" value="가족" name="mood"><span>#가족</span>
										<input type="checkbox" value="데이트" name="mood"><span>#데이트</span>
										<input type="checkbox" value="야경" name="mood"><span>#야경</span>
										<input type="checkbox" value="친구" name="mood"><span>#친구</span>
										<input type="checkbox" value="맛집" name="mood"><span>#맛집</span>
										<input type="checkbox" value="사진 명소" name="mood"><span>#사진 명소</span>
										<input type="checkbox" value="산책" name="mood"><span>#산책</span>
										<input type="checkbox" value="비오는날" name="mood"><span>#비오는날</span>
										<input type="checkbox" value="애견동반" name="mood"><span>#애견동반</span>
										<input type="checkbox" value="파티" name="mood"><span>#파티</span>
									</div>
									<div>
										<textarea class="col-auto form-control" type="text" name="content"  id="reviewContents"
										placeholder="좋은 리뷰을 남겨주시면 큰 힘이 됩니다!"></textarea>
									</div>
									<div align="center">
										<input type="submit" value="리뷰올리기" id="Post_a_review">
									</div>
								</form>	
				        	</div>
				        </div>
				        <div>
				          <div></div>
				        </div>
				      </div>
				    </div>
			</div>
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
	
	<script>
		function search() {
			var query = document.getElementById('searchQuery').value;
			var option = document.getElementById('searchOption').value;
			fetch(`http://localhost:5002/search?search=${query}&s_option=${option}`)
				.then(response => response.json())
				.then(data => {
					if (data !== "없는결과") {
						displayResults(data);
					} else {
						alert("검색 결과가 없습니다.");
					}
				});
		}
		
		
		function displayResults(results) {
			
			let lat =  37.5290674
			let lon =  126.936218
			var mapContainer = document.getElementById('map');
			var mapOption = { 
				center: new kakao.maps.LatLng(lat, lon),
				level: 3 
			}; 
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			results.forEach(result => {
				var markerPosition = new kakao.maps.LatLng(result.위도, result.경도);
				var marker = new kakao.maps.Marker({
					position: markerPosition
				});
				marker.setMap(map);
			});
		}
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
