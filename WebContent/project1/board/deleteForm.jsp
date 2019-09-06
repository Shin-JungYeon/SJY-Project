<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/board/deleteForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 삭제 화면</title>
<link rel="stylesheet" href="/project1/css/project.css">
</head>
<body>
	<form action="delete.do" name="f" method="post">
		<input type="hidden" name="num" value="${param.num }">
		<input type="hidden" name="bclass" value="${param.bclass }">
		<table>
			<tr><td>게시글 비밀번호</td><td><input type="password" name="pass"></td></tr>
			<tr><td colspan="2"><input type="submit" value="게시글 삭제"></td></tr>
		</table>
	</form>
</body>
</html>