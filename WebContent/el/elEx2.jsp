<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/el/elEx2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>elEx1.jsp의 결과 화면</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String tel = "010-1111-2222";
	pageContext.setAttribute("tel", tel);  //변수는 속성으로 등록해줘야 EL로 표현 가능.
	pageContext.setAttribute("test", "pageContext 객체의 test 속성값");
%>
	<h3>JSP의 스크립트를 이용하여 파라미터와 속성값 출력</h3>
	pageContext test 속성값 : <%=pageContext.getAttribute("test") %><br>
	session test 속성값 : <%=session.getAttribute("test") %><br>
	today 속성값 : <%=session.getAttribute("today") %><br>
	name 파라미터값 : <%=request.getParameter("name") %><br>
	tel 변수값 : <%=tel %><br>
	tel 속성값 : <%=pageContext.getAttribute("tel") %><br>
	없는 속성값 : <%=pageContext.getAttribute("noAttribute") %><br>  <%-- 없기 때문에 null --%>
	<hr>
	
	<h3>JSP의 EL를 이용하여 파라미터와 속성값 출력</h3>
	pageContext test 속성값 : ${test }<br>
	session test 속성값 : ${sessionScope.test }<br>  <%-- ${... } : session 객체의 속성을 가져오려면 속성 이름만 써주면 됨. --%>
	today 속성값 : ${today }<br>
	name 파라미터값 : ${param.name }<br>  <%-- ${param.name } : request 객체의 파라미터 값을 가져오려염 param.파라미터이름 써주면 됨. --%>
	tel 변수값 : EL로 표현 못함.<br>
	tel 속성값 : ${tel }<br>
	없는 속성값 : ${noAttribute }<br>
	<%--
		${... } : 영역 담당 객체에 저장된 속성 중 이름이 ...인 속성의 값을 리턴.
				  pageContext -> request -> session -> application
				  	1. pageContext 객체의 test 속성 검색. 존재하면 속성값 리턴.
				  	2. 1번에서 속성이 없으면 request 객체의 test 속성 검색. 존재하면 속성값 리턴.
				  	3. 2번에서 속성이 없으면 session 객체의 test 속성 검색. 존재하면 속성값 리턴.
				  	4. 3번에서 속성이 없으면 application 객체의 test 속성 검색. 존재하면 속성값 리턴.
				  	5. 4번까지 없으면 아무것도 출력하지 않는다. null도 출력하지 않고, 오류도 발생하지 않음.
				    직접 영역 담당 객체를 지정할 수 있다. -> 객체를 직접 가져오는 것이 아니라 그 객체 안에 있는 속성값만 가져오는 것.
				    pageContext 객체의 속성 : ${pageContextScope.속성명 }
				    request 객체의 속성 : ${requestScope.속성명 }
				    session 객체의 속성 : ${sessionScope.속성명 }
				    application 객체의 속성 : ${applicationScope.속성명 }
	--%>
</body>
</html>