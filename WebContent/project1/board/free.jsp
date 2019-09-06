<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="day" class="java.util.Date" />
<fmt:formatDate var="today" value="${day }" pattern="yyyyMMdd" />
<%-- /WebContent/project1/board/free.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �Խ���</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/project1/css/project.css">
</head>
<body>
<form>
	<table>
		<tr><td colspan="4" style="text-align: left"><font size="5">${b.subject }</font></td></tr>
		<tr><td colspan="2" style="text-align: left">${b.id }</td>
			<td colspan="2" style="text-align: right"><fmt:formatDate value="${b.regdate }" pattern="yy-MM-dd HH:mm:ss" /></td></tr>
		<tr><td colspan="4"><table style="width: 100%; height: 250px;">
					<tr><td style="border-width: 0px; vertical-align: mid; text-align: left;">${b.content }</td></tr>
				</table>
			</td></tr>
		<tr><td>÷������</td>
			<td colspan="3" style="text-align: left">
			<c:if test="${!empty b.file }">
				<a href="file/${b.file }">${b.file }</a>
			</c:if>
			<c:if test="${empty b.file }">
				&nbsp;&nbsp;&nbsp;
			</c:if>
			</td></tr>
			<tr><td colspan="4" style="text-align: left">���[${commcnt }]&nbsp;&nbsp;&nbsp;��ȸ�� ${b.readcnt }&nbsp;&nbsp;&nbsp;��õ�� ${b.likecnt }</td></tr>
		
	<c:forEach var="comm" items="${commlist }">
	<c:if test="${comm.num == b.num }">
		<tr><td>${comm.id }</td><td style="text-align: left; vertical-align: center;">${comm.content }</td>
			<td><fmt:formatDate var="rdate" value="${comm.regdate }" pattern="yyyyMMdd" />
			<c:if test="${today == rdate }">
				<fmt:formatDate value="${comm.regdate }" pattern="HH:mm:ss" />
			</c:if>
			<c:if test="${today != rdate }">
				<fmt:formatDate value="${comm.regdate }" pattern="yy-MM-dd HH:mm:ss" />
			</c:if></td>
			<td><a href="commentdel.do?no=${comm.no }&num=${b.num }" onclick="return commDel('${comm.id }', '${sessionScope.login }')">����</a></td></tr>
			</c:if>
	</c:forEach>
		<tr><td colspan="2"><input type="text" name="content" id="content" style="width: 700px"></td>
			<td><input type="button" value="�Է�" id="commentadd">
				<input type="button" value="��õ" onclick="like()"></td></tr>
		<tr><td colspan="4">
				<a href="freereplyForm.do?num=${param.num }"><input type="button" value="��� ����"></a>
			<c:if test="${login == b.id }">
				<a href="updateForm.do?num=${b.num }"><input type="button" value="����"></a>
				<a href="deleteForm.do?num=${b.num }%bclass=${b.bclass }"><input type="button" value="����"></a>
			</c:if>
				<a href="boardlist.do?bclass=${b.bclass }"><input type="button" value="���"></a>
			</td>
		</tr>
	</table>
	<input type="hidden" value="${b.num }" id="num">
	<input type="hidden" value="${sessionScope.login }" id="id">
</form>

<script type="text/javascript">
		$(document).ready(function(){
			$('#commentadd').click(function(){
				if($('#id').val() == "") {
					alert("�α��� �� �̿��� �ּ���.");
				} else {
					if($('#content').val() == "") {
						alert("��� ������ �Է��ϼ���.");
					} else {
						$.ajax({
							url : "commentadd.do",
							type : "post",
							data : {
								num : $("#num").val(),
								id : $("#id").val(),
								content : $("#content").val()
							},
							success : function(data) {
								location.reload();
							}
						});
					}
				}
				
			});
		});
		function commDel(id, login) {
			if(login == id) {
				var message = confirm(login + "����� ���� �����Ͻðڽ��ϱ�?");
				if(message == true) {
					return true;
				} else {
					return false;
				}
			} else {
				alert("�ڽ��� ��۸� ������ �����մϴ�.");
				return false;
			}
		}
	</script>


</body>
</html>