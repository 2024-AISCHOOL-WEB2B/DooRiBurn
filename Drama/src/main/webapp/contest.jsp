<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	 --%>
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link rel="stylesheet" href="contest.css">

    <link href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700' rel='stylesheet'
        type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style type="text/css">
        * {
            font-family: "IBM Plex Sans KR", sans-serif;
            font-weight: 400;
            font-style: normal;
        }
    </style>
</head>

<body>
    <div class="container">
        <header class="header">
            <h1>공모전</h1>
            <div class="search-container">
                <input type="text" placeholder="검색어를 입력해 주세요.">
                <button type="button">🔍</button>
            </div>
        </header>
        <main class="main">
            <div class="announcement">
                <div class="announcement-item">공지</div>
                <div class="announcement-content">공모전 게시판 이용약관 개정 안내</div>
            </div>
            <div class="announcement">
                <div class="announcement-item">공지</div>
                <div class="announcement-content">공모전 게시판 가이드 (2024.07 개정)</div>
            </div>
            <div class="announcement">
                <div class="announcement-item">공지</div>
                <div class="announcement-content">2024 전남 촬영지 공모전 안내</div>
            </div>
            <ul class="post-list">
                <li class="post-item"><span>7</span>화순전남대병원 &lt;구미호 외전&gt;</li>
                <li class="post-item"><span>6</span>여수 돌산대교 &lt;열혈사제&gt;</li>
                <li class="post-item"><span>5</span>순천 드라마세트장 &lt;제빵왕 김탁구&gt;</li>
                <li class="post-item"><span>4</span>나주 영상 테마파크 &lt;주몽&gt;</li>
                <li class="post-item"><span>3</span>담양 레이나CC &lt;꽃보다 남자&gt;</li>
                <li class="post-item"><span>2</span>곡성 한옥마을 &lt;도깨비&gt;</li>
                <li class="post-item"><span>1</span>광양 매화마을 &lt;다모&gt;</li>
            </ul>
            <div class="pagination">
                <button>&laquo;</button>
                <button>&lsaquo;</button>
                <button class="active">1</button>
                <button>2</button>
                <button>3</button>
                <button>&rsaquo;</button>
                <button>&raquo;</button>
            </div>
        </main>
    </div>
</body>

</html>
