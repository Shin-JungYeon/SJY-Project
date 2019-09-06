<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/board/posterUploadForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>포스터 업로드</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="w3-light-grey w3-content" style="max-width:2400px">
	<form action="fileUpload.do" method="post" enctype="multipart/form-data">
		<table>
			<tr><td><input type="file" name="picture"></td>
				<td><input type="submit" value="등록"></td></tr>
		</table>
	</form>
</body>
</html>