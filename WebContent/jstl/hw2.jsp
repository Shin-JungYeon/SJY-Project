<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- /jspStudy2/WebContent/jstl/hw2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jstl 연습</title>
</head>
<body>
	<fmt:requestEncoding value="euc-kr" />
	<form method="post" name="f">
		이름 : <input type="text" name="name" value="${param.name }"><br>
		나이 : <input type="text" name="age" value="${param.age }"><br>
		성별 : <input type="radio" name="gender" value="1">남
			 <input type="radio" name="gender" value="2">여<br>
		구구단 : <input type="text" name="gugu" value="${param.gugu }">
		취미 : <input type="checkbox" name="hobby">여행
			 <input type="checkbox" name="hobby">독서<br>
		<input type="submit" value="전송">
	</form>
	
	<h3>문제 : 위의 파라미터를 이름 : 입력값, ... 성별 : 남자 or 여자 로 출력하기.</h3>
	이름 : ${param.name }<br>
	나이 : ${param.age }<br> 
	성별 : ${param.gender==1?"남자":"여자" }<br>
	취미 : ${param.hobby }<br>
	
	<h3>나이가 10살 미만인 경우 : 10살 미만, 나이가 10대인 경우 : 10대, ...로 출력하기.</h3>
	<c:choose>
		<c:when test="${param.age/10 == 1 }">10대 미만</c:when>
	</c:choose>
	
	<h3>입력된 숫자에 해당하는 구구단 출력하기.</h3>
</body>
</html>