<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/board/informationForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �۾���</title>
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
		if(f.psub.value == "") {
			alert("���� ������ �Է��ϼ���.");
			f.psubject.focus();
			return;
		}
		if(f.pcon.value == "") {
			alert("���� ������ �Է��ϼ���.");
			f.content.focus();
			return;
		}
		f.submit();
	}
	function win_upload() {
		var op = "width=500, height=150, left=50, top=150";
		open("fileUploadForm.jsp", "", op);
	}
</script>
</head>
<body>
	<form action="write.do" method="post" enctype="multipart/form-data" name="f">
		<input type="hidden" name="bclass" value="${param.bclass }">
		<input type="hidden" name="picture" value="">
		<table>
			<tr><td>����</td><td><input type="text" name="subject" value="[���� ����] "></td></tr>
			<tr><td>�ۼ���</td><td><input type="text" name="id" value="${sessionScope.login }"></td></tr>
			<tr><td>��й�ȣ</td><td><input type="password" name="pass"></td></tr>
			<tr><td colspan="2">
					<img src="" width="100" height="120" id="poster"><br>
					<font size="1"><a href="javascript:win_upload()">[������ ���]</a></font>
				</td></tr>
			<tr><td>���� �帣</td>
				<td><select name="genre">
						<option>�帣</option>
						<option value="�θǽ�">�θǽ�</option>
						<option value="����">����</option>
						<option value="���">���</option>
						<option value="��Ÿ��">��Ÿ��</option>
						<option value="�߸�������">�߸�������</option>
					</select></td>
			<tr><td>���� ����</td><td><input type="text" name="psub"></td></tr>
			<tr><td>���� ����</td><td><textarea name="pcon"></textarea></td></tr>
			<tr><td>���� �⿬��</td><td><input type="text" name="cast"></td></tr>
			<tr><td>���� ����</td><td><input type="date" name="schedule1"> ~ <input type="date" name="schedule2"></td></tr>
			<tr><td colspan="2"><a href="javascript:board_submit()"><input type="button" value="�Խù� ���"></a></td></tr>
		</table>
	</form>
</body>
</html>