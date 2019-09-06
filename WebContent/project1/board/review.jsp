<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="day" class="java.util.Date" />
<fmt:formatDate var="today" value="${day }" pattern="yyyyMMdd" />
<%-- /WebContent/project1/board/review.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �Խ���</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script type="text/javascript">
	function like(login, num) {
		location.href="like.do?id=" + login + "&num=" + num;
	}
</script> -->
<link rel="stylesheet" href="/project1/css/project.css">
</head>
<body>
<div>
	<table>
		<tr><td colspan="4" style="text-align: left"><font size="5">${b.subject }</font></td></tr>
		<tr><td colspan="2" style="text-align: left">${b.id }</td>
			<td colspan="2" style="text-align: right"><fmt:formatDate value="${b.regdate }" pattern="yy-MM-dd HH:mm:ss" /></td></tr>
		<tr><td>�帣 : ${b.genre }</td><td>���� ���� : ${b.watchloc }</td><td>���� ��¥ : <fmt:formatDate value="${b.watchdate }" pattern="yyyy-MM-dd" /></td>
			<td>���� : 
				<c:choose>
					<c:when test="${b.grade == 5 }">�ڡڡڡڡ�</c:when>
					<c:when test="${b.grade == 4 }">�ڡڡڡڡ�</c:when>
					<c:when test="${b.grade == 3 }">�ڡڡڡ١�</c:when>
					<c:when test="${b.grade == 2 }">�ڡڡ١١�</c:when>
					<c:otherwise>�ڡ١١١�</c:otherwise>
				</c:choose>
			</td></tr>
		
		<tr><td colspan="4"><table style="width: 100%; height: 250px;">
					<tr><td style="border-width: 0px; vertical-align: mid; text-align: left;">${b.content }</td></tr>
				</table>
			</td></tr>
		<tr><td>÷������</td>
			<td style="text-align: left">
			<c:if test="${!empty b.file }">
				<a href="file/${b.file }">${b.file }</a>
			</c:if>
			<c:if test="${empty b.file }">
				&nbsp;&nbsp;&nbsp;
			</c:if>
			</td></tr>
		<tr><td colspan="4" style="text-align: left">���[${commcnt }]&nbsp;&nbsp;&nbsp;��ȸ�� ${b.readcnt }&nbsp;&nbsp;&nbsp;��õ�� ${b.likecnt }</td></tr>
	
	<%-- ��� ����â --%>
	<c:forEach var="comm" items="${commlist }">
	<c:if test="${comm.num == b.num }">
		<tr><td>${comm.id }</td><td style="text-align: left;">${comm.content }</td>
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
	
	<%-- ��� �Է�â --%>
		<tr><td colspan="3"><input type="text" name="content" id="content" style="width: 700px"></td>
			<td><input type="button" value="�Է�" id="commentadd">
				<input type="button" value="��" onclick="like('${sessionScope.login }', '${b.num }')"></td></tr>
		<tr><td colspan="4" style="text-align: right">
			<c:if test="${login == b.id }">
				<a href="updateForm.do?num=${b.num }&bclass=${b.bclass }"><input type="button" value="����"></a>
				<a href="deleteForm.do?num=${b.num }&bclass=${b.bclass }"><input type="button" value="����"></a>
			</c:if>
				<a href="boardlist.do?bclass=${b.bclass }"><input type="button" value="���"></a></td></tr>
	</table>
	<input type="hidden" value="${b.num }" id="num">
	<input type="hidden" value="${sessionScope.login }" id="id">
	
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
/* 		function edit_${l.seq}(bno, seq) {
			$('#bccontent_${l.seq}').removeAttr('readonly');
			$('#edit_${l.seq}').click(function(){
				if($('#bccontent_${l.seq}').attr('readonly') == null) {
					$.ajax({
						url : 'replyEdit.com',
						type : 'post',
						data : {
							bno : bno,
							seq : seq,
							bccontent : $('#bccontent_${l.seq }').val()
						},
						success : function(data) {
							alert('��������');
							$('#bccontent_${l.seq}').attr('readonly',true);
						}
					});
				} else {
					return;
				}
			});
		} */
	</script>
	</div>
</body>
</html>