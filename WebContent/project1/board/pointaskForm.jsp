<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����Ʈ ��ǰ ��û</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div>
		<form action="pointask.do" method="post">
			<input type="hidden" name="reqid" id="id" value="${mp.id }">
			<input type="hidden" name="itemimg" value="${pb.itemimg }">
			<input type="hidden" name="itemname" value="${pb.name }">
			<input type="hidden" name="itemno" value="${param.no }">
			<table style="width: 45%">
				<tr><td rowspan="4"><img src="file/${pb.itemimg }" width="100" height="120"></td></tr>
				<tr><td>��� ���� ����Ʈ</td><td><input type="text" name="usablepoint" value="${usablepoint }" style="width: 300px;"></td></tr>
				<tr><td>��� ����Ʈ</td><td><input type="text" name="itempoint" value="${pb.point }" style="width: 300px;"></td></tr>
				<tr><td>�ܿ� ����Ʈ</td><td><input type="text" name="restpoint" value="${restpoint }" style="width: 300px;"></td></tr>
			<!-- 	<tr><td colspan="3"><input type="button" value="���� �� �Է��� ���� �ҷ�����" id="info">
					</td></tr> -->
				<tr><td colspan="3"><input type="text" id="tel" name="reqtel" placeholder="Phon Number"></td></tr>
				<tr><td colspan="3"><input type="text" id="email" name="reqemail" placeholder="E-mail"></td></tr>
				<tr><td colspan="3"><input type="checkbox" id="agree"> ���� ������ �����մϴ�.</td></tr>
				<tr><td colspan="3">
						<input type="submit" value="��û">
						<a href="boardlist.do?bclass=1"><input type="button" value="���"></a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="message"></div>
</body>
</html>