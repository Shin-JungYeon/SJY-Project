<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%-- /WebContent/el/testForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>test</title>
</head>
<body>
	�̸� : ${param.name }<br>
	���� : ${param.age }<br>
	���� : ${param.gender=="1"?"��":"��" }<br>
	����⵵ : ${param.year }<br>
	���� : �� ${2019 - param.year }<br>  <%-- �ڷ����� ��Ȯ�ϰ� ���ǵ��� �ʰ� �ڵ����� ��ȯ�ؼ� ���. --%>
</body>
</html>