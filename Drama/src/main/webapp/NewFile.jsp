<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search and Rankings</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <nav>
            <div class="menu-icon">&#9776;</div>
        </nav>
    </header>
    <main>
        <div class="search-container">
            <input type="text" placeholder="지역 또는 드라마 명을 검색하세요.">
            <button type="submit"><i class="search-icon">&#128269;</i></button>
        </div>
        <section class="ranking">
            <div class="rank-item">
                <div class="rank-num">1</div>
                <div class="rank-text">선재 업고 튀어</div>
            </div>
            <div class="rank-item">
                <div class="rank-num">2</div>
                <div class="rank-text">광주</div>
            </div>
            <div class="rank-item">
                <div class="rank-num">3</div>
                <div class="rank-text">눈물의 여왕</div>
            </div>
            <div class="rank-item">
                <div class="rank-num">4</div>
                <div class="rank-text">제주도</div>
            </div>
            <div class="rank-item">
                <div class="rank-num">5</div>
                <div class="rank-text">전주</div>
            </div>
        </section>
        <section class="intro">
            <h2 class="highlight">선재 업고 튀어에 나온 그 장소!</h2>
            <h2 class="highlight">나도 가 볼까?</h2>
            <div class="intro-images">
                <img src="images/jeju_aquarium.png" alt="Place 1">
                <img src="images/jeonju_hanok_village.jpg" alt="Place 2">
                <img src="images/seoulforest.jpeg" alt="Place 3">
            </div>
        </section>
        <footer>
            <button class="btn">로그인</button>
            <button class="btn">회원가입</button>
            <button class="btn">한국어</button>
            <button class="btn">English</button>
        </footer>
    </main>
    <script src="script.js"></script>
</body>
</html>
