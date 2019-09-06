<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- /jspStudy2/WebContent/jstl/jstlfmtEx1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����ȭ �±� ����</title>
</head>
<body>
	<h3>���� ���� ���� �����ϱ�.</h3>
	<fmt:formatNumber value="500000" type="currency" /><br>  <%-- type="currency" : �ش� ������ ȭ�� ������ ǥ��. --%>
	<fmt:setLocale value="en_US" />  <%-- ���� ������ ����. �⺻���� �츮����. --%>
	<fmt:formatNumber value="500000" type="currency" /><br>
	<fmt:setLocale value="ko_KR" />
	<fmt:formatNumber value="0.15" type="percent" /><br>
	<fmt:formatNumber value="500000.12345" pattern="###,###.00" /><br>
	
	<h3>��¥ ���� ���� �����ϱ�.</h3>
	<jsp:useBean id="today" class="java.util.Date" />
	����� : <fmt:formatDate value="${today }" type="date" /><br>
	�ú��� : <fmt:formatDate value="${today }" type="time" /><br>
	�Ͻ� : <fmt:formatDate value="${today }" type="both" /><br>
	���� ���� : <fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm:ss a E" /><br>
	�Ͻ�1 : <fmt:formatDate value="${today }" type="both" timeStyle="short" dateStyle="short" /><br>
	�Ͻ�2 : <fmt:formatDate value="${today }" type="both" timeStyle="long" dateStyle="long" /><br>
	�Ͻ�3 : <fmt:formatDate value="${today }" type="both" timeStyle="full" dateStyle="full" /><br>
	�Ͻ�4 : <fmt:formatDate value="${today }" type="both" timeStyle="full" dateStyle="full" timeZone="GMT" /><br>  <%-- �پ��� �Ӽ����� ������. �� �־�� �ϴ� �Ӽ����� ����. --%>
</body>
</html>