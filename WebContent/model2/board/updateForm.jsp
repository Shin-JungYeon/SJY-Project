<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/board/updateForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 수정 화면</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
<script type="text/javascript">
	function file_delete() {
		document.f.file2.value="";  //기존의 파일 삭제.
		file_desc.style.display="none";  //화면에서 div 부분을 보이지 않게 해줌.
	}
</script>
</head>
<body>
	<form action="update.do" method="post" enctype="multipart/form-data" name="f">
		<input type="hidden" name="num" value="${b.num }">
		<input type="hidden" name="file2" value="${b.file1 }">
		<table>
			<caption>MODEL2 게시판 수정 화면</caption>
			<tr><td>글쓴이</td><td><input type="text" name="name" value="${b.num }"></td></tr>
			<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
			<tr><td>제목</td><td><input type="text" name="subject" value="${b.subject }"></td></tr>
			<tr><td>내용</td><td><textarea name="content" rows="15">${b.content }</textarea></td></tr>
			<tr><td>첨부파일</td>
				<td style="text-align: left">
				<c:if test="${!empty b.file1 }">
					<div id="file_desc">${b.file1 }
						<a href="javascript:file_delete()">[첨부파일 삭제]</a>
					</div>
				</c:if>
					<input type="file" name="file1">
				</td></tr>
			<tr><td colspan="2"><a href="javascript:document.f.submit()">[게시물 수정]</a></td></tr>
		</table>
	</form>
</body>
</html>