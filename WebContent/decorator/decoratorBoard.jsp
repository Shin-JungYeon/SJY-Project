<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<decorator:head />
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="/project1/css/project.css">
<style>
	body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif;}
	.w3-third img{margin-bottom: -6px; opacity: 0.8; cursor: pointer}
	.w3-third img:hover{opacity: 1}
	input[type=button], input[type=submit] {
		border: none;
		color: white;
		padding: 4px 10px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 14px;
	}
</style>
<title><decorator:title /></title>
<link rel="stylesheet" href="${path }/css/project.css">
</head>
<body class="w3-light-grey w3-content" style="max-width:2400px">
	<div style="float: left">
	<nav class="w3-sidebar w3-bar-block w3-white w3-text-grey w3-collapse w3-top w3-center" style="z-index:3;width:300px;font-weight:bold" id="mySidebar"><br>
		<h3 class="w3-padding-32 w3-center"><a href="../board/main.do" style="text-decoration: none"><b>Jeang's<br>Play</b></a></h3>
		<input type="text" placeholder="Search" style="width: 150px"><input type="button" value="검색" onclick=""><br><br>
		
		<a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-hide-large">CLOSE</a>
		<a href="../board/notice.do?classify=0" onclick="w3_close()" class="w3-bar-item w3-button">공지 게시판</a> 
		<a href="../board/point.do?classify=1" onclick="w3_close()" class="w3-bar-item w3-button">포인트 게시판</a> 
		<a href="../board/review.do?classify=2" onclick="w3_close()" class="w3-bar-item w3-button">리뷰 게시판</a>
		<a href="../board/information.do?classify=3" onclick="w3_close()" class="w3-bar-item w3-button">정보 게시판</a>
		<a href="../board/free.do?classify=4" onclick="w3_close()" class="w3-bar-item w3-button">자유 게시판</a>
	</nav>
</div>
	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	
<%-- <div class="w3-center" style="text-align: center; margin-top: 10%;"><decorator:body /></div>  --%>
	<div class="w3-center" style="margin-left:300px;margin-top:50px;">
		<div style = "margin-top: 50px; margin:auto; max-width: 1450px; min-width:700px;">
   			<decorator:body/>
		</div>
	</div>
	<%-- <div class="w3-center w3-container" style="margin-top: 8%;">
		<decorator:body />  이 테두리를 사용하는 페이지의 <body> 부분 사용.
	</div> --%>

	<!-- Push down content on small screens --> 
	<div class="w3-hide-large" style="margin-top:83px"></div>

	<div class="w3-black w3-center w3-bottom w3-padding-24">Made by <a href="../board/main.jsp" title="W3.CSS" target="_blank" class="w3-hover-opacity">Jaeng</a></div>

	<script>
	// Script to open and close sidebar
	function w3_open() {
		document.getElementById("mySidebar").style.display = "block";
		document.getElementById("myOverlay").style.display = "block";
	}

	function w3_close() {
		document.getElementById("mySidebar").style.display = "none";
		document.getElementById("myOverlay").style.display = "none";
	}
	</script>
</body>
</html>