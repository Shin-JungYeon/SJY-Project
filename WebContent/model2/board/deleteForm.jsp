<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/board/deleteForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ���� ȭ��</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
</head>
<body>
	<form action="delete.do" name="f" method="post">
		<input type="hidden" name="num" value="${param.num }">
		<table>
			<caption>MODEL2 �Խñ� ���� ȭ��</caption>
			<tr><td>�Խñ� ��й�ȣ</td><td><input type="password" name="pass"></td></tr>
			<tr><td colspan="2"><input type="submit" value="�Խñ� ����"></td></tr>
		</table>
	</form>
</body>
</html>