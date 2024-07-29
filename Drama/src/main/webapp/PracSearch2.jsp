<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="dooriburn.com.model.MemberDTO"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>PracSearch</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/PracSearch.css">
<style>
.box .image img {
	width: 150px;
	height: 150px;
	object-fit: cover;
	margin: 0;
	display: block;
	margin-left: 10px;
	border-radius: 7px;
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

	HttpURLConnection conn = null;
	try {
		URL url = new URL(
		"http://localhost:5002/search?s_option=" + s_option + "&search=" + URLEncoder.encode(search, "UTF-8"));
		conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		int responseCode = conn.getResponseCode();
		System.out.println("GET Response Code :: " + responseCode);

		if (responseCode == HttpURLConnection.HTTP_OK) {
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String inputLine;
			StringBuilder response_data = new StringBuilder();

			while ((inputLine = in.readLine()) != null) {
		response_data.append(inputLine);
			}
			in.close();

			JSONArray jsonArray = new JSONArray(response_data.toString());

			if (jsonArray.length() > 0) {
		for (int i = 0; i < jsonArray.length(); i++) {
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			titles.add(jsonObject.optString("제목", ""));
			places.add(jsonObject.optString("장소명", ""));
			img_src.add(jsonObject.optString("img", ""));
			scene.add(jsonObject.optString("장소설명", ""));
			index.add(jsonObject.optInt("index", -1));
		}
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
		<button class="banner" onclick="location.href='Realindex.jsp'">여기가
			거기여?</button>
		<div class="menu-icon" onclick="openNav()">☰</div>
	</header>

	<div id="mySidenav" class="sidenav" style="width: 0;">
		<!-- 사이드 네비게이션 내용 -->
	</div>

	<div class="main-content">
		<form action="PracSearch2.jsp" method="get">
			<div class="search-container" style="height: 30px;">
				<select name="s_option" style="margin-right: 7px;">
					<option value="0" <%="0".equals(s_option) ? "selected" : ""%>>드라마</option>
					<option value="1" <%="1".equals(s_option) ? "selected" : ""%>>장소
						및 지역</option>
				</select> <input name="search" type="text" placeholder="검색"
					value="<%=search != null ? search : ""%>"
					style="flex-grow: 1; margin-right: 5px;">
				<button type="submit">
					<img src="<%=request.getContextPath()%>/images/search.png" alt="검색"
						style="width: 40px; height: 40px;" />
				</button>
			</div>
		</form>
	</div>

	<%
	for (int i = 0; i < index.size(); i++) {
	%>
	<%
	String seen = scene.get(i).length() > 50 ? scene.get(i).substring(0, 40) + "..." : scene.get(i);
	%>
	<div class="box">
		<div class="image"
			onclick="goToAddress(event, '<%=request.getContextPath()%>/detail.jsp?index=<%=index.get(i) + 1%>')">
			<img src="<%=img_src.get(i)%>" alt="이미지"
				onerror="handleImageError(this)">
		</div>
		<div class="content"
			onclick="goToAddress(event, '<%=request.getContextPath()%>/detail.jsp?index=<%=index.get(i) + 1%>')">
			<h2 style="font-weight: bold;"><%=places.get(i)%></h2>
			<h3><%=titles.get(i)%></h3>
			<p><%=seen%></p>
		</div>
		<button class="star-button"
			onclick="handleLikeClick(<%=index.get(i)%>, '<%=info != null ? info.getEmail() : ""%>', this)">☆</button>
	</div>
	<%
	}
	%>

	<script>
        function openNav() {
            document.getElementById("mySidenav").style.width = "50%";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
        }

        function goToAddress(event, url) {
            event.stopPropagation();
            location.href = url;
        }

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

        function handleImageError(img) {
            img.onerror = null; // 무한 루프 방지
            img.src = '<%=request.getContextPath()%>/images/no-image.png';
        }
    </script>
</body>
</html>
