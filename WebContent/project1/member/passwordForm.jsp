<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/member/passwordForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ����</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<script type="text/javascript">
	function inputchg_check(f) {
		if(f.chgpass.value != f.chgpass2.value) {
			alert("���� �� ��й�ȣ�� ���� �ٸ��ϴ�. �ٽ� �Է����ּ���.");
			f.chgpass2.value="";
			f.chgpass2.focus();
			return false;
		}
		return true;
	}
</script>

</head>
<body class="w3-light-grey w3-content" style="max-width:2400px">
	<form action="password.me" method="post" name="f" onsubmit="return inputchg_check(this)">
		<table>
			<caption>��к�ȣ ����</caption>
			<tr><td>���� ��й�ȣ</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr><td>���� ��й�ȣ</td>
				<td><input type="password" name="chgpass"></td>
			</tr>
			<tr><td>���� ��й�ȣ ���Է�</td>
				<td><input type="password" name="chgpass2"></td>
			</tr>
			<tr><td colspan="2"><input type="submit" value="��й�ȣ ����"></td></tr>
		</table>
	</form>
</body>
</html>