<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<fmt:requestEncoding value="UTF-8" />
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver" url="jdbc:mariadb://localhost:3306/project1" user="model1" password="1234" />

<c:if test="${!empty param.id }">
	<sql:query var="telmail" dataSource="${conn }">
		select tel, email from member where id = ?
		<sql:param>${param.id }</sql:param>
	</sql:query>
	
	<c:if test="${!empty telmail.rows }">
		<c:forEach var="tm" items="${telmail.rows }">
			<script>
				$("#tel").val("${tm.tel}");
				$("#email").val("${tm.email}");
			</script>
		</c:forEach>
	</c:if>
</c:if>