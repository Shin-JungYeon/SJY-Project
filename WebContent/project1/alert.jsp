<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/project1/alert.jsp --%>
<script>
	alert("${msg }");
	<c:choose>
		<c:when test="${closable}">
			opener.location.href="${url}";
			self.close();
		</c:when>
		<c:otherwise>
			location.href="${url }";
		</c:otherwise>
	</c:choose>
</script>