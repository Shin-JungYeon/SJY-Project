<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="/project1/css/project.css">
<style>
	body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif; font-size: auto;}
	.w3-third img{margin-bottom: -6px; opacity: 0.8; cursor: pointer}
	.w3-third img:hover{opacity: 1}
	img {width="100"; height="120"}
	input[type=button], input[type=submit] {
		border: none;
		color: white;
		padding: 4px 10px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 14px;
	}
	.login > tr > td {
	 	border-bottom: 10px;
	}
</style>
<title>쟁's 플레이</title>
</head>
<body class="w3-light-grey w3-content" style="max-width:2400px">

	<%-- 홈페이지 로고 --%>
	<div class="main w3-left" id="logo" style="margin: 0 0 0 30px;">
		<h5 class="w3-padding-32 w3-center"><a href="../board/main.do" style="text-decoration: none"><b>Jeang's<br>Play</b></a></h5>
	</div>
	
	<%-- 로그인 --%>
	<div class="main w3-padding-32 w3-right" style="margin: 0 30px 0 0;">
		<c:if test="${!empty sessionScope.login }">
			<table style="width: 285px;">
				<tr><td rowspan="2"><img src="../member/img/${mem.picture }" style="width: 75px; height: 75px;"></td><td>${sessionScope.login } 님</td>
				<td><a href="../member/info.me?id=${sessionScope.login }">내 정보</a></td></tr>
				<tr><td></td><td><a href="logout.do">로그아웃</a></td></tr>
			</table>
		</c:if>
		<c:if test="${empty sessionScope.login }">
			<form action="login.do" name="f_login" method="post">
				<table class="login">
					<tr><td><input type="text" name="id" placeholder="아이디" style="width: 160px"></td></tr>
					<tr><td><input type="password" name="pass" placeholder="비밀번호" style="width: 160px"></td><td colspan="2"><input type="submit" value="로그인"></td></tr>
					<tr><td></td><td><a href="../member/joinForm.jsp">회원가입</a></td></tr>
				</table>
			</form>
		</c:if>
	</div>
	
	<%-- 메뉴 --%>
	<header id="menu">
		<div class="w3-container w3-center">
			<div class="w3-section w3-bottombar w3-padding-16 w3-center" style="width: 1000px; margin:auto;">
				<a href="boardlist.do?bclass=0"><button class="w3-button w3-light-grey">NOTICE</button></a>
				<a href="boardlist.do?bclass=1"><button class="w3-button w3-light-grey">POINT</button></a>
				<a href="boardlist.do?bclass=2"><button class="w3-button w3-light-grey">REVIEW</button></a>
				<a href="boardlist.do?bclass=3"><button class="w3-button w3-light-grey">INFORMATION</button></a>
				<a href="boardlist.do?bclass=4"><button class="w3-button w3-light-grey">FREE</button></a>
			</div>
		</div>
	</header>
	<br>
	
	<%-- 정보 게시판에 올라온 포스터. 누르면 해당 공연 정보 게시물로 이동. --%>
	<div class="w3-container w3-center margin_auto" style="margin-top: 44px; height: 300px;"> 
      <div>
		<c:forEach var="il" items="${infolist }"  begin="1" end="5">
			<span><a href="information.do?num=${il.num }"><img src="file/${il.file }" width="130" height="180" class="Home_img"></a></span>
		</c:forEach>
		</div>
	</div>
	<br>
	
	<%-- 리뷰 모아보기 : 가입 시 받았던 관심장르의 리뷰 우선으로 보여주기(로그인 정보 필요하겠지). --%>
	<div class="main" id="reviewall" class="leftcolumn" style="margin-left: 20%;">
		<table style="width: 30%; background-color: white;">
			<tr><th>제목</th><th>작성자</th><th>추천수</th><th>조회수</th></tr>
		<c:forEach var="rl" items="${reviewlist }" begin="1" end="10">
			<tr><td><a href="review.do?num=${rl.num }" style="text-decoration: none;">${rl.subject }</a></td>
				<td>${rl.id }</td>
				<td>${rl.likecnt }</td>
				<td>${rl.readcnt }</td></tr>
		</c:forEach>
		</table>
	</div>
	
	<%-- 오른쪽 하단 내용. 뭐 넣지.. --%>
	<div class="main" class="rightcolumn"></div>
	
	<%-- 예매 사이트 연결 배너 --%>
	<div class="main" id="booklink">
		<a href="http://ticket.interpark.com/DramaIndex.asp"><img src=""></a><br>
		<a href=""><img src=""></a><br>
		<a href=""><img src=""></a>
	</div>
</body>
</html>