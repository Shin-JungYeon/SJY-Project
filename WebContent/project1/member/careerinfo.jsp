<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
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
<title>이력 관리</title>
<link rel="stylesheet" href="${path }/css/project.css">
</head>
<body class="w3-light-grey w3-content" style="max-width:2400px">

	<nav class="w3-sidebar w3-bar-block w3-white w3-text-grey w3-collapse w3-top w3-center" style="z-index:3;width:300px;font-weight:bold" id="mySidebar"><br>
		<h3 class="w3-padding-32 w3-center"><a href="../board/main.do" style="text-decoration: none"><b>Jeang's<br>Play</b></a></h3>
		<a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-hide-large">CLOSE</a>
		<a href="info.me?id=${sessionScope.login }" onclick="w3_close()" class="w3-bar-item w3-button">정보 상세보기</a> 
	
	<%-- 관리자 --%>
	<c:if test="${mclass == 0 }">
		<a href="infoMem.me?mclass=1" onclick="w3_close()" class="w3-bar-item w3-button">일반 회원 목록</a> 
		<a href="infoMem.me?mclass=2" onclick="w3_close()" class="w3-bar-item w3-button">공연관계자 회원 목록</a>
		<a href="infoJoinReq.me" onclick="w3_close()" class="w3-bar-item w3-button">회원가입 요청 내역</a>
		<a href="infoPointReq.me" onclick="w3_close()" class="w3-bar-item w3-button">포인트 신청 내역</a>
	</c:if>
	
	<%-- 일반 회원 --%>
		<c:if test="${mclass == 1 }">
		<a href="myboardinfo.do?id=${mem.id }" onclick="w3_close()" class="w3-bar-item w3-button">작성글 관리</a> 
		<a href="pointinfo.do?id=${mem.id }" onclick="w3_close()" class="w3-bar-item w3-button">포인트 관리</a>
	</c:if>
	
	<%-- 관계자 회원 --%>
	<c:if test="${mclass == 2 }">
		<a href="myboardinfo.do?id=${mem.id }" onclick="w3_close()" class="w3-bar-item w3-button">작성글 관리</a> 
		<a href="careerinfo.do?id=${mem.id }" onclick="w3_close()" class="w3-bar-item w3-button">이력 관리</a>
	</c:if>	
	</nav>
	

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
	
	<div class="w3-center" style="margin-left:35%;margin-top:10%;">
		<div style = "margin-top: 50px; margin:auto; max-width: 1450px; min-width:700px;">
			<form action="careeraddForm.do" method="post">
				<input type="hidden" name="id" value="${param.id }">
				<table>
					<tr><th>No.</th><th>이력</th><th>수정</th><th>삭제</th></tr>
				<c:forEach var="c" items="${clist }">
					<tr><td>${c.seq }</td><td>${c.content }</td>
						<td><a href="">수정</a></td><td><a href="">삭제</a></td></tr>
				</c:forEach>
					<tr><td colspan="4" style="text-align: right"><input type="submit" value="이력 추가"></td></tr>
				</table>
			</form>
		</div>
	</div>
	
	<!-- Push down content on small screens --> 
	<div class="w3-hide-large" style="margin-top:83px"></div>

	<div class="w3-black w3-center w3-bottom w3-padding-24">Made by <a href="../board/main.do" title="W3.CSS" target="_blank" class="w3-hover-opacity">Jaeng</a></div>
	
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