<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="day" class="java.util.Date" />  <%-- Date Ŭ���� ��ü�� ���� day��� ���������� ����. �Ӽ�(pageContext)�� ��ϵ� ����. --%>
<fmt:formatDate var="today" value="${day }" pattern="yyyyMMdd" />  <%-- ���� ��¥�� �ش� pattern���� ������. --%>
<%-- /WebContent/model2/board/list.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� ��� ����</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
<script type="text/javascript">
	function listcall(page) {
		document.sf.pageNum.value = page;  //�Լ��� ȣ���� ������ pageNum�� ������ �� ���� �ް�
		document.sf.submit();  //form���� �� ���� �Ķ���ͱ��� �޾Ƽ� list.do�� ����.
	}
</script>
</head>
<body>
	<form action="list.do" method="post" name="sf">
		<input type="hidden" name="pageNum" value="1">
		<table>
			<tr><td style="border-width: 0px;">
					<select name="column">
						<option value="">�����ϼ���</option>
						<option value="subject">����</option>
						<option value="name">�ۼ���</option>
						<option value="content">����</option>
						<option value="subcon">����+����</option>
					</select>
					<script>
						document.sf.column.value = "${param.column}";
					</script>
					<input type="text" name="find" value="${param.find}" style="width: 300px;">
					<input type="submit" value="�˻�">
				</td>
			</tr>
		</table>
	</form>
	<table>
		<caption>MODEL2 �Խ��� ���</caption>
		<c:if test="${boardcount == 0 }">
			<tr><td colspan="5">��ϵ� �Խù��� �����ϴ�.</td></tr>
		</c:if>
		<c:if test="${boardcount > 0 }">
			<tr><td colspan="5" style="text-align:right">�Խù� �� : ${boardcount }</td></tr>
			<tr><th width="8%">��ȣ</th>
				<th width="50%">����</th>
				<th width="14%">�ۼ���</th>
				<th width="17%">�����</th>
				<th width="11%">��ȸ��</th>
			</tr>
			<c:forEach var="b" items="${list }">
				<tr><td>${boardnum }</td>
					<td style="text-align: left">
					<c:set var="boardnum" value="${boardnum - 1 }" />
					<c:if test="${!empty b.file1 }">  <%-- ÷������ ����. --%>
						<a href="file/${b.file1 }" style="text-decoration: none;">@</a>
					</c:if>
					<c:if test="${empty b.file1 }">
						&nbsp;&nbsp;&nbsp;
					</c:if>
					<c:if test="${b.reflevel > 0 }">
						<c:forEach var="i" begin="1" end="${b.reflevel }">
						  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>�� 
					</c:if>
						<a href="info.do?num=${b.num }">${b.subject }</a>
					</td>
					<td>${b.name }</td>
					<td>
						<fmt:formatDate var="rdate" value="${b.regdate }" pattern="yyyyMMdd" />
						<c:if test="${today == rdate }">  <%-- ���� ��¥. --%>
							<fmt:formatDate value="${b.regdate }" pattern="HH:mm:ss" />
						</c:if>
						<c:if test="${today != rdate }">
							<fmt:formatDate value="${b.regdate }" pattern="yy-MM-dd HH:mm:ss" />
						</c:if>
					</td>
					<td>${b.readcnt }</td>
				</tr>
			</c:forEach>
			
			<%-- ������ ó�� �κ� --%>
			<tr><td colspan="5" style="text-align: center">
			<c:if test="${pageNum <= 1 }">
				[����]
			</c:if>
			<c:if test="${pageNum > 1 }">
				<a href="javascript:listcall(${pageNum - 1 })">[����]</a>
			</c:if>
			<c:forEach var="a" begin="${startpage }" end="${endpage }">
				<c:if test="${a == pageNum }">		
					[${a }]
				</c:if>
				<c:if test="${a != pageNum }">
					<a href="javascript:listcall(${a })">[${a }]</a>
				</c:if>
			</c:forEach>
			<c:if test="${pageNum >= maxpage }">
				[����]
			</c:if>
			<c:if test="${pageNum < maxpage }">
				<a href="javascript:listcall(${pageNum + 1 })">[����]</a>
			</c:if>
				</td></tr>
		
		</c:if>
			<tr><td colspan="5" style="text-align:right"><a href="writeForm.do">[�۾���]</a></td></tr>
	</table>
</body>
</html>

