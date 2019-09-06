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
<title>JSTL core �±� ���� : �ݺ� ����</title>
</head>
<body>
	<h3>�ݺ����� �±� : forEach</h3>
	<c:forEach var="test" begin="1" end="10" step="2">
		${test }&nbsp;&nbsp;&nbsp;
	</c:forEach>
	
	<h3>forEach �±׸� �̿��Ͽ� 1���� 100������ ���� ���ϱ�.</h3>
	<c:forEach var="i" begin="1" end="100" step="1">  <%-- step="1" �� ���� ����. --%>
		<c:set var="sum" value="${sum + i }" />  <%-- sum �Ӽ� ����. ELǥ������ �ʱⰪ �ʿ� ����. --%>
	</c:forEach>
	1���� 100������ �� : ${sum }
	
	<h3>forEach �±׸� �̿��Ͽ� 2�ܺ��� 9�ܱ����� ������ ����ϱ�.</h3>
	<c:forEach var="i" begin="2" end="9">
		<h4>${i }��</h4>
		<c:forEach var="j" begin="1" end="9">
			<h4>${i } * ${j } = ${i*j }</h4>
		</c:forEach>
	</c:forEach>
	
	<h3>forEach �±׸� �̿��Ͽ� List ��ü ����ϱ�.</h3>
	<%
		List<Integer> list = new ArrayList<Integer>();
		for(int i=1; i<10; i++) list.add(i*10);
		pageContext.setAttribute("list", list);
	%>
	<c:forEach var="l" items="${list }">  <%-- i�� list�� ����� ��ü �ϳ��ϳ�. --%>
		${l }&nbsp;&nbsp;&nbsp;
	</c:forEach>
	<c:forEach var="l" items="${list }" varStatus="stat">  <%-- varStatus : index, count ������ ����. --%>
		<c:if test="${stat.index == 0 }">  <%-- index 0���� ����. --%>
			<h4>forEach �±��� varStatus �Ӽ� ����</h4>
		</c:if>
		${stat.count } : ${l }<br>  <%-- count�� 1���� ����. --%>
	</c:forEach>
	
	<%
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "ȫ�浿");
		map.put("today", new Date());
		map.put("age", 20);
		pageContext.setAttribute("map", map);
	%>
	<h3>forEach �±׸� �̿��Ͽ� Map ��ü ����ϱ�.</h3>
	<c:forEach var="m" items="${map }" varStatus="stat">
		${stat.count } : ${m.key } = ${m.value }<br>  <%-- Map ��ü�� key�� value�� �ϳ��� ������ ������ ����. ������ �ý����� ����. --%>
	</c:forEach>
	<h3>EL�� �̿��Ͽ� Map ��ü ����ϱ�.</h3>
	name = ${map.name }<br>  <%-- key�� ���� value ��������. �Ķ���͸� ���� ���� �������� �͵� Map��ü�� �̿��ϴ� ��. --%>
	today = ${map.today }<br>
	age = ${map.age }<br>
	
	<c:set var="arr" value="<%=new int[]{10, 20, 30, 40, 50} %>" />  <%-- value�� �迭 ǥ���� ���ָ� �ٷ� ��ü�� �ν�. --%>
	<h3>�迭 ��ü�� ��� ���</h3>
	<c:forEach var="s" items="${arr }" varStatus="stat">
		arr[${stat.index }] = ${s }<br>
	</c:forEach>
	<h4>�迭 ��ü�� �� ��° ��Һ��� �� ��° ��ұ��� ����ϱ�.</h4>
	<c:forEach var="s" items="${arr }" varStatus="stat" begin="1" end="2">  <%-- �����ε���, ���ε����� �־��༭ ���ϴ� ���� ������ �� ����. --%>
		arr[${stat.index }] = ${s }<br>
	</c:forEach>
	<h4>�迭 ��ü�� ¦�� ÷�� ��Ҹ� ����ϱ�.</h4>
	<c:forEach var="s" items="${arr }" varStatus="stat" step="2">
		arr[${stat.index }] = ${s }<br>
	</c:forEach>
	<h4>�迭 ��ü�� Ȧ�� ÷�� ��Ҹ� ����ϱ�.</h4>
	<c:forEach var="s" items="${arr }" varStatus="stat" begin="1" step="2">
		arr[${stat.index }] = ${s }<br>
	</c:forEach>
</body>
</html>