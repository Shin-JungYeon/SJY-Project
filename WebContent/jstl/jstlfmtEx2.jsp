<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- /jspStudy2/WebContent/jstl/jstlfmtEx2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� �±� ����2</title>
</head>
<body>
	<h3>Format �� ���ڸ� �Ϲ� ���ڷ� ����</h3>
	<fmt:parseNumber value="20,000" var="num1" pattern="##,###" />
	<fmt:parseNumber value="10,000" var="num2" pattern="##,###" />
	�� : ${num1 + num2 }<br>
	�� : <fmt:formatNumber value="${num1 + num2 }" pattern="##,###" /><br>
	
	<h3>Format �� ��¥�� �Ϲ� ��¥�� ����</h3>
	<fmt:parseDate value="2019-04-18 12:00:00" pattern="yyyy-MM-dd HH:mm:ss" var="day" />
	��¥ : ${day }<br>
	
	<h5>2019-04-18 ������ ������ ���ϱ�</h5>
	<fmt:formatDate value="${day }" pattern="yyyy-MM-dd E����" />
</body>
</html>