<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/board/deleteForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ���� ȭ��</title>
<link rel="stylesheet" href="/project1/css/project.css">
</head>
<body>
	<form action="delete.do" name="f" method="post">
		<input type="hidden" name="num" value="${param.num }">
		<input type="hidden" name="bclass" value="${param.bclass }">
		<table>
			<tr><td>�Խñ� ��й�ȣ</td><td><input type="password" name="pass"></td></tr>
			<tr><td colspan="2"><input type="submit" value="�Խñ� ����"></td></tr>
		</table>
	</form>
</body>
</html>