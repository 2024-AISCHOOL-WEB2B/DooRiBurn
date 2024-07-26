<%-- <%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page
	import="java.io.*, java.net.*, org.json.JSONArray, org.json.JSONObject"%>


<%@page import="com.model.MemberDTO"%> --%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> --%>

<!-- ------- 7/25 오후 7:17 위 주석 처리 -->



<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<!-- 추가된 부분 -->

<%@page import="com.model.MemberDTO"%>





<!DOCTYPE HTML>
<html lang="ko">
<html>
<head>
<meta charset="UTF-8">
<title>PracSearch</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
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

<link rel="stylesheet" href="css/PracSearch.css">


<style>
.box .image img {
	width: 150px;
	height: 150px;
	object-fit: cover;
	margin: 0; /* 이미지의 여백 제거 */
	display: block; /* 이미지 중앙 정렬 */
	margin-left: 10px;
	border-radius: 7px;
}

.star-button {
	background: none;
	border: none;
	font-size: 24px;
	cursor: pointer;
	color: black; /* 기본 별 색상 */
	margin-bottom: 170px;
}

.star-button.liked {
	color: gold; /* 좋아요 클릭 시 별 색상 */
}

.star-button:focus {
	outline: none;
}
</style>


</head>
<body>

	<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	String s_option = request.getParameter("s_option");
	String search = request.getParameter("search");

	List<String> titles = new ArrayList<>();
	List<String> img_src = new ArrayList<>();
	List<String> places = new ArrayList<>();
	List<String> scene = new ArrayList<>();
	List<Integer> index = new ArrayList<>();
	// Flask 서버로 데이터를 전송합니다.
	HttpURLConnection conn = null;
	try {
		// Flask 서버의 URL 설정
		URL url = new URL(
		"http://localhost:5002/search?s_option=" + s_option + "&search=" + URLEncoder.encode(search, "UTF-8"));
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
			// img_src.add(jsonObject.getString("img"));
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
		<!-- 배너 및 메뉴 -->
		<button class="banner" onclick="location.href='Realindex.jsp'">여기가
			거기여?</button>
		<div class="menu-icon" onclick="openNav()">☰</div>
	</header>

	<div id="mySidenav" class="sidenav" style="width: 0;">
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

	<!-- 검색 -->
	<div class="main-content">
		<form action="PracSearch2.jsp" method="get">
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
		<div class="image"
			onclick="goToAddress('http://localhost:8082/Drama/detail.jsp?index=<%=index.get(i) + 1%>')">
			<img src="" alt="서울숲" style="width: 200px">
		</div>
		<!-- 오른쪽의 텍스트 -->
		<div class="content"
			onclick="goToAddress('http://localhost:8082/Drama/detail.jsp?index=<%=index.get(i) + 1%>')">
			<h2 style="font-weight: bold;">
				<%=places.get(i)%>

			</h2>
			<h3><%=titles.get(i)%></h3>
			<p><%=seen%></p>
		</div>
		<button class="star-button"
			onclick="handleLikeClick(<%=index.get(i)%>, '<%=info.getEmail()%>', this)">☆</button>
	</div>
	<%=info.getEmail()%>

	<%
	}
	%>

	<!-- Side navigation script -->
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "50%";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>
	<script>
		function goToAddress(url) {
			location.href = url;
		}
	</script>

	<script>
    function handleLikeClick(filmId,email,button) {
        $.ajax({
            type: 'POST',
            url: 'FilmLikeService',
            data: { 
            	f_num: filmId,
            	email: email
            },
            success: function(response) {
                console.log('좋아요 처리 성공:', response);
                // 버튼의 색상을 변경하여 좋아요 상태를 나타냅니다.
               /*  if (button.textContent === '★'){
                	button.textContent = '☆';
                } else {
                	button.textContent = '★';
                }
                 */
                
                if (button.classList.contains('liked')) {
                    button.classList.remove('liked');
                } else {
                    button.classList.add('liked');
                }
            },
            error: function(xhr, status, error) {
                console.error('좋아요 처리 오류:', error);
            }
        });
    }
    </script>
</body>


</html>

