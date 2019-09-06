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
<title>요청 파라미터 정보 출력하기</title>
</head>
<body>
	<h2>요청 파라미터 정보</h2>
	이름 : ${param.name }<br>
	나이 : ${param.age }<br>
	성별 : ${param.gender==1?"남":"여" }<br>
	취미 : ${param.hobby }<br>
	출생년도 : ${param.year }<br>
	
	<h2>요청 파라미터에 저장된 모든 값 조회하기</h2>
	<h3>취미 : </h3>
	<c:forEach var="h" items="${paramValues.hobby }">  <%-- param. 은 값을 한 개만 전달해줌. paramValues. 은 파라미터의 값을 모두 가져와서 배열객체로 만들어줌. --%>
		${h }&nbsp;&nbsp;
	</c:forEach>
	
	<h2>모든 요청 파라미터의 모든 값 조회하기(파라미터 이름 모름)</h2>
	<table>
		<tr><th>파라미터 이름</th><th>파라미터 값</th></tr>
		<c:forEach var="v" items="${paramValues }">  <%-- paramValues 자체가 Map 객체가 됨. --%>
			<tr><td>${v.key }</td>
				<td><c:forEach var="v" items="${v.value }">
						${v }&nbsp;&nbsp;
					</c:forEach>
				</td></tr>
		</c:forEach>
	</table>
</body>
</html>