<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/member/main.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원관리 프로그램</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
</head>
<body>
	<h3>${sessionScope.login } 회원님 반갑습니다.</h3>  <%-- sessionScope 해주는 것이 안전. --%>
	<h3><a href="logout.me">로그아웃</a></h3>
	<h3><a href="info.me?id=${sessionScope.login }">회원정보 보기</a></h3>
	<c:if test="${sessionScope.login == 'admin'}">
		<h3><a href="list.me">회원목록 보기</a></h3>
	</c:if>
</body>
</html>
