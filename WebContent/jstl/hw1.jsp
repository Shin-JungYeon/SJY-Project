<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- /jspStudy2/WebContent/jstl/hw1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jstl ����</title>
</head>
<body>
	<fmt:requestEncoding value="euc-kr" />
	<form method="post" name="f">
		x : <input type="text" name="x" value="${param.x }"><br>
		y : <input type="text" name="y" value="${param.y }"><br>
		<input type="submit" value="���ϱ�">
	</form><p>
	�հ� : <c:out value="${param.x + param.y }" /><br>
	
	<h3>jstl if �±� ����Ͽ� ����ϱ�</h3>
	<c:if test="${param.x + param.y > 0 }">
		<h4>����Դϴ�.</h4>
	</c:if>
	<c:if test="${param.x + param.y < 0 }">
		<h4>�����Դϴ�.</h4>
	</c:if>
	<c:if test="${param.x + param.y == 0 }">
		<h4>0 �Դϴ�.</h4>
	</c:if>
	
	<h3>jstl choose �±� ����Ͽ� ����ϱ�</h3>
	<c:choose>
		<c:when test="${param.x + param.y > 0 }">
			<h4>����Դϴ�.</h4>
		</c:when>
		<c:when test="${param.x + param.y < 0 }">
			<h4>�����Դϴ�.</h4>
		</c:when>
		<c:otherwise>
			<h4>0 �Դϴ�.</h4>
		</c:otherwise>
	</c:choose>
	
</body>
</html>