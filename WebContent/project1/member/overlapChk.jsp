<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value="UTF-8" />
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver" url="jdbc:mariadb://localhost:3306/project1" user="model1" password="1234" />

<c:if test="${!empty param.id }">
	<sql:query var="idchk" dataSource="${conn }">
		select * from member where id = ?
		<sql:param>${param.id }</sql:param>
	</sql:query>
	<c:if test="${!empty idchk.rows }">
		<h3 class="idchk"></h3>
		<script>
			$("#id").val("");
		</script>
	</c:if>
	<c:if test="${empty idchk.rows }">
	</c:if>
</c:if>


<c:if test="${!empty param.nick }">
	<sql:query var="nickchk" dataSource="${conn }">
		select * from member where nick = ?
		<sql:param>${param.nick }</sql:param>
	</sql:query>
	<c:if test="${!empty nickchk.rows }">
		<h3 class="nickchk"></h3>
		<script>
			$("#nick").val("");
		</script>
	</c:if>
	<c:if test="${empty nickchk.rows }">
	</c:if>
</c:if>