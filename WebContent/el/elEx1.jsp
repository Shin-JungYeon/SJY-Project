<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /jspStudy2/WebContent/el/elEx1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>EL(ǥ�����) ����</title>  <%-- EL(ǥ�����) : ��ũ��Ʈ�� ǥ������ ��ü��. ���굵 ����. --%>
</head>
<body>
<%
	session.setAttribute("test", "session test �Ӽ�");
	session.setAttribute("today", new Date());
%>
	<form action="elEx2.jsp" method="post">
		�̸� : <input type="text" name="name" value="ȫ�浿">
			 <input type="submit" value="����">
	</form>
</body>
</html>