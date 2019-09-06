<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/member/info.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ����</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
</head>
<body>
	<table>
		<caption>MODEL2 ȸ�� ���� ����</caption>
		<tr>
			<td rowspan="6">
				<img src="img/${mem.picture }" width="100" height="120">
			</td>
			<td>���̵�</td><td>${mem.id }</td>
		</tr>
		<tr><td>�̸�</td><td>${mem.name }</td></tr>
		<tr><td>����</td><td>${mem.gender==1?"����":"����" }</td></tr>
		<tr><td>��ȭ��ȣ</td><td>${mem.tel }</td></tr>
		<tr><td>�̸���</td><td>${mem.email }</td></tr>
		<tr><td colspan="2">
				<a href="updateForm.me?id=${mem.id }">[����]</a>
				<c:if test="${mem.id != 'admin' }">
					<a href="deleteForm.me?id=${mem.id }">[Ż��]</a>
				</c:if>
			</td>
		</tr>
	</table>
</body>
</html>