<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="day" class="java.util.Date" />
<fmt:formatDate var="today" value="${day }" pattern="yyyyMMdd" />
<%-- WebContent/project1/board/notice.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�������� �Խ���</title>
<link rel="stylesheet" href="/project1/css/project.css">
<script type="text/javascript">
	function listcall(page) {
		document.sf.pageNum.value = page;
		document.sf.submit();
	}
</script>
</head>
<body>
	<%-- �Խñ� �˻� --%>
	<div>
		<form action="" method="post" name="sf">
			<input type="hidden" name="pageNum" value="1">
			<input type="hidden" name="bclass" value="${param.bclass }">
			<table>
				<tr>
					<td>
						<select name="column">
							<option value="">�����ϼ���</option>
							<option value="content">����</option>
						</select>
					</td>
					<td><input type="text" name="find" value="${param.find }" style="width: 300px;" ></td>
					<td><input type="submit" value="�˻�"></td>
				</tr>
			</table>
			<script type="text/javascript">
				document.sf.column.value = "${param.column}";
			</script>
		</form>
	</div>
	
	
	<div>
	<%-- �Խñ� ��� --%>
	<c:if test="${boardcount > 0 }">
			<div class="board_title">
				<table>
					<tr>
					<c:choose>
						<c:when test="${param.bclass==2 || param.bclass==3 }">
							<td colspan="5"></td>
						</c:when>
						<c:otherwise>
							<td colspan="4"></td>
						</c:otherwise>
					</c:choose>
							<td><font size="2">�Խù� �� : ${boardcount }</font></td></tr>
						<tr><th>No.</th><th>����</th><th>�ۼ���</th><th>�����</th><th>��ȸ��</th>
						<c:if test="${param.bclass==2 || param.bclass==3 }">
							<th>��õ��</th>
						</c:if>
						</tr>
					<c:forEach var="b" items="${list }">
						<tr><td>${boardnum }</td>
							<td>
							<c:set var="boardnum" value="${boardnum - 1 }" />
							<c:if test="${!empty b.file }">
								<a href="file/${b.file }" style="text-decoration: none;">@</a>
							</c:if>
							<c:if test="${empty b.file }">
								&nbsp;&nbsp;&nbsp;
							</c:if>
							<c:if test="${b.reflevel > 0 }">
								<c:forEach var="i" begin="1" end="${b.reflevel }">
								  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</c:forEach>�� 
							</c:if>
							<c:if test="${b.bclass == 0 }">	
								<a href="notice.do?num=${b.num }&bclass=${b.bclass }">${b.subject }</a>
							</c:if>
							<c:if test="${b.bclass == 1 }">	
								<a href="pnotice.do?num=${b.num }&bclass=${b.bclass }">${b.subject }</a>
							</c:if>
							<c:if test="${b.bclass == 2 }">	
								<a href="review.do?num=${b.num }&bclass=${b.bclass }">${b.subject }</a>
							</c:if>
							<c:if test="${b.bclass == 3 }">	
								<a href="information.do?num=${b.num }&bclass=${b.bclass }">${b.subject }</a>
							</c:if>
							<c:if test="${b.bclass == 4 }">	
								<a href="free.do?num=${b.num }&bclass=${b.bclass }">${b.subject }</a>
							</c:if>
							</td>
							<td>${b.id }</td>
							<td>
								<fmt:formatDate var="rdate" value="${b.regdate }" pattern="yyyyMMdd" />
							<c:if test="${today == rdate }">
								<fmt:formatDate value="${b.regdate }" pattern="HH:mm:ss" />
							</c:if>
							<c:if test="${today != rdate }">
								<fmt:formatDate value="${b.regdate }" pattern="yy-MM-dd HH:mm:ss" />
							</c:if>
							</td>
							<td>${b.readcnt }</td>
						<c:if test="${b.bclass==2 || b.bclass==3 }">
							<td>${b.likecnt }</td>
						</c:if>
						</tr>
					</c:forEach>
					
			<%-- ������ ��ȣ --%>
					<tr>
						<td colspan="6">
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
						<c:if test="${pageNum < maxpage }">
							<a href="javascript:listcall(${pageNum +1 })">[����]</a>
						</c:if>
						<c:if test="${pageNum >= maxpage }">
							[����]
						</c:if>
						</td>
					</tr>
					
			<%-- ���� �Խ��� --%>
			<c:if test="${param.bclass == 0 }">
				<c:if test="${mclass == 0 }">
					<tr><td colspan="4"></td>
						<td>
							<form action="noticeForm.do" method="post" name="wf">
								<input type="hidden" name="bclass" value="${param.bclass }">
								<input type="submit" value="�۾���">
								<input type="hidden" name="bclass" value="${param.bclass }">
								<input type="hidden" name="id" value="${sessionScope.login }">
							</form>
						</td>
					</tr>
				</c:if>
			</c:if>
			
			<%-- ����Ʈ �Խ��� --%>
			<c:if test="${param.bclass == 1 }">
				<c:if test="${mclass == 0 }">
					<tr>
						<td colspan="5" style="text-align: right">
							<form action="pnoticeForm.do" method="post" name="wf">
								<input type="hidden" name="bclass" value="${param.bclass }">
								<input type="submit" value="�۾���">
								<input type="hidden" name="bclass" value="${param.bclass }">
								<input type="hidden" name="id" value="${sessionScope.login }">
							</form>
						</td>
					</tr>
				</c:if>
				
		<div>
			<form action="pitemForm.do" method="post" >
				<table style="width: 70%">
					<tr><th>��� ����Ʈ</th><th>����Ʈ ��� ����</th><th>��û</th>
					<c:if test="${mclass == 0 }">
						<th>����</th>
					</c:if>
					</tr>
				<c:forEach var="p" items="${plist }">
					<tr><td>${p.point }</td><td>${p.name }</td><td><a href="pointaskForm.do?no=${p.no }">��û</a></td>
					<c:if test="${mclass == 0 }">
						<td><a href="pitemDel.do?no=${p.no }&bclass=${param.bclass }" onclick="return pitemDel('${p.name}')">����</a></td>
					</c:if>
					
					</tr>
				</c:forEach>
				<c:if test="${sessionScope.login == 'admin' }">
					<tr><td colspan="5" style="text-align: right"><input type="submit" value="��ǰ �߰�"></td></tr>
				</c:if>
				</table>		
			</form>
		</div>
			</c:if>
			
			<%-- ���� �Խ��� --%>
			<c:if test="${param.bclass == 2 }">
				<c:if test="${mclass == 1 }">
					<tr><td colspan="5"></td>
						<td>
							<form action="reviewForm.do" method="post" name="wf">
								<input type="hidden" name="bclass" value="${param.bclass }">
								<input type="submit" value="�۾���">
								<input type="hidden" name="id" value="${sessionScope.login }">
							</form>
						</td>
					</tr>
				</c:if>
			</c:if>
			
			<%-- ���� �Խ��� --%>
			<c:if test="${param.bclass == 3 }">
				<c:if test="${mclass == 2 }">
					<tr><td colspan="5"></td>
						<td>
							<form action="informationForm.do" method="post" name="wf">
								<input type="hidden" name="bclass" value="${param.bclass }">
								<input type="submit" value="�۾���">
								<input type="hidden" name="id" value="${sessionScope.login }">
							</form>
						</td>
					</tr>
				</c:if>
			</c:if>	
			
			<%-- ���� �Խ��� --%>
			<c:if test="${param.bclass == 4 }">
					<tr><td colspan="4"></td>
						<td>
							<form action="freeForm.do" method="post" name="wf">
								<input type="hidden" name="bclass" value="${param.bclass }">
								<input type="submit" value="�۾���">
								<input type="hidden" name="id" value="${sessionScope.login }">
							</form>
						</td>
					</tr>
		
			</c:if>
				</table>
			</div>
		</c:if>
	</div>
	
	<script>
		function pitemDel(pname) {
			var message = confirm(pname + " ��ǰ�� ���� �����Ͻðڽ��ϱ�?");
			if(message == true) {
				return true;
			} else {
				return false;
			}
		}
	</script>
</body>
</html>