<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/board/pnoticeForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����Ʈ �������� �۾���</title>
<link rel="stylesheet" href="/project1/css/project.css">
<script type="text/javascript">
	function board_submit() {
		f = document.f;
		if(f.pass.value == "") {
			alert("��й�ȣ�� �Է��ϼ���.");
			f.pass.focus();
			return;
		}
		if(f.subject.value == "") {
			alert("������ �Է��ϼ���.");
			f.subject.focus();
			return;
		}
		if(f.content.value == "") {
			alert("������ �Է��ϼ���.");
			f.content.focus();
			return;
		}
		f.submit();
	}
</script>
<style type="text/css">
	input[type=text], input[type=password] {
		width: 385px;
	}
</style>
</head>
<body>
	<form action="write.do" method="post" enctype="multipart/form-data" name="f">
		<input type="hidden" name="bclass" value="${param.bclass }">
		<input type="hidden" name="id" value="${sessionScope.login }">
		<table>
			<tr><td>�ۼ���</td><td><input type="text" name="name" value="������"></td></tr>
			<tr><td>��й�ȣ</td><td><input type="password" name="pass"></td></tr>
			<tr><td>����</td><td><input type="text" name="subject" value="[����Ʈ ����]"></td></tr>
			<tr><td>����</td><td><textarea rows="15" cols="45" name="content"></textarea></td></tr>
			<tr><td>÷������</td><td><input type="file" name="file"></td></tr>
			<tr><td colspan="2"><a href="javascript:board_submit()"><input type="button" value="�Խù� ���"></a></td></tr>
		</table>
	</form>
</body>
</html>