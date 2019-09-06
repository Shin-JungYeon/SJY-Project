<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="day" class="java.util.Date" />
<fmt:formatDate var="today" value="${day }" pattern="yyyyMMdd" />
<%-- /WebContent/project1/board/notice.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �Խ���</title>
<link rel="stylesheet" href="/project1/css/project.css">
</head>
<body>
<div>
<form>
	<table>
		<tr><td colspan="2" style="text-align: left"><font size="5">${b.subject }</font></td></tr>
		<tr><td style="text-align: left">${b.id }</td>
			<td style="text-align: right"><fmt:formatDate value="${b.regdate }" pattern="yy-MM-dd HH:mm:ss" /></td></tr>
		<tr><td colspan="2"><table style="width: 100%; height: 250px;">
					<tr><td style="border-width: 0px; vertical-align: mid; text-align: left;">${b.content }</td></tr>
				</table>
			</td></tr>
		<tr><td>÷������</td>
			<td style="text-align: left">
			<c:if test="${!empty b.file }">
				<a href="file/${b.file }">${b.file }</a>
			</c:if>
			<c:if test="${empty b.file }">
				&nbsp;&nbsp;&nbsp;
			</c:if>
			</td></tr>
	
		<tr><td colspan="2">
			<c:if test="${login == b.id }">
				<a href="updateForm.do?num=${b.num }&bclass=${b.bclass }"><input type="button" value="����"></a>
				<a href="deleteForm.do?num=${b.num }&bclass=${b.bclass }"><input type="button" value="����"></a>
			</c:if>
				<a href="boardlist.do?bclass=${b.bclass }"><input type="button" value="���"></a>
			</td>
		</tr>
	
	</table>
	</form>
	</div>
</body>
</html>