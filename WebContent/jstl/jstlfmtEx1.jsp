<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- /jspStudy2/WebContent/jstl/jstlfmtEx1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>형식화 태그 예제</title>
</head>
<body>
	<h3>숫자 관련 형식 지정하기.</h3>
	<fmt:formatNumber value="500000" type="currency" /><br>  <%-- type="currency" : 해당 지역의 화폐 단위를 표시. --%>
	<fmt:setLocale value="en_US" />  <%-- 현재 지역을 변경. 기본값은 우리나라. --%>
	<fmt:formatNumber value="500000" type="currency" /><br>
	<fmt:setLocale value="ko_KR" />
	<fmt:formatNumber value="0.15" type="percent" /><br>
	<fmt:formatNumber value="500000.12345" pattern="###,###.00" /><br>
	
	<h3>날짜 관련 형식 지정하기.</h3>
	<jsp:useBean id="today" class="java.util.Date" />
	년월일 : <fmt:formatDate value="${today }" type="date" /><br>
	시분초 : <fmt:formatDate value="${today }" type="time" /><br>
	일시 : <fmt:formatDate value="${today }" type="both" /><br>
	형식 지정 : <fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm:ss a E" /><br>
	일시1 : <fmt:formatDate value="${today }" type="both" timeStyle="short" dateStyle="short" /><br>
	일시2 : <fmt:formatDate value="${today }" type="both" timeStyle="long" dateStyle="long" /><br>
	일시3 : <fmt:formatDate value="${today }" type="both" timeStyle="full" dateStyle="full" /><br>
	일시4 : <fmt:formatDate value="${today }" type="both" timeStyle="full" dateStyle="full" timeZone="GMT" /><br>  <%-- 다양한 속성들이 존재함. 꼭 있어야 하는 속성들이 존재. --%>
</body>
</html>