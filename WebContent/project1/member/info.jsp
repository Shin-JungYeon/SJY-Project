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
<title>�� ����</title>
<link rel="stylesheet" href="${path }/css/project.css">
</head>
<body class="w3-light-grey w3-content" style="max-width:2400px">

	<nav class="w3-sidebar w3-bar-block w3-white w3-text-grey w3-collapse w3-top w3-center" style="z-index:3;width:300px;font-weight:bold" id="mySidebar"><br>
		<h3 class="w3-padding-32 w3-center"><a href="../board/main.do" style="text-decoration: none"><b>Jeang's<br>Play</b></a></h3>
		<a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-hide-large">CLOSE</a>
		<a href="info.me?id=${sessionScope.login }" onclick="w3_close()" class="w3-bar-item w3-button">���� �󼼺���</a> 
	
	<%-- ������ --%>
	<c:if test="${mclass == 0 }">
		<a href="infoMem.me?mclass=1" onclick="w3_close()" class="w3-bar-item w3-button">�Ϲ� ȸ�� ���</a> 
		<a href="infoMem.me?mclass=2" onclick="w3_close()" class="w3-bar-item w3-button">���������� ȸ�� ���</a>
		<a href="infoJoinReq.me" onclick="w3_close()" class="w3-bar-item w3-button">ȸ������ ��û ����</a>
		<a href="infoPointReq.me" onclick="w3_close()" class="w3-bar-item w3-button">����Ʈ ��û ����</a>
	</c:if>
	
	<%-- �Ϲ� ȸ�� --%>
		<c:if test="${mclass == 1 }">
		<a href="myboardinfo.do?id=${mem.id }" onclick="w3_close()" class="w3-bar-item w3-button">�ۼ��� ����</a> 
		<a href="pointinfo.do?id=${mem.id }" onclick="w3_close()" class="w3-bar-item w3-button">����Ʈ ����</a>
	</c:if>
	
	<%-- ������ ȸ�� --%>
	<c:if test="${mclass == 2 }">
		<a href="myboardinfo.do?id=${mem.id }" onclick="w3_close()" class="w3-bar-item w3-button">�ۼ��� ����</a> 
		<a href="careerinfo.do?id=${mem.id }" onclick="w3_close()" class="w3-bar-item w3-button">�̷� ����</a>
	</c:if>	
	</nav>
	

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
	
	<div class="w3-center" style="margin-left:300px;margin-top:50px;">
		<div style="margin-top: 50px; margin:auto; max-width: 1450px; min-width:700px;">
		<table  style="width: 20%; margin-left: 38%; margin-top: 200px;">
			<tr><td colspan="2"><img src="img/${mem.picture }" width="100" height="120"></td></tr>
			<tr><td>ID</td><td colspan="2">${mem.id }</td></tr>
			<tr><td>Name</td><td colspan="2">${mem.name }</td></tr>
			<tr><td>Gender</td><td colspan="2">${mem.gender==1?"����":"����" }</td></tr>
			<tr><td>Phone Number</td><td colspan="2">${mem.tel }</td></tr>
			<tr><td>E-mail</td><td colspan="2">${mem.email }</td></tr>
		<c:if test="${mem.mclass != 0 }">
			<tr><td>Nick Name</td><td colspan="2">${mem.nick }</td></tr>
		</c:if>
		<c:if test="${mem.mclass==1 }">
			<tr><td>Prefer Genre</td>
				<td>${mem.genre }</td>
			</tr>
		</c:if>
			<tr><td colspan="2"><a href="updateForm.me?id=${mem.id }"><input type="button" value="���� ����"></a>
					<a href="deleteForm.me?id=${mem.id }"><input type="button" value="ȸ�� Ż��"></a></td>
			</tr>
		</table>
		
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