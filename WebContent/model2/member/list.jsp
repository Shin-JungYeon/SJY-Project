<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/member/list.jsp --%>		
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ��� ��ȸ</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
<script type="text/javascript">
	function del(id) {
		if(confirm(id + "���� ������ Ż�� ��Ű�ðڽ��ϱ�?") == true) {
			location.href = "delete.me?id=" + id;
		}
	}
</script>
</head>
<body>
	<form action="search.me" method="post" name="sf">
		<table>
			<tr><td style="border-width: 0px;">
					<select name="column">
						<option value="">�����ϼ���</option>
						<option value="id">���̵�</option>
						<option value="name">�̸�</option>
						<option value="tel">��ȭ</option>
					</select>
					<script>
						document.sf.column.value = "${param.column}";
					</script>
					<input type="text" name="find" value="${param.find}" style="width: 300px;">
					<input type="submit" value="�˻�">
				</td>
			</tr>
		</table>
		<table>
			<caption>MODEL2 ȸ�� ���</caption>
			<tr><th>����</th><th>���̵�</th><th>�̸�</th><th>����</th><th>��ȭ��ȣ</th><th>&nbsp;</th></tr>
			<c:forEach var="m" items="${list }">
				<tr><td><img src="img/${m.picture }" width="30" height="40"></td>
					<td><a href="info.me?id=${m.id }">${m.id }</a></td>
					<td>${m.name }</td>
					<td>${m.gender==1?"����":"����" }</td>
					<td>${m.tel }</td>
					<td><a href="updateForm.me?id=${m.id }">[����]</a>
					<c:if test="${m.id != 'admin' }">
						<a href="javascript:del('${m.id }')">[����Ż��]</a>
					</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>
