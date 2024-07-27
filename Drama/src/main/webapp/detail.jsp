<%@page import="com.model.DramaSearchDTO"%>
<%@page import="com.model.DramaSearchDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.ContestDTO"%>
<%@page import="com.model.ContestDAO"%>
<%@page import="com.model.MemberDTO"%>
<%@page import="com.model.FilmLikeDAO"%>
<%@page import="com.model.FilmLikeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Detail</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- jQuery 라이브러리 추가 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 카카오 맵 API 스크립트 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f589bcfaff80d0ddfe6b7666abe62fea"></script>

<!-- 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">

<!-- CSS 파일 연결 -->
<link rel="stylesheet" href="css/detail.css">
<link rel="stylesheet" href="css/Realstyle.css">

<!-- 좋아요 버튼 스타일 추가 -->
<style>
.star-button {
	background: none;
	border: none;
	font-size: 24px;
	cursor: pointer;
	color: black;
	margin-left: 10px; /* 좋아요 버튼을 제목 옆에 적절히 배치하기 위해 여백 설정 */
}

.star-button.liked {
	color: gold;
}

.star-button:focus {
	outline: none;
}

.place-container {
	display: flex;
	align-items: center; /* 수평 정렬 */
}

.place-container h1 {
	margin: 0; /* h1 요소의 기본 여백 제거 */
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

	// 세션에서 사용자 정보 가져오기
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	String email = (info != null) ? info.getEmail() : "";

	// 좋아요 상태 확인
	boolean isLiked = false;
	if (email != null && !email.isEmpty()) {
		FilmLikeDAO likeDAO = new FilmLikeDAO();
		FilmLikeDTO likeDTO = new FilmLikeDTO(email, Integer.parseInt(index));
		isLiked = likeDAO.isLiked(likeDTO);
	}
	%>

	<!-- 배너 -->
	<header>
		<div class="banner" onclick="location.href='Realindex.jsp'">여기가
			거기여?</div>
		<div class="menu-icon" onclick="openNav()">☰</div>
	</header>

	<!-- 메뉴 -->
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()"
			style="color: #333333;">&times;</a>
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

	<!-- 상세 페이지 -->
	<!-- 추가 -->
	<div class="container">
		<header class="header">
			<img src="<%=img_src%>" alt="Aquarium" class="header-img">
		</header>
	</div>
	<section class="info">
		<div class="tags">
			<span>#데이트</span> <span>#가족</span> <span>#선업튀</span> <span>#수족관</span>
		</div>
		<!-- 장소 이름과 좋아요 버튼을 감싸는 컨테이너 추가 -->
		<div class="place-container">
			<h1><%=place%></h1>
			<button class="star-button <%=isLiked ? "liked" : ""%>"
				onclick="handleLikeClick(<%=index%>, '<%=email%>', this)"><%=isLiked ? "★" : "☆"%></button>
		</div>
		<p class="address"><%=addr%></p>
		<p class="hours">
			영업시간:
			<%=scene%>
		</p>
		<p class="phone">
			전화번호:
			<%=time%>
		</p>
		<div class="tags">
			<div class="drama">
				<!-- 왼쪽 사진 -->
				<img src="images/drama_imagessss/<%=drama%>.jpg" alt="드라마 표지"
					class="image" style="width: 200px; height: 300px;">
				<!-- 오른쪽 텍스트 -->
				<div class="text">
					<h1><%=drama%></h1>
					<p><%=tel%></p>
				</div>
			</div>
		</div>
	</section>
	<!-- 여기까지 -->

	<!-- 카카오 맵 표시할 div -->
	<div id="map" data-lat="<%=lat%>" data-lon="<%=lon%>"
		style="width: 100%; height: 350px;"></div>

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

	<!-- JavaScript 파일 연결 -->
	<script src="js/menu.js"></script>
	<script src="js/map.js"></script>

	<!-- 좋아요 기능 JavaScript 추가 -->
	<script>
        // 좋아요 기능 처리
        function handleLikeClick(filmId, email, button) {
            if (!email) {
                alert("로그인이 필요합니다.");
                return;
            }
            $.ajax({
                type: 'POST',
                url: '<%=request.getContextPath()%>/FilmLikeService',
                data: { 
                    f_num: filmId,
                    email: email
                },
                success: function(response) {
                    console.log('좋아요 처리 성공:', response);
                    if (button.textContent === '★'){
                        button.textContent = '☆';
                        button.classList.remove('liked');
                    } else {
                        button.textContent = '★';
                        button.classList.add('liked');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('좋아요 처리 오류:', error);
                }
            });
        }

        // 지도 초기화
        function initializeMap(lat, lon) {
            var mapContainer = document.getElementById('map');
            var mapOption = {
                center: new kakao.maps.LatLng(lat, lon),
                level: 3
            };
            var map = new kakao.maps.Map(mapContainer, mapOption);

            var markerPosition = new kakao.maps.LatLng(lat, lon);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
        }

        // 페이지 로드 후 지도 초기화
        $(document).ready(function() {
            var lat = parseFloat('<%=lat%>');
            var lon = parseFloat('<%=lon%>');
            initializeMap(lat, lon);
        });

        function displayResults(results) {
            if (results.length > 0) {
                var lat = results[0].위도;
                var lon = results[0].경도;
                initializeMap(lat, lon);

                results.forEach(result => {
                    var markerPosition = new kakao.maps.LatLng(result.위도, result.경도);
                    var marker = new kakao.maps.Marker({
                        position: markerPosition
                    });
                    marker.setMap(map);
                });
            }
        }

        function search() {
            var query = $('#search-query').val();
            var s_option = $('#search-option').val();

            $.ajax({
                type: 'GET',
                url: 'http://127.0.0.1:5002/search',
                data: { search: query, s_option: s_option },
                success: function(response) {
                    if (response !== "없는결과") {
                        displayResults(response);
                    } else {
                        console.log('검색 결과가 없습니다.');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('검색 오류:', error);
                }
            });
        }
    </script>

</body>
</html>
