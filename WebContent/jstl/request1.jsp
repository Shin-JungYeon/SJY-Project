<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%-- /WebContent/jstl/request1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��û �Ķ���� ���� ����ϱ�</title>
</head>
<body>
	<h2>��û �Ķ���� ����</h2>
	�̸� : ${param.name }<br>
	���� : ${param.age }<br>
	���� : ${param.gender==1?"��":"��" }<br>
	��� : ${param.hobby }<br>
	����⵵ : ${param.year }<br>
	
	<h2>��û �Ķ���Ϳ� ����� ��� �� ��ȸ�ϱ�</h2>
	<h3>��� : </h3>
	<c:forEach var="h" items="${paramValues.hobby }">  <%-- param. �� ���� �� ���� ��������. paramValues. �� �Ķ������ ���� ��� �����ͼ� �迭��ü�� �������. --%>
		${h }&nbsp;&nbsp;
	</c:forEach>
	
	<h2>��� ��û �Ķ������ ��� �� ��ȸ�ϱ�(�Ķ���� �̸� ��)</h2>
	<table>
		<tr><th>�Ķ���� �̸�</th><th>�Ķ���� ��</th></tr>
		<c:forEach var="v" items="${paramValues }">  <%-- paramValues ��ü�� Map ��ü�� ��. --%>
			<tr><td>${v.key }</td>
				<td><c:forEach var="v" items="${v.value }">
						${v }&nbsp;&nbsp;
					</c:forEach>
				</td></tr>
		</c:forEach>
	</table>
</body>
</html>