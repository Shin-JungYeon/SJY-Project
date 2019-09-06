<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/member/joinForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 화면</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
<script type="text/javascript">
	function win_upload() {
		var op = "width=500, height=150, left=50, top=150";
		open("pictureimgForm.jsp", "", op);
	}
</script>
</head>
<body>
	<form action="join.me" name="f" method="post">
		<input type="hidden" name="picture" value="">  <%-- 사진 업로드 되면 value에 파일 이름 전달 받음. picture 파라미터에 값을 가지고 서버로 전달. --%>
		<table>
			<caption>MODEL2으로 구현한 회원가입</caption>
			<tr>
				<td rowspan="4" valign="bottom">
					<img src="" width="100" height="120" id="pic"><br>
					<font size="1"><a href="javascript:win_upload()">사진등록</a></font>
				</td>
				<td>아이디</td><td><input type="text" name="id"></td>
			</tr>
			<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
			<tr><td>이름</td><td><input type="text" name="name"></td></tr>
			<tr><td>성별</td>
				<td><input type="radio" name="gender" value="1" checked>남  <%-- checked : 기본 체크 설정. --%>
					<input type="radio" name="gender" value="2">여</td>
			</tr>
			<tr><td>전화번호</td>
				<td colspan="2"><input type="text" name="tel"></td></tr>
			<tr><td>이메일</td>
				<td colspan="2"><input type="text" name="email"></td></tr>
			<tr><td colspan="3"><input type="submit" value="회원가입"></td></tr>
		</table>
	</form>
</body>
</html>