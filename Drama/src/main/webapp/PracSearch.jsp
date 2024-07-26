<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page
	import="java.io.*, java.net.*, org.json.JSONArray, org.json.JSONObject"%>

<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>PracSearch</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 기존 템플릿 -->
<!-- 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description"
	content="Free HTML5 Website Template by FreeHTML5.co" />
<meta name="keywords"
	content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="FreeHTML5.co" />
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />
 -->
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

<!-- 기존 템플릿 -->
<!-- <link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/bootstrap.css"> -->

<!-- 팀장님 css -->
<!-- <link rel="stylesheet" href="css/style2.css"> -->

<!-- 소영 css -->
<!-- <link rel="stylesheet" href="css/Realstyle.css"> -->

<link rel="stylesheet" href="css/PracSearch.css">

<!-- 기존 템플릿 -->
<!-- <script src="js/modernizr-2.6.2.min.js"></script> -->





</head>
<body>
	<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	String s_option = request.getParameter("s_option");
	String search = request.getParameter("search");

	List<String> titles = new ArrayList<>();
	List<String> places = new ArrayList<>();
	List<String> scene = new ArrayList<>();
	List<Integer> index = new ArrayList<>();
	// Flask 서버로 데이터를 전송합니다.
	HttpURLConnection conn = null;
	try {
		// Flask 서버의 URL 설정
		URL url = new URL(
		"http://localhost:5001/search?s_option=" + s_option + "&search=" + URLEncoder.encode(search, "UTF-8"));
		conn = (HttpURLConnection) url.openConnection();
		// 요청 방식 및 헤더 설정
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		// 서버 응답 확인
		int responseCode = conn.getResponseCode();
		System.out.println("GET Response Code :: " + responseCode);

		if (responseCode == HttpURLConnection.HTTP_OK) { // success
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String inputLine;
			StringBuffer response_data = new StringBuffer();

			// 서버 응답 데이터 읽기
			while ((inputLine = in.readLine()) != null) {
		response_data.append(inputLine);
			}
			in.close();

			// JSON 데이터 파싱
			JSONArray jsonArray = new JSONArray(response_data.toString());

			if (jsonArray.length() > 0) {
		System.out.println(jsonArray.length());
		out.println("<ul>");
		for (int i = 0; i < jsonArray.length(); i++) {
			JSONObject jsonObject = jsonArray.getJSONObject(i);

			titles.add(jsonObject.getString("제목"));
			places.add(jsonObject.getString("장소명"));
			scene.add(jsonObject.getString("장소설명"));
			index.add(jsonObject.getInt("index"));
		}
		out.println("</ul>");
			} else {
		out.println("No results found.");
			}
		} else {
			out.println("GET request not worked");
		}
	} catch (Exception e) {
		e.printStackTrace();
		out.println("Error: " + e.getMessage());
	} finally {
		if (conn != null) {
			conn.disconnect();
		}
	}
	%>

	<header>
		<div class="banner">여기가 거기여?</div>
		<div class="menu-icon" onclick="openNav()">☰</div>
	</header>

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
		<%
		if (info != null) {
		%>
		<div class="menu-section">
			<h2>마이 페이지</h2>
			<div class="menu-itemss">
				<a href="#">회원정보 수정</a> <a href="#">관심 촬영지</a> <a href="#">참여한
					공모전</a>
			</div>
		</div>
		<%
		}
		%>
	</div>


	<!-- 소영 -->
	<!-- 	<div class="main-content">
		<form action="search.jsp">
			<div class="search-container" style="height: 30px;">
				<select name="s_option" style="margin-right: 7px;">
					name="category" -> s_option
					<option value="1">장소 및 지역</option>
					<option value="0">드라마</option>
				</select> <input name="search" type="text" placeholder="검색"
					style="flex-grow: 1; margin-right: 5px;">
				<button type="button">
					<img src="images/search.png" style="width: 40px; height: 40px;" />
				</button>
			</div>
		</form> -->

	<!-- 소영 세진 -->
	<div class="main-content">
		<form action="search.jsp" method="get">
			<div class="search-container" style="height: 30px;">
				<select name="s_option" style="margin-right: 7px;">
					<%
					try {
						if ("0".equals(s_option)) {
					%>
					<option value="0">드라마</option>
					<option value="1">장소 및 지역</option>
					<%
					} else {
					%>
					<option value="1">장소 및 지역</option>
					<option value="0">드라마</option>
					<%
					}
					} catch (Exception e) {
					%>
					<option value="0">드라마</option>
					<option value="1">장소 및 지역</option>
					<%
					}
					%>
				</select>
				<%
				if (search == null) {
				%>
				<input name="search" type="text" placeholder="검색"
					style="flex-grow: 1; margin-right: 5px;">
				<%
				} else {
				%>
				<input name="search" type="text" class="form-control"
					placeholder="검색" value="<%=search%>"
					style="flex-grow: 1; margin-right: 5px;">
				<%
				}
				%>
				<button type="submit">
					<img src="images/search.png" style="width: 40px; height: 40px;" />
				</button>
			</div>
		</form>
	</div>


	<!-- 세진  -->
	<%-- <div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 text-center">
						<div class="display-t">
							<div class="display-tc animate-box" data-animate-effect="fadeIn">
								<div class="row">
									<form class="form-inline" id="fh5co-header-subscribe"
										action="search.jsp" method="get">
										<div class="col-md-6 col-md-offset-3">
											<div class="search-container"
												style="display: flex; align-items: center;">

												<select name="s_option" style="margin-right: 10px;">
													<%
													try {
														if ("0".equals(s_option)) {
													%>
													<option value="0">드라마</option>
													<option value="1">장소및 지역</option>
													<%
													} else {
													%>
													<option value="1">장소및 지역</option>
													<option value="0">드라마</option>
													<%
													}
													} catch (Exception e) {
													%>
													<option value="0">드라마</option>
													<option value="1">장소및 지역</option>
													<%
													}
													%>

												</select>
												<%
												if (search == null) {
												%>
												<input name="search" type="text"
													placeholder="지역 또는 드라마 명을 검색하세요."
													style="flex-grow: 1; margin-right: 10px;">
												<%
												} else {
												%>
												<input name="search" type="text" class="form-control"
													placeholder="지역 또는 드라마 명을 검색하세요." value="<%=search%>"
													style="flex-grow: 1; margin-right: 10px;">
												<%
												}
												%>

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
	</div>
 --%>



	<!-- 소영 -->
	<!-- 촬영지 리스트 -->
	<!-- 첫 번째 박스 -->
	<div class="box">
		<!-- 왼쪽의 이미지 -->
		<div class="image">
			<img src="images/jeju_aquarium.png" alt="제주도 한림수족관">
		</div>
		<!-- 오른쪽의 텍스트 -->
		<div class="content">
			<h2 style="font-weight: bold;">
				제주도 한림수족관 <span class="star">★</span>
			</h2>
			<h3>선재 업고 튀어</h3>
			<p>태성의 사귀자는 고백의 내막을 알게 된 솔은 태성에게 이별을 고한다. 이후, 선재와 함께 수족관을
				방문하는데...</p>
		</div>
	</div>

	<!-- 두 번째 박스 -->
	<div class="box">
		<!-- 왼쪽의 이미지 -->
		<div class="image">
			<img src="images/seoulforest.jpeg" alt="서울숲">
		</div>
		<!-- 오른쪽의 텍스트 -->
		<div class="content">
			<h2 style="font-weight: bold;">
				서울숲 <span class="star">☆</span>
			</h2>
			<h3>선재 업고 튀어</h3>
			<p>음악을 접겠다고 가출한 인혁을 찾으러 솔, 선재, 태성은 인혁이 자주 가는 산책로를 뒤따라간다.</p>
		</div>
	</div>


	<!-- 이렇게 하는 거 맞나염?????? -->
	<!-- 상세설명 길면 자르고 ... 붙히기 -->
	<%
	String seen = "";
	%>
	<%
	for (int i = 0; i < index.size(); i++) {
	%>
	<%
	if (scene.get(i).length() > 50) {
		seen = scene.get(i).substring(0, 40) + "...";
	} else {
		seen = scene.get(i);
	}
	%>

	<!-- 진짜 박스: 검색명에 대한 검색 결과! 촬영지 목록 -->
	<div class="box">
		<!-- 왼쪽의 이미지 -->
		<div class="image">
			<img src="images/seoulforest.jpeg" alt="서울숲">
		</div>
		<!-- 오른쪽의 텍스트 -->
		<div class="content">
			<h2 style="font-weight: bold;">
				<%=places.get(i)%>
				<span class="star">☆</span>
				<p><%=seen%></p>
			</h2>
			<h3><%=titles.get(i)%></h3>
			<p>음악을 접겠다고 가출한 인혁을 찾으러 솔, 선재, 태성은 인혁이 자주 가는 산책로를 뒤따라간다.</p>
		</div>
	</div>
	<%
	}
	%>






	<!-- 팀장님 -->
	<%-- <div class="container">
			<!-- 검색명에 대한 검색 결과! 촬영지 목록 -->
			<div class="row">
				<div class="col-lg-4 col-md-4">
					<div class="fh5co-blog animate-box">
						<a href="#"><img class="img-responsive"
							src="https://th.bing.com/th/id/OIP.FKwVfi4SsgnhqTDPMLoLTAHaE7?w=300&h=199&c=7&r=0&o=5&pid=1.7"
							alt=""></a>
							
							
							
						<!-- 해당 장소 사진 -->
						<div class="blog-text">
							<h3>
								<a href="" #><%=places.get(i)%></a>
							</h3>
							<!-- 장소명 -->
							<span class="posted_on"><%=titles.get(i)%></span>
							<!-- 드라마명 -->
							<span class="favorites">⭐</span>
							<!-- 즐겨찾기 -->
							<p><%=seen%></p>
							<!-- 상세줄거리 미리보기 -->
							<a href="#" class="btn btn-primary">상세보기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		%>
 --%>


	<!-- Side navigation script -->
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "50%";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>
</body>


</html>

