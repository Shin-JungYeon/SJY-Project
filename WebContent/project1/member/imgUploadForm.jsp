<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/member/imgUploadForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���ε�</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="w3-light-grey w3-content" style="max-width:2400px">
	<form action="imgUpload.do" method="post" enctype="multipart/form-data" name="f">
		<table>
			<tr><td><input type="file" name="picture"></td>
				<td><input type="submit" value="���"></td></tr>
		</table>
	</form>
</body>
</html>