<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%-- /WebContent/project1/member/joinForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
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
<title>ȸ������</title>
<link rel="stylesheet" href="${path }/css/project.css">
<script type="text/javascript">
	function joinGen() {
		document.f.mclass.value = 1;
		document.f.action = "joinGenForm.do";
		document.f.submit();
	}
	function joinCon() {
		document.f.mclass.value=2;
		document.f.action = "joinConForm.do";
		document.f.submit();
	}
</script>
</head>
<body class="w3-light-grey w3-content" style="max-width:2400px">

	<div class="w3-center" style="margin-top:200px; margin-left: 40%;">
		<div style="margin-top: 50px; margin:auto; max-width: 1450px; min-width:700px;">
			<form action="" name="f" method="post">
				<input type="hidden" name="mclass" value="">
				<table class="joinform" style="width: 30%;">
					<tr><td colspan="2"><h3>ȸ�������� ȯ���մϴ�.<br>ȸ�� ������ ������ �ּ���.</h3></td>
					<tr><td><input type="button" value="�Ϲ� ȸ������" onclick="joinGen()"></td>
						<td><input type="button" value="������ ȸ������" onclick="joinCon()"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: left;">
							<font size="3">! ȸ������ �� ���ǻ���</font>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: left;">
							<font size="2">���� ������ ȸ������ �� �������� ������ �ʿ��ϹǷ�<br>���ԿϷ���� �ִ� 2���� �ð��� �ҿ�� �� �ֽ��ϴ�.</font>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- Push down content on small screens --> 
	<div class="w3-hide-large" style="margin-top:83px"></div>
	<div class="w3-black w3-center w3-bottom w3-padding-24">Made by <a href="../board/main.do" title="W3.CSS" target="_blank" class="w3-hover-opacity">Jaeng</a></div>
</body>
</html>