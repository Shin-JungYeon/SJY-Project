<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/board/info.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 상세 보기</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
</head>
<body>
	<table>
		<caption>MODEL2 게시물 상세 보기</caption>
		<tr><td width="30%">글쓴이</td><td width="80%" style="text-align: left">${b.name }</td></tr>
		<tr><td>제목</td><td style="text-align: left">${b.subject }</td></tr>
		<tr><td>내용</td>
			<td>
				<table style="width: 100%; height: 250px;">
					<tr><td style="border-width: 0px; vertical-align: top; text-align: left;">${b.content }</td></tr>
				</table>
			</td></tr>
		<tr><td>첨부파일</td>
			<td style="text-align: left">
			<c:if test="${!empty b.file1 }">
				<a href="file/${b.file1 }">${b.file1 }</a>
			</c:if>
			<c:if test="${empty b.file1 }">
				&nbsp;&nbsp;&nbsp;
			</c:if>
			</td></tr>
		<tr><td colspan="2">
				<a href="replyForm.do?num=${param.num }">[답변]</a>
				<a href="updateForm.do?num=${b.num }">[수정]</a>
				<a href="deleteForm.do?num=${b.num }">[삭제]</a>
				<a href="list.do">[목록]</a>
			</td>
		</tr>
	</table>
</body>
</html>