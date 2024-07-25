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
      
   Website:       http://freehtml5.co/
   Email:          info@freehtml5.co
   Twitter:       http://twitter.com/fh5co
   Facebook:       https://www.facebook.com/fh5co

   //////////////////////////////////////////////////////
    -->

<!-- Facebook and Twitter integration -->

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Search</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by FreeHTML5.co" />
<meta name="keywords"
	content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="FreeHTML5.co" />


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

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Theme style  -->
<link rel="stylesheet" href="css/style2.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
   <script src="js/respond.min.js"></script>
   <![endif]-->



</head>
<body>

	<!-- flask   -->
<body>
	<%
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
		URL url = new URL("http://localhost:5002/search?s_option=" + s_option + "&search=" + URLEncoder.encode(search, "UTF-8"));
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
		<header id="fh5co-header" class="fh5co-cover" role="banner"
			style="background-image: url(images/black.jpg);">
				<div class="container">
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
	




 	   <header id="fh5co-header" class="fh5co-cover" role="banner" style="background-image:url(images/img_bg_2.jpg);">
      <div class="overlay"></div>
      <div class="container">
         <div class="row">
            <div class="col-md-10 col-md-offset-1 text-center">
               <div class="display-t" >
                  <div class="display-tc animate-box" data-animate-effect="fadeIn" > 
                     <div class="row">
                        <form class="form-inline" id="fh5co-header-subscribe">
                           <div class="col-md-6 col-md-offset-3">
                              <div class="form-group">
                                 <input type="text" class="form-control" id="email" >
                                 <button type="submit" class="btn btn-default">검색</button>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </header>


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



		<div class="container">
			<!-- 검색명에 대한 검색 결과! 촬영지 목록 -->
			<div class="row">
				<div class="col-lg-4 col-md-4">
					<div class="fh5co-blog animate-box" >
						<img class="img-responsive"
							src="https://th.bing.com/th/id/OIP.FKwVfi4SsgnhqTDPMLoLTAHaE7?w=300&h=199&c=7&r=0&o=5&pid=1.7"
							alt="">
						<!-- 해당 장소 사진 -->
						<div class="blog-text" onclick="goToAddress('http://localhost:8082/Drama/detail.jsp?index=<%= index.get(i)+1%>')">
							<h3>
								<%=places.get(i)%>
							</h3>
							<!-- 장소명 -->
							<span class="posted_on"><%=titles.get(i)%></span>
							<!-- 드라마명 -->
							<span class="favorites">⭐</span>
							<!-- 즐겨찾기 -->
							<p><%=seen%></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		%>
	<ul id="results"></ul>
	<footer id="fh5co-footer" role="contentinfo">
		<div class="container">

			<div class="row copyright">
				<div class="col-md-12 text-center">
					<p>
						<small class="block">&copy; 2024 DOORIBURN. All Rights
							Reserved.</small> <small class="block">Designed by DOORIBURN</small>
					</p>
					<ul class="fh5co-social-icons">
						<li><a href="#"><i class="icon-sun"></i></a></li>
						<li><a href="#"><i class="icon-cloud"></i></a></li>
					</ul>
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
	<script src="js/main.js"></script>
	
	 <script>
        function goToAddress(url) {
            location.href = url;
        }
    </script>

</body>
</html>

