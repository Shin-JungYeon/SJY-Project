<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/board/reviewForm.jsp --%>
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
		if(f.content.value == "") {
			alert("������ �Է��ϼ���.");
			f.content.focus();
			return;
		}
		f.submit();
	}
</script>
<style type="text/css">
	select {
		width: 85px;
	}
</style>
</head>
<body>
	<form action="write.do" method="post" enctype="multipart/form-data" name="f">
		<input type="hidden" name="bclass" value="${param.bclass }">
		<table>
			<tr><td><select name="genre">
						<option>�帣</option>
						<option value="�θǽ�">�θǽ�</option>
						<option value="����">����</option>
						<option value="���">���</option>
						<option value="��Ÿ��">��Ÿ��</option>
						<option value="�߸�������">�߸�������</option>
					</select></td>
				<td><input type="date" name="watchdate"></td>
				<td><select name="watchloc">
						<option>��������</option>
						<option value="����">����</option>
						<option value="���">���</option>
						<option value="��õ">��õ</option>
						<option value="�λ�">�λ�</option>
					</select></td>
				<td><select name="grade">
						<option>����</option>
						<option value="1">�ڡ١١١�</option>
						<option value="2">�ڡڡ١١�</option>
						<option value="3">�ڡڡڡ١�</option>
						<option value="4">�ڡڡڡڡ�</option>
						<option value="5">�ڡڡڡڡ�</option>
					</select>
				</td></tr>
		<tr><td>�ۼ���</td><td colspan="3"><input type="text" name="id" value="${sessionScope.login }"></td></tr>
		<tr><td>��й�ȣ</td><td colspan="3"><input type="password" name="pass"></td></tr>
		<tr><td>����</td><td colspan="3"><input type="text" name="subject"></td></tr>
		<tr><td>����</td><td colspan="3"><textarea rows="15" name="content"></textarea></td></tr>
		<tr><td>÷������</td><td colspan="3"><input type="file" name="file"></td></tr>
		<tr><td colspan="4" style="text-align: right"><a href="javascript:board_submit()"><input type="button" value="�Խù� ���"></a></td></tr>
		</table>
		
	</form>
</body>
</html>