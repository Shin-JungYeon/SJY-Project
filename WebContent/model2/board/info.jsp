<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/board/info.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� �� ����</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
</head>
<body>
	<table>
		<caption>MODEL2 �Խù� �� ����</caption>
		<tr><td width="30%">�۾���</td><td width="80%" style="text-align: left">${b.name }</td></tr>
		<tr><td>����</td><td style="text-align: left">${b.subject }</td></tr>
		<tr><td>����</td>
			<td>
				<table style="width: 100%; height: 250px;">
					<tr><td style="border-width: 0px; vertical-align: top; text-align: left;">${b.content }</td></tr>
				</table>
			</td></tr>
		<tr><td>÷������</td>
			<td style="text-align: left">
			<c:if test="${!empty b.file1 }">
				<a href="file/${b.file1 }">${b.file1 }</a>
			</c:if>
			<c:if test="${empty b.file1 }">
				&nbsp;&nbsp;&nbsp;
			</c:if>
			</td></tr>
		<tr><td colspan="2">
				<a href="replyForm.do?num=${param.num }">[�亯]</a>
				<a href="updateForm.do?num=${b.num }">[����]</a>
				<a href="deleteForm.do?num=${b.num }">[����]</a>
				<a href="list.do">[���]</a>
			</td>
		</tr>
	</table>
</body>
</html>