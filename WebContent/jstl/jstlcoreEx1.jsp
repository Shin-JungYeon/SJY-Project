<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /jspStudy2/WebContent/jstl/jstlcoreEx1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL core �±� ���� : �ݵ�� taglib ���þ� ǥ���ؾ� ��.</title>
</head>
<body>
	<h3>�Ӽ� ���� �±� : set, remove, out �±�</h3>
	<%-- c : taglib���� prefix�� ������ �̸�. ������ uri�� ����� ��. set(remove, out)�� �� �ȿ� �ִ� �±���. --%>
	<c:set var="test" value="${'Hello JSTL' }" />  <%-- test��� �̸��� �Ӽ����� ���. --%>
	test �Ӽ� : <c:out value="${test }" /><br>
<%--
	<c:set var="test" value="${'Hello JSTL' }" scope="session" />
	test �Ӽ� : ${sessionScope.test }<br>
	
	������ Ȯ���� �� scope ��������.
--%>
	test �Ӽ� : ${test }<br>
	<c:remove var="test"/>
	test �Ӽ� : ${test }<br>
	
	<h3>���ǹ� ���� �±� : if, choose �±�</h3>
	<c:if test="${5 < 10 }">  <%-- else if �±״� ����. choose�±� ����ؾ���. --%>
		<h4>5�� 10���� �۴�.</h4>
	</c:if>
	<c:if test="${6+3 != 10 }">
		<h4>6+3�� 10�� �ƴϴ�.</h4>
	</c:if>
	
	<c:choose>  <%-- choose �±� ���� when �±��� ���ǿ� �´� ���� ���. else if �� ���� ����. otherwise�� else. --%>
		<c:when test="${5+10==25 }">
			<h4>5 + 10 = 25 </h4>
		</c:when>
		<c:when test="${5+10==15 }">
			<h4>5 + 10 = 15 </h4>
		</c:when>
		<c:when test="${5+10==510 }">
			<h4>5 + 10 = 510 </h4>
		</c:when>
		<c:otherwise>
			<h4>5 + 10 = ��. </h4>
		</c:otherwise>
	</c:choose>
	
</body>
</html>