<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /jspStudy2/WebContent/jstl/jstlcoreEx2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL core 태그 연습 : 반복 구문</title>
</head>
<body>
	<h3>반복관련 태그 : forEach</h3>
	<c:forEach var="test" begin="1" end="10" step="2">
		${test }&nbsp;&nbsp;&nbsp;
	</c:forEach>
	
	<h3>forEach 태그를 이용하여 1부터 100까지의 합을 구하기.</h3>
	<c:forEach var="i" begin="1" end="100" step="1">  <%-- step="1" 은 생략 가능. --%>
		<c:set var="sum" value="${sum + i }" />  <%-- sum 속성 설정. EL표현식은 초기값 필요 없음. --%>
	</c:forEach>
	1부터 100까지의 합 : ${sum }
	
	<h3>forEach 태그를 이용하여 2단부터 9단까지의 구구단 출력하기.</h3>
	<c:forEach var="i" begin="2" end="9">
		<h4>${i }단</h4>
		<c:forEach var="j" begin="1" end="9">
			<h4>${i } * ${j } = ${i*j }</h4>
		</c:forEach>
	</c:forEach>
	
	<h3>forEach 태그를 이용하여 List 객체 출력하기.</h3>
	<%
		List<Integer> list = new ArrayList<Integer>();
		for(int i=1; i<10; i++) list.add(i*10);
		pageContext.setAttribute("list", list);
	%>
	<c:forEach var="l" items="${list }">  <%-- i는 list에 저장된 객체 하나하나. --%>
		${l }&nbsp;&nbsp;&nbsp;
	</c:forEach>
	<c:forEach var="l" items="${list }" varStatus="stat">  <%-- varStatus : index, count 가지고 있음. --%>
		<c:if test="${stat.index == 0 }">  <%-- index 0부터 시작. --%>
			<h4>forEach 태그의 varStatus 속성 연습</h4>
		</c:if>
		${stat.count } : ${l }<br>  <%-- count는 1부터 시작. --%>
	</c:forEach>
	
	<%
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "홍길동");
		map.put("today", new Date());
		map.put("age", 20);
		pageContext.setAttribute("map", map);
	%>
	<h3>forEach 태그를 이용하여 Map 객체 출력하기.</h3>
	<c:forEach var="m" items="${map }" varStatus="stat">
		${stat.count } : ${m.key } = ${m.value }<br>  <%-- Map 객체는 key와 value를 하나의 쌍으로 가지고 있음. 순서는 시스템이 정함. --%>
	</c:forEach>
	<h3>EL을 이용하여 Map 객체 출력하기.</h3>
	name = ${map.name }<br>  <%-- key를 통해 value 가져오기. 파라미터를 통해 값을 가져오는 것도 Map객체를 이용하는 것. --%>
	today = ${map.today }<br>
	age = ${map.age }<br>
	
	<c:set var="arr" value="<%=new int[]{10, 20, 30, 40, 50} %>" />  <%-- value에 배열 표현식 써주면 바로 객체로 인식. --%>
	<h3>배열 객체의 요소 출력</h3>
	<c:forEach var="s" items="${arr }" varStatus="stat">
		arr[${stat.index }] = ${s }<br>
	</c:forEach>
	<h4>배열 객체의 두 번째 요소부터 세 번째 요소까지 출력하기.</h4>
	<c:forEach var="s" items="${arr }" varStatus="stat" begin="1" end="2">  <%-- 시작인덱스, 끝인덱스를 넣어줘서 원하는 값만 가져올 수 있음. --%>
		arr[${stat.index }] = ${s }<br>
	</c:forEach>
	<h4>배열 객체의 짝수 첨자 요소만 출력하기.</h4>
	<c:forEach var="s" items="${arr }" varStatus="stat" step="2">
		arr[${stat.index }] = ${s }<br>
	</c:forEach>
	<h4>배열 객체의 홀수 첨자 요소만 출력하기.</h4>
	<c:forEach var="s" items="${arr }" varStatus="stat" begin="1" step="2">
		arr[${stat.index }] = ${s }<br>
	</c:forEach>
</body>
</html>