<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Like List</title>
</head>
<body>
	<h1>찜 목록</h1>
	<table border="1">
		<tr>
			<th>Like Number</th>
			<th>Film Number</th>
			<th>Like Date</th>
			<th>Action</th>
		</tr>
		<c:forEach var="like" items="${likes}">
			<tr>
				<td>${like.likeNum}</td>
				<td>${like.filmNum}</td>
				<td>${like.likeDate}</td>
				<td>
					<form action="FilmLike" method="post">
						<input type="hidden" name="filmNum" value="${like.filmNum}">
						<button type="submit" style="background-color: red;"
							id="unlikeButton">Unlike</button>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>

	<h2>다른 드라마 좋아요</h2>
	<!-- 다른 드라마 대한 좋아요 기능 추가 -->
	<form action="FilmLike" method="post">
		<label for="filmNum">Film Number:</label> <input type="text"
			id="filmNum" name="filmNum">
		<button type="submit" id="likeButton">Like</button>
	</form>
</body>
</html>
