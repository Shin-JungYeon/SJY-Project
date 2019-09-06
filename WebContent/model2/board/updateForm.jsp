<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/board/updateForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� ���� ȭ��</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
<script type="text/javascript">
	function file_delete() {
		document.f.file2.value="";  //������ ���� ����.
		file_desc.style.display="none";  //ȭ�鿡�� div �κ��� ������ �ʰ� ����.
	}
</script>
</head>
<body>
	<form action="update.do" method="post" enctype="multipart/form-data" name="f">
		<input type="hidden" name="num" value="${b.num }">
		<input type="hidden" name="file2" value="${b.file1 }">
		<table>
			<caption>MODEL2 �Խ��� ���� ȭ��</caption>
			<tr><td>�۾���</td><td><input type="text" name="name" value="${b.num }"></td></tr>
			<tr><td>��й�ȣ</td><td><input type="password" name="pass"></td></tr>
			<tr><td>����</td><td><input type="text" name="subject" value="${b.subject }"></td></tr>
			<tr><td>����</td><td><textarea name="content" rows="15">${b.content }</textarea></td></tr>
			<tr><td>÷������</td>
				<td style="text-align: left">
				<c:if test="${!empty b.file1 }">
					<div id="file_desc">${b.file1 }
						<a href="javascript:file_delete()">[÷������ ����]</a>
					</div>
				</c:if>
					<input type="file" name="file1">
				</td></tr>
			<tr><td colspan="2"><a href="javascript:document.f.submit()">[�Խù� ����]</a></td></tr>
		</table>
	</form>
</body>
</html>