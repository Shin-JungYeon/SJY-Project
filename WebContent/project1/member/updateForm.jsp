<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/project1/member/updateForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 수정</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function input_check(login) {
		if(login != 'admin'){
			if(document.f.pass.value == "") {
				alert("비밀번호를 입력하세요.");
				document.f.pass.focus();
				return false;
			}
			return true;
		}
		return true;
	}
	function win_upload() {
		var op = "width=500, height=150, left=50, top=150";
		open("imgUploadForm.jsp", "", op);
	}
	function passchg_winopen() {
		var op = "width=500, height=230, left=50, top=150";
		open("passwordForm.me", "", op);  //새로운 창 띄우기.
	}
</script>
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
<body class="w3-light-grey w3-content" style="max-width:2400px">
	<div class="w3-center" style="margin-top:120px;">
	<form action="update.me" method="post" name="f" onsubmit="return input_check('${sessionScope.login}')">
		<input type="hidden" name="picture" value="${mem.picture }">
		<input type="hidden" name="mclass" value="${mem.mclass }">
		<table style="width: 25%; height: 600px; margin-left: 38%; background-color: white; border-radius: 8%;">
			<tr>
				<td colspan="2">
					<img src="img/${mem.picture }" width="100" height="120" id="pic"><br>
					<font size="1"><a href="javascript:win_upload()">[사진등록]</a></font>
				</td>
			</tr>
			<tr><td colspan="2"><input type="text" name="id" value="${mem.id }" readonly style="width: 280px;"></td></tr>
			<tr><td colspan="2"><input type="password" name="pass" placeholder="password" style="width: 280px;"></td></tr>
			<tr><td colspan="2"><input type="text" name="name" value="${mem.name }" style="width: 280px;"></td></tr>
			<tr>
				<td colspan="2">
					<span><input type="radio" name="gender" value="1" ${mem.gender==1?"checked":"" }>남</span>
					<span><input type="radio" name="gender" value="2" ${mem.gender==2?"checked":"" }>여</span>
				</td>
			</tr>
			<tr><td colspan="2"><input type="text" name="tel" value="${mem.tel }" style="width: 280px;"></td></tr>
			<tr><td colspan="2"><input type="email" name="email" value="${mem.email }" style="width: 280px;"></td></tr>
			
		<c:if test="${mem.mclass != 0 }">
			<tr>
				<td colspan="2"><input type="text" name="nick" id="nick" value="${mem.nick }" style="width: 200px;"> <input type="button" value="중복확인" id="nickchk"></td>
			</tr>		
		</c:if>
		
		<c:if test="${mem.mclass == 1 and sessionScope.login != 'admin' }">
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
		</c:if>
			<tr><td colspan="2"><input type="button" value="비밀번호 변경" onclick="passchg_winopen()"> <input type="submit" value="수정"></td></tr>
		</table>
	</form>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#nickchk").click(function() {
				var data = "nick=" + $("#nick").val();
				$.ajax({
					url : "overlapChk.jsp",
					type : "post",
					data : data,
					success : function(data) {
						$("#message").html(data);
						if($("h3").is(".nickchk")) {
							$("#nick").val("");
							alert("존재하는 닉네임 입니다. 다시 입력해주세요.");
						} else {
							alert("사용가능한 닉네임 입니다.");
						}
					},
					error : function(xhr) {
						alert("서버오류 : " + xhr.status);
					}
				})
			})
		})
	</script>
</body>
</html>