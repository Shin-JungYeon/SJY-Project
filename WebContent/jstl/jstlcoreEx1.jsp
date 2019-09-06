<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /jspStudy2/WebContent/jstl/jstlcoreEx1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL core 태그 예제 : 반드시 taglib 지시어 표시해야 함.</title>
</head>
<body>
	<h3>속성 설정 태그 : set, remove, out 태그</h3>
	<%-- c : taglib에서 prefix로 설정한 이름. 원래는 uri다 써줘야 함. set(remove, out)이 그 안에 있는 태그임. --%>
	<c:set var="test" value="${'Hello JSTL' }" />  <%-- test라는 이름의 속성으로 등록. --%>
	test 속성 : <c:out value="${test }" /><br>
<%--
	<c:set var="test" value="${'Hello JSTL' }" scope="session" />
	test 속성 : ${sessionScope.test }<br>
	
	영역이 확실할 땐 scope 생략가능.
--%>
	test 속성 : ${test }<br>
	<c:remove var="test"/>
	test 속성 : ${test }<br>
	
	<h3>조건문 관련 태그 : if, choose 태그</h3>
	<c:if test="${5 < 10 }">  <%-- else if 태그는 없음. choose태그 사용해야함. --%>
		<h4>5는 10보다 작다.</h4>
	</c:if>
	<c:if test="${6+3 != 10 }">
		<h4>6+3은 10이 아니다.</h4>
	</c:if>
	
	<c:choose>  <%-- choose 태그 안의 when 태그의 조건에 맞는 것을 출력. else if 와 같은 역할. otherwise는 else. --%>
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
			<h4>5 + 10 = 모름. </h4>
		</c:otherwise>
	</c:choose>
	
</body>
</html>