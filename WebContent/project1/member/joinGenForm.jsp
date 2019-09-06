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
	table, th, tr, td {
		border: 1px;
	}
</style>
<title>일반 회원가입</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function win_upload() {
		var op = "width=500, height=150, left=50, top=150";
		open("imgUploadForm.jsp", "", op);
	}
</script>
</head>
<body class="w3-light-grey w3-content" style="max-width:2400px">
	<div class="w3-center" style="margin-top:120px;">
	<div>
		<div style="text-align: left; margin-left:250px;">일반 회원가입</div>
		<form action="joinGen.do" name="f" method="post">
			<input type="hidden" name="mclass" value="${param.mclass }">
			<input type="hidden" name="picture" value="">
			<table style="width: 25%; height: 600px; margin-left: 38%; background-color: white; border-radius: 8%;">
				<tr><td colspan="2">
						<img src="img/default.png" width="100" height="120" id="pic"><br>
						<font size="1"><a href="javascript:win_upload()">[사진등록]</a></font></td></tr>
				<tr>
					<td colspan="2"><input type="text" name="id" id="id" placeholder="ID" style="width: 200px;"> <input type="button" value="중복확인" id="idchk"></td>
				</tr>
			<tr><td colspan="2"><input type="password" name="pass" id="pass" placeholder="Password" style="width: 280px;"></td></tr>
			<tr><td id="passworn" colspan="2"></td></tr>
			<tr><td colspan="2"><input type="text" name="name" placeholder="Name" style="width: 280px;"></td></tr>
			<tr>
				<td colspan="2"><input type="radio" name="gender" value="1" checked>남
					<input type="radio" name="gender" value="2">여</td>
			</tr>
			<tr><td colspan="2"><input type="text" name="tel" placeholder="Phone Number" style="width: 280px;"></td></tr>
			<tr><td colspan="2"><input type="text" name="email" placeholder="E-mail" style="width: 280px;"></td></tr>
			<tr>
				<td colspan="2"><input type="text" name="nick" id="nick" placeholder="Nick Name" style="width: 200px;"> <input type="button" value="중복확인" id="nickchk"></td>
			</tr>
			<tr><td colspan="2">관심장르</td></tr>
			<tr>
				<td style="text-align: left; padding-left: 120px;"><input type="checkbox" name="genre" value="로맨스">로맨스</td>
				<td style="text-align: left"><input type="checkbox" name="genre" value="코미디">코미디</td>
			</tr>
			<tr>
				<td style="text-align: left; padding-left: 120px;"><input type="checkbox" name="genre" value="공포">공포</td>
				<td style="text-align: left"><input type="checkbox" name="genre" value="드라마">드라마</td>
			</tr>
			<tr>
				<td style="text-align: left; padding-left: 120px; width: 250px"><input type="checkbox" name="genre" value="판타지">판타지</td>
				<td style="text-align: left"><input type="checkbox" name="genre" value="추리스릴러">추리스릴러</td>
			</tr>
			<tr><td colspan="2"><input type="submit" value="가입"></td></tr>
			</table>
		</form>
	</div>
	</div>
	<div id="message"></div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#idchk").click(function() {
				if($("#id").val()=="") {
					alert("아이디를 입력하세요.");
				} else {
					var data = "id=" + $("#id").val();
					$.ajax({
						url : "overlapChk.jsp",
						type : "post",
						data : data,
						success : function(data) {
							$("#message").html(data);
							if($("h3").is(".idchk")) {
								$("#id").val("");
								alert("존재하는 아이디 입니다.");
							} else {
								alert("사용가능한 아이디 입니다.");
							}
						},
						error : function(xhr) {
							alert("서버오류 : " + xhr.status);
						}
					})
				}
			})

			$("#nickchk").click(function() {
				if($("#nick").val()=="") {
					alert("닉네임을 입력하세요.");
				} else {
					var data = "nick=" + $("#nick").val();
					$.ajax({
						url : "overlapChk.jsp",
						type : "post",
						data : data,
						success : function(data) {
							$("#message").html(data);
							if($("h3").is(".nickchk")) {
								$("#nick").val("");
								alert("존재하는 닉네임 입니다.");
							} else {
								alert("사용가능한 닉네임 입니다.");
							}
						},
						error : function(xhr) {
							alert("서버오류 : " + xhr.status);
						}
					})
				}
			})
			
			$("#pass").keyup(function() {
				if($("#pass").val().length < 6) {
					$("#passworn").html("<font size='2' color='red'>비밀번호를 6자리 이상으로 입력하세요.</font>");
				} else {
					$("#passworn").html("");
				}
			})
		})
		
	</script>
	<!-- Push down content on small screens --> 
	<div class="w3-hide-large" style="margin-top:83px"></div>
	<div class="w3-black w3-center w3-bottom w3-padding-24">Made by <a href="../board/main.do" title="W3.CSS" target="_blank" class="w3-hover-opacity">Jaeng</a></div>
</body>
</html>