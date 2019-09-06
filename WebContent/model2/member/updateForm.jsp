<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/member/updateForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 수정 화면</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
<script type="text/javascript">
	function input_check(f) {
		<c:if test="${sessionScope.login != 'admin'}">
			if(f.pass.value == "") {
				alert("비밀번호를 입력하세요.");
				f.pass.focus();
				return false;
			}
		</c:if>
		return true;
	}
	function passchg_winopen() {
		var op = "width=500, height=230, left=50, top=150";
		open("passwordForm.me", "", op);  //새로운 창 띄우기.
	}
	function win_upload() {
		var op = "windth=500, height=150, left=50, top=150";
		open("pictureimgForm.me", "", op);
	}
</script>
</head>
<body>
<%--
	update.me 의 기능.
		1. 모든 파라미터를 Member 객체에 저장.
		2. 비밀번호 검증
			- 일치 : db 수정.
				- 성공 : 성공 메세지 출력 후 main.me로 페이지 이동.
				- 실패 : 실패 메세지 출력 후 updateForm.me로 페이지 이동.
			- 불일치 : 비밀번호 오류 메세지 출력 후 updateForm.me로 페이지 이동.
			
--%>
	<form action="update.me" name="f" method="post" onsubmit="return input_check(this)">  <%-- onsubmit : 이벤트 처리 --%>
		<input type="hidden" name="picture" value="${mem.picture }">
		<table>
			<caption>MODEL2 회원 정보 수정</caption>
			<tr><td rowspan="4" valign="bottom">
					<img src="img/${mem.picture }" width="100" height="120" id="pic"><br>
					<font size="1"><a href="javascript:win_upload()">사진수정</a></font>
				</td>
				<td>아이디</td><td><input type="text" name="id" value="${mem.id }" readonly></td>  <%-- readonly : 보여주기만 하고 수정 불가능. --%>
			</tr>
			<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
			<tr><td>이름</td><td><input type="text" name="name" value="${mem.name }"></td></tr>
			<tr><td>성별</td>
				<td><input type="radio" name="gender" value="1" ${mem.gender==1?"checked":"" }>남  <%-- radio 버튼의 특성상 마지막에 체크된 것으로만 보여줌. 때문에 남에는 조건식 안써줘도 됨. --%>
					<input type="radio" name="gender" value="2" ${mem.gender==2?"checked":"" }>여</td>
			</tr>
			<tr><td>전화번호</td><td colspan="2"><input type="text" name="tel" value="${mem.tel }"></td></tr>
			<tr><td>이메일</td><td colspan="2"><input type="text" name="email" value=" ${mem.email }"></td></tr>
			<tr><td colspan="3">
					<input type="submit" value="회원수정">
					<input type="button" value="비밀번호변경" onclick="passchg_winopen()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>