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
	이름 : ${param.name }<br>
	나이 : ${param.age }<br>
	성별 : ${param.gender=="1"?"남":"여" }<br>
	출생년도 : ${param.year }<br>
	나이 : 만 ${2019 - param.year }<br>  <%-- 자료형이 정확하게 정의되지 않고 자동으로 변환해서 계산. --%>
</body>
</html>