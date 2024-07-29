<%@page import="dooriburn.com.model.ReviewDAO"%>
<%@page import="dooriburn.com.model.RankingDAO"%>
<%@page import="dooriburn.com.model.DramaSearchDTO"%>
<%@page import="dooriburn.com.model.DramaSearchDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dooriburn.com.model.ContestDTO"%>
<%@page import="dooriburn.com.model.ContestDAO"%>
<%@page import="dooriburn.com.model.MemberDTO"%>
<%@page import="dooriburn.com.model.FilmLikeDAO"%>
<%@page import="dooriburn.com.model.FilmLikeDTO"%>
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
<!-- <link rel="stylesheet" href="style.css/rivew.css">
 -->
<!-- 카카오 맵 API 스크립트 찾아서 연결해야 함!! -->
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

<!-- 좋아요 버튼 스타일 추가 -->
</style>
<style>
.star-button {


<!--
좋아요 버튼 스타일 추가 --> <style>.star-button {
>>>>>>> branch 'main' of https://github.com/2024-AISCHOOL-WEB2B/dooRiBurn.git
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
<<<<<<< HEAD
<!-- pop스타일 -->
<style>
.backgroundpop {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.3);
  z-index: 1000;
}

.windowpop {
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

.backgroundpop {
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

#Post_a_review {
	padding: 5px 15px;
	border-radius: 5px;
}

.star-button {
	background: none;
	border: none;
	font-size: 24px;
	cursor: pointer;
	color: black;
	margin-bottom: 170px;
}

.star-button.liked {
	color: gold;
}

.star-button:focus {
	outline: none;
}
</style>



<style>
#myform fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#myform fieldset legend {
	text-align: right;
}

#myform input[type=radio] {
	display: none;
}

#myform label {
	font-size: 2em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#myform label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform input[type=radio]:checked ~ label {
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
	FilmLikeDAO f_dao = new FilmLikeDAO();
	String drama = film_detail.get(0).getDrama();
	String place = film_detail.get(0).getFName();
	String addr = film_detail.get(0).getFAddr();
	double lat = film_detail.get(0).getLat();
	double lon = film_detail.get(0).getLon();
	String tel = film_detail.get(0).getScene();
	String time = film_detail.get(0).getFTel();
	String scene = film_detail.get(0).getFTime();
	String img_src = film_detail.get(0).getFimg();
	
	// 랭킹 누적하기
	RankingDAO rdao = new RankingDAO();
	rdao.Update(index);


	// 세션에서 사용자 정보 가져오기
	MemberDTO info = (MemberDTO) session.getAttribute("info");

	// 좋아요 상태 확인

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
			<% ReviewDAO reviewdao = new ReviewDAO();
		     ArrayList<String> mood = reviewdao.moodRanking(Integer.parseInt(index));
		     for(int i = 0; i < mood.size(); i++){%>
			<span>#<%=mood.get(i) %></span> 
			<%} %>
		</div>
		<!-- 장소 이름과 좋아요 버튼을 감싸는 컨테이너 추가 -->
		<div class="place-container">
			<h1><%=place%></h1>
			<%
			// 촬영지 관심 등록 미등록
			if (info == null) {
			%>
			<button class="star-button"
				onclick="handleLikeClick(<%=index%>, '<%=info != null ? info.getEmail() : ""%>', this)">☆</button>

			<%
			} else {
			int n_index = Integer.parseInt(index);
			FilmLikeDTO dto = new FilmLikeDTO(info.getEmail(), n_index);
			%>

			<%
			if (f_dao.isLiked(dto)) {
			%>
			<button class="star-button"
				onclick="handleLikeClick(<%=index%>, '<%=info != null ? info.getEmail() : ""%>', this)">★</button>
			<%
			} else {
			%>
			<button class="star-button"
				onclick="handleLikeClick(<%=index%>, '<%=info != null ? info.getEmail() : ""%>', this)">☆</button>

			<%
			}
			%>

			<%
			}
			%>
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

	
	<div id="staticMap" style="width:400 px; height: 400px;"></div>
	
		<!-- 리뷰 섹션 -->
		<div class="review">
			<div class="review-header">
				<h2 style="font-weight: bold;">Review</h2>
					 <div>
					 <%if(info == null){ %>
					 <button class="review-btn" onclick="reviewLogin()">리뷰
					작성하기</button>
					<%}else { %>
					<button class="review-btn" id="showpop" onclick="">리뷰
					작성하기</button>
					<%} %>
				    <div class="backgroundpop">
					      <div class="windowpop">
					        <div class="popup">
						        <div align="right">
									<button id="closepop">닫기</button>
					        	</div>
					        
					        	<div style="margin: auto;">
					        		<form class="mb-3" name="myform" id="myform" method="post" action="ReviewUpdateService">
										<input type="text" name="index" style="display: none;" value="<%=index %>">
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
											<textarea class="col-auto form-control" name="content"  id="reviewContents"
											placeholder="좋은 리뷰을 남겨주시면 큰 힘이 됩니다!"></textarea>
										</div>
										<div align="center">
											<input type="submit" value="리뷰올리기" id="Post_a_review">
										</div>
									</form>	
					        	</div>
					        </div>
					      </div>
					</div>
				</div>
			</div>
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
	
	<div id="lat" style="display: none;"><%=lat%></div>
	<div id="lon"  style="display: none;"><%=lon%></div>
	<div id="place"  style="display: none;"><%=place%></div>
			


	<!-- JavaScript 파일 연결 -->
	<script src="js/menu.js"></script>
	<script src="js/map.js"></script>
	<!-- 리뷰pop버튼  -->
	 <script>
	      function show() {
		    document.querySelector(".backgroundpop").className = "backgroundpop show";
	      }
	
	      function close() {
	        document.querySelector(".backgroundpop").className = "backgroundpop";
	      }
			
	      function reviewLogin(){
	    	    alert('로그인이 필요합니다.');
	    	}
	      
	      document.querySelector("#showpop").addEventListener("click", show);
	      document.querySelector("#closepop").addEventListener("click", close);
	      
	      

    </script>

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

		// 이미지 지도를 생성합니다
		var staticMap = new kakao.maps.StaticMap(staticMapContainer,
				staticMapOption);
	</script>
		<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1cac00685a32d9d2daf6b4bdb4fc80e"></script>
	
    
   
	<script type="text/javascript">
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
				</script>

				<script>
				// 이미지 지도에 표시할 마커입니다
				var lat = parseFloat(document.getElementById('lat').innerText);
   				 var lon = parseFloat(document.getElementById('lon').innerText);
				var place = document.getElementById('place').innerText;
				var marker = {
				    position: new kakao.maps.LatLng(lat, lon), 
				    text: place // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다
				};
				
				var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div
				    staticMapOption = { 
				        center: new kakao.maps.LatLng(lat, lon), // 이미지 지도의 중심좌표
				        level: 3, // 이미지 지도의 확대 레벨
				        marker: marker // 이미지 지도에 표시할 마커
				    };
				
				// 이미지 지도를 생성합니다
				var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
				</script>
</body>
</html>
