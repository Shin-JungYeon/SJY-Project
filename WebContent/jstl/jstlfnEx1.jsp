<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- /jspStudy2/WebContent/jstl/jstlfnEx1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL의 함수</title>
</head>
<body>
	<c:set var="str1" value="Functions <태그>를 사용합니다.          " />
	<c:set var="str2" value="사용" />
	<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10" />
	length(str1) = ${fn:length(str1) }<br>
	toUpperCase(str1) = ${fn:toUpperCase(str1) }<br>
	toLowerCase(str1) = ${fn:toLowerCase(str1) }<br>
	substring(str1, 3, 6) = ${fn:substring(str1, 3, 6) }<br>
	substringAfter(str1, str2) = ${fn:substringAfter(str1, str2) }<br>
	substringBefore(str1, str2) = ${fn:substringBefore(str1, str2) }<br>
	trim(str1) = ${fn:trim(str1) }<br>
	replace(str1, " ", "-") = ${fn:replace(str1, " ", "-") }<br>
	<c:set var="arr" value="${fn:split(tokens, ',') }" />
	<c:forEach var="i" items="${arr }">
		${i } &nbsp;
	</c:forEach><br>
	join(arr, '-') = ${fn:join(arr, '-') }<br>
</body>
</html>