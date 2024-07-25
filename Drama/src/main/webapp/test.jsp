<%@page import="com.model.ContestDAO"%>
<%@page import="com.model.ContestDTO"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>contestPost</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="FreeHTML5.co" />
 
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700" rel="stylesheet">
	
 
	<link rel="stylesheet" href="css/style.css">
 
	</head>
	<body> 
  		<%
			// 글 번호 가져오기
			int num = 0;
			if (request.getParameter("num") != null){
				num = Integer.parseInt(request.getParameter("num"));
			} 

			ContestDTO dto = new ContestDAO().getView(num);
			
			// 회원 정보 확인
			MemberDTO info = (MemberDTO)session.getAttribute("info");   
		%>
		
	<!-- 공모전 게시글 작성 -->
	<div class="container">
	    <div class="row">
	        <form method="post" action="contestPostAction.jsp" enctype="multipart/form-data">
	            <table class="table table-striped" style="text-align: center; border:1px solid #f9f9f9">
	                <thead>
	                    <tr>
	                        <th style="background-color: #f9f9f9; text-align: center;">공모전 게시글 작성</th> 
	                    </tr>
	                </thead>
	                <tbody style="background-color: #f9f9f9;"> 
	                    <tr> 
	                        <td><input type="text" class="form-control" placeholder="제목을 입력해주세요." name="contestTitle" required></td>
	                    </tr> 
	                    <tr> 
	                        <td><textarea class="form-control" placeholder="내용을 입력해주세요." name="contestContent" style="height: 350px;" required></textarea></td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <label for="file">
	                                <div class="btn btn-file">
	                                    <i class="icon-camera"></i> 사진 업로드
	                                </div>
	                            </label>
	                            <input type="file" name="contestImg" id="file" style="display: none;" required>
	                        </td>							
	                    </tr> 
	                </tbody>
	            </table>
	            <input type="submit" class="btn btn-primary pull-right" value="작성">
	        </form>  
	    </div>
	</div>
		 
 	<footer id="fh5co-footer" role="contentinfo">
		<div class="container">
				  
			<div class="row copyright">
				<div class="col-md-12 text-center">
					<p>
						<small class="block">&copy; 2024 DOORIBURN. All Rights Reserved.</small> 
						<small class="block">Designed by DOORIBURN</small>
					</p>
					<p>
						<ul class="fh5co-social-icons">  
							<li><a href="#"><i class="icon-sun"></i></a></li>
							<li><a href="#"><i class="icon-cloud"></i></a></li>
						</ul>
					</p>
				</div>
			</div>

		</div>
	</footer>
 

	</body>
</html>
