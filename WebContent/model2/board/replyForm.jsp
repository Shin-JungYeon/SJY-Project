<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/board/replyForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��� ���� ȭ��</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
<script type="text/javascript">
	function submit() {
		f = document.f;
		if(f.name.value == "") {
			alert("�۾��̸� �Է��ϼ���.");
			f.name.focus();
			return;
		}
		if(f.pass.value == "") {
			alert("��й�ȣ�� �Է��ϼ���.");
			f.pass.focus();
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
</head>
<body>
	<form action="reply.do" method="post" name="f">
	<%-- ���ۿ� ���� ���� : num, ref, reflevel(0~999), refstep --%>
		<input type="hidden" name="num" value="${b.num }">
		<input type="hidden" name="ref" value="${b.ref }">
		<input type="hidden" name="reflevel" value="${b.reflevel }">
		<input type="hidden" name="refstep" value="${b.refstep }">
		<table>
			<caption>MODEL2 �Խ��� ��� ���</caption>
			<%-- ��ۿ� ���� ���� : name, pass, content. subject�� ������ ���� ������. --%>
			<tr><td>�۾���</td><td><input type="text" name="name"></td></tr>
			<tr><td>��й�ȣ</td><td><input type="password" name="pass"></td></tr>
			<tr><td>����</td><td><input type="text" name="subject" value="RE : ${b.subject }"></td></tr>
			<tr><td>����</td><td><textarea name="content" rows="15"></textarea></td></tr>
			<tr><td colspan="2"><a href="javascript:document.f.submit()">[�亯�� ���]</a></td></tr>
		</table>
	</form>
</body>
</html>