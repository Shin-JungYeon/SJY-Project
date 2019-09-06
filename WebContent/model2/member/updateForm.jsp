<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/member/updateForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ���� ȭ��</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
<script type="text/javascript">
	function input_check(f) {
		<c:if test="${sessionScope.login != 'admin'}">
			if(f.pass.value == "") {
				alert("��й�ȣ�� �Է��ϼ���.");
				f.pass.focus();
				return false;
			}
		</c:if>
		return true;
	}
	function passchg_winopen() {
		var op = "width=500, height=230, left=50, top=150";
		open("passwordForm.me", "", op);  //���ο� â ����.
	}
	function win_upload() {
		var op = "windth=500, height=150, left=50, top=150";
		open("pictureimgForm.me", "", op);
	}
</script>
</head>
<body>
<%--
	update.me �� ���.
		1. ��� �Ķ���͸� Member ��ü�� ����.
		2. ��й�ȣ ����
			- ��ġ : db ����.
				- ���� : ���� �޼��� ��� �� main.me�� ������ �̵�.
				- ���� : ���� �޼��� ��� �� updateForm.me�� ������ �̵�.
			- ����ġ : ��й�ȣ ���� �޼��� ��� �� updateForm.me�� ������ �̵�.
			
--%>
	<form action="update.me" name="f" method="post" onsubmit="return input_check(this)">  <%-- onsubmit : �̺�Ʈ ó�� --%>
		<input type="hidden" name="picture" value="${mem.picture }">
		<table>
			<caption>MODEL2 ȸ�� ���� ����</caption>
			<tr><td rowspan="4" valign="bottom">
					<img src="img/${mem.picture }" width="100" height="120" id="pic"><br>
					<font size="1"><a href="javascript:win_upload()">��������</a></font>
				</td>
				<td>���̵�</td><td><input type="text" name="id" value="${mem.id }" readonly></td>  <%-- readonly : �����ֱ⸸ �ϰ� ���� �Ұ���. --%>
			</tr>
			<tr><td>��й�ȣ</td><td><input type="password" name="pass"></td></tr>
			<tr><td>�̸�</td><td><input type="text" name="name" value="${mem.name }"></td></tr>
			<tr><td>����</td>
				<td><input type="radio" name="gender" value="1" ${mem.gender==1?"checked":"" }>��  <%-- radio ��ư�� Ư���� �������� üũ�� �����θ� ������. ������ ������ ���ǽ� �Ƚ��൵ ��. --%>
					<input type="radio" name="gender" value="2" ${mem.gender==2?"checked":"" }>��</td>
			</tr>
			<tr><td>��ȭ��ȣ</td><td colspan="2"><input type="text" name="tel" value="${mem.tel }"></td></tr>
			<tr><td>�̸���</td><td colspan="2"><input type="text" name="email" value=" ${mem.email }"></td></tr>
			<tr><td colspan="3">
					<input type="submit" value="ȸ������">
					<input type="button" value="��й�ȣ����" onclick="passchg_winopen()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>