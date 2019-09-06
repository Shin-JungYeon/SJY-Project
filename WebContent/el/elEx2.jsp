<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/el/elEx2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>elEx1.jsp�� ��� ȭ��</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String tel = "010-1111-2222";
	pageContext.setAttribute("tel", tel);  //������ �Ӽ����� �������� EL�� ǥ�� ����.
	pageContext.setAttribute("test", "pageContext ��ü�� test �Ӽ���");
%>
	<h3>JSP�� ��ũ��Ʈ�� �̿��Ͽ� �Ķ���Ϳ� �Ӽ��� ���</h3>
	pageContext test �Ӽ��� : <%=pageContext.getAttribute("test") %><br>
	session test �Ӽ��� : <%=session.getAttribute("test") %><br>
	today �Ӽ��� : <%=session.getAttribute("today") %><br>
	name �Ķ���Ͱ� : <%=request.getParameter("name") %><br>
	tel ������ : <%=tel %><br>
	tel �Ӽ��� : <%=pageContext.getAttribute("tel") %><br>
	���� �Ӽ��� : <%=pageContext.getAttribute("noAttribute") %><br>  <%-- ���� ������ null --%>
	<hr>
	
	<h3>JSP�� EL�� �̿��Ͽ� �Ķ���Ϳ� �Ӽ��� ���</h3>
	pageContext test �Ӽ��� : ${test }<br>
	session test �Ӽ��� : ${sessionScope.test }<br>  <%-- ${... } : session ��ü�� �Ӽ��� ���������� �Ӽ� �̸��� ���ָ� ��. --%>
	today �Ӽ��� : ${today }<br>
	name �Ķ���Ͱ� : ${param.name }<br>  <%-- ${param.name } : request ��ü�� �Ķ���� ���� ���������� param.�Ķ�����̸� ���ָ� ��. --%>
	tel ������ : EL�� ǥ�� ����.<br>
	tel �Ӽ��� : ${tel }<br>
	���� �Ӽ��� : ${noAttribute }<br>
	<%--
		${... } : ���� ��� ��ü�� ����� �Ӽ� �� �̸��� ...�� �Ӽ��� ���� ����.
				  pageContext -> request -> session -> application
				  	1. pageContext ��ü�� test �Ӽ� �˻�. �����ϸ� �Ӽ��� ����.
				  	2. 1������ �Ӽ��� ������ request ��ü�� test �Ӽ� �˻�. �����ϸ� �Ӽ��� ����.
				  	3. 2������ �Ӽ��� ������ session ��ü�� test �Ӽ� �˻�. �����ϸ� �Ӽ��� ����.
				  	4. 3������ �Ӽ��� ������ application ��ü�� test �Ӽ� �˻�. �����ϸ� �Ӽ��� ����.
				  	5. 4������ ������ �ƹ��͵� ������� �ʴ´�. null�� ������� �ʰ�, ������ �߻����� ����.
				    ���� ���� ��� ��ü�� ������ �� �ִ�. -> ��ü�� ���� �������� ���� �ƴ϶� �� ��ü �ȿ� �ִ� �Ӽ����� �������� ��.
				    pageContext ��ü�� �Ӽ� : ${pageContextScope.�Ӽ��� }
				    request ��ü�� �Ӽ� : ${requestScope.�Ӽ��� }
				    session ��ü�� �Ӽ� : ${sessionScope.�Ӽ��� }
				    application ��ü�� �Ӽ� : ${applicationScope.�Ӽ��� }
	--%>
</body>
</html>