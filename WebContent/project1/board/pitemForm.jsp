<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����Ʈ ��ǰ ���</title>
<script type="text/javascript">
	function passchk() {
		if(f.pass.value == "") {
			alert("��й�ȣ�� �Է��ϼ���.");
			f.pass.focus();
			return false;
		} else {
			return true;
		}
	}
	function win_upload() {
		var op = "width=500, height=150, left=50, top=150";
		open("fileUploadForm.jsp", "", op);
	}
</script>
</head>
<body>
	<div>
		<form action="pitemadd.do" method="post" name="f">
			<input type="hidden" name="picture" value="">
			<table>
				
				<tr><td>��ǰ �̹���</td>
					<td><img src="" width="100" height="120" id="poster"><br>
						<font size="1"><a href="javascript:win_upload()">[�̹��� ���]</a></font></td>
				</tr>
				<tr><td>��й�ȣ</td><td><input type="password" name="pass" style="width: 300px;"></td></tr>
				<tr>
					<td>��ǰ �̸�</td>
					<td><input type="text" name="name" style="width: 300px;"></td>
				</tr>
				<tr>
					<td>��ǰ ����Ʈ</td>
					<td><input type="text" name="point" style="width: 300px;"></td>
				</tr>
				<tr><td colspan="2"><input type="submit" value="��ǰ���" onclick="return passchk()"></td></tr>
				
			</table>
		</form>
	</div>
</body>
</html>