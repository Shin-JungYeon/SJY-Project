<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value="UTF-8" />
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver" url="jdbc:mariadb://localhost:3306/project1" user="model1" password="1234" />

<sql:query var="commentadd" dataSource="${conn }">
	insert into comment (num, id, content, regdate) values(${param.num }, ${param.id }, ${param.content }, ,now())
</sql:query>

<sql:query var="comm" dataSource="${conn }">
	select * from comment where num = ?
	<sql:param>${param.num }</sql:param>
</sql:query>
