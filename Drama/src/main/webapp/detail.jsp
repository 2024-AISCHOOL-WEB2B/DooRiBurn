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
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f589bcfaff80d0ddfe6b7666abe62fea"></script>

</head>
<body>

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
	<div class="container">
		<header class="header">
			<img src="images/jeju_aquarium.png" alt="Aquarium" class="header-img">
		</header>
		<section class="info">
			<h1 style="font-weight: bold;">제주도 한림수족관</h1>
			<p class="address">제주특별자치도 제주시 한림읍 한림리 935-3</p>
			<p class="hours">영업시간: 오후 6:30 목 오전 10:00에 영업 시작</p>
			<p class="phone">전화번호: 064-796-6389</p>
			<div class="tags">
				<span>#데이트</span> <span>#가족</span> <span>#선업튀</span> <span>#수족관</span>
			</div>
		</section>


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

		<!-- 카카오 맵 지도 연결 -->
		<div id="map" style="width: 100%; height: 350px;"></div>

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
	</div>
	</div>
	<!-- JavaScript 파일 연결 -->
	<script src="js/menu.js"></script>
	<script src="js/map.js"></script>
	<!-- 카카오 맵 초기화 스크립트 파일 연결 -->

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

        // 반응형 지도 크기 조절
        window.addEventListener('resize', function() {
            map.relayout();
            map.setCenter(new kakao.maps.LatLng(lat, lon));
        });
    }
        
    </script>
</body>
</html>
