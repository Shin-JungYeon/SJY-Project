<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- /jspStudy2/WebContent/jstl/hw2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jstl ����</title>
</head>
<body>
	<fmt:requestEncoding value="euc-kr" />
	<form method="post" name="f">
		�̸� : <input type="text" name="name" value="${param.name }"><br>
		���� : <input type="text" name="age" value="${param.age }"><br>
		���� : <input type="radio" name="gender" value="1">��
			 <input type="radio" name="gender" value="2">��<br>
		������ : <input type="text" name="gugu" value="${param.gugu }">
		��� : <input type="checkbox" name="hobby">����
			 <input type="checkbox" name="hobby">����<br>
		<input type="submit" value="����">
	</form>
	
	<h3>���� : ���� �Ķ���͸� �̸� : �Է°�, ... ���� : ���� or ���� �� ����ϱ�.</h3>
	�̸� : ${param.name }<br>
	���� : ${param.age }<br> 
	���� : ${param.gender==1?"����":"����" }<br>
	��� : ${param.hobby }<br>
	
	<h3>���̰� 10�� �̸��� ��� : 10�� �̸�, ���̰� 10���� ��� : 10��, ...�� ����ϱ�.</h3>
	<c:choose>
		<c:when test="${param.age/10 == 1 }">10�� �̸�</c:when>
	</c:choose>
	
	<h3>�Էµ� ���ڿ� �ش��ϴ� ������ ����ϱ�.</h3>
</body>
</html>