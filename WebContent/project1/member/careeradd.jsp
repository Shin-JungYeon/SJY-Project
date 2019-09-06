<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="UTF-8" />
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver" url="jdbc:mariadb://localhost:3306/project1" user="model1" password="1234" />
<sql:query var="rs" dataSource="${conn }">
	insert into career (seq, id, content) values(?, ?, ?)
	<sql:param>${param.seq }</sql:param>
	<sql:param>${param.id }</sql:param>
	<sql:param>${param.content }</sql:param>
</sql:query>