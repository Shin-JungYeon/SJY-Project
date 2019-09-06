<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/member/deleteForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 탈퇴</title>
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
</head>
<body class="w3-light-grey w3-content" style="max-width:2400px">
<div class="w3-center" style="margin-left:40%;margin-top:10%;">
		<div style="margin-top: 350px; margin:auto; max-width: 1450px; min-width:700px;">
	<form name="f" action="delete.me" method="post">
		<input type="hidden" name="id" value="${param.id }">
		<table>
			<tr><td>비밀번호</td>
				<td><input type="password" name="pass"></td><td colspan="2"><input type="submit" value="회원 탈퇴"></tr>
		</table>
	</form>
	</div></div>
</body>
</html>