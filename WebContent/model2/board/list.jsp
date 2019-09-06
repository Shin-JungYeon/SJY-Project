<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="day" class="java.util.Date" />  <%-- Date 클래스 객체를 만들어서 day라는 참조변수로 참조. 속성(pageContext)에 등록도 해줌. --%>
<fmt:formatDate var="today" value="${day }" pattern="yyyyMMdd" />  <%-- 오늘 날짜를 해당 pattern으로 가져옴. --%>
<%-- /WebContent/model2/board/list.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 목록 보기</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
<script type="text/javascript">
	function listcall(page) {
		document.sf.pageNum.value = page;  //함수를 호출한 곳에서 pageNum이 있으면 그 값을 받고
		document.sf.submit();  //form에서 두 개의 파라미터까지 받아서 list.do로 전송.
	}
</script>
</head>
<body>
	<form action="list.do" method="post" name="sf">
		<input type="hidden" name="pageNum" value="1">
		<table>
			<tr><td style="border-width: 0px;">
					<select name="column">
						<option value="">선택하세요</option>
						<option value="subject">제목</option>
						<option value="name">작성자</option>
						<option value="content">내용</option>
						<option value="subcon">제목+내용</option>
					</select>
					<script>
						document.sf.column.value = "${param.column}";
					</script>
					<input type="text" name="find" value="${param.find}" style="width: 300px;">
					<input type="submit" value="검색">
				</td>
			</tr>
		</table>
	</form>
	<table>
		<caption>MODEL2 게시판 목록</caption>
		<c:if test="${boardcount == 0 }">
			<tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
		</c:if>
		<c:if test="${boardcount > 0 }">
			<tr><td colspan="5" style="text-align:right">게시물 수 : ${boardcount }</td></tr>
			<tr><th width="8%">번호</th>
				<th width="50%">제목</th>
				<th width="14%">작성자</th>
				<th width="17%">등록일</th>
				<th width="11%">조회수</th>
			</tr>
			<c:forEach var="b" items="${list }">
				<tr><td>${boardnum }</td>
					<td style="text-align: left">
					<c:set var="boardnum" value="${boardnum - 1 }" />
					<c:if test="${!empty b.file1 }">  <%-- 첨부파일 존재. --%>
						<a href="file/${b.file1 }" style="text-decoration: none;">@</a>
					</c:if>
					<c:if test="${empty b.file1 }">
						&nbsp;&nbsp;&nbsp;
					</c:if>
					<c:if test="${b.reflevel > 0 }">
						<c:forEach var="i" begin="1" end="${b.reflevel }">
						  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>└ 
					</c:if>
						<a href="info.do?num=${b.num }">${b.subject }</a>
					</td>
					<td>${b.name }</td>
					<td>
						<fmt:formatDate var="rdate" value="${b.regdate }" pattern="yyyyMMdd" />
						<c:if test="${today == rdate }">  <%-- 오늘 날짜. --%>
							<fmt:formatDate value="${b.regdate }" pattern="HH:mm:ss" />
						</c:if>
						<c:if test="${today != rdate }">
							<fmt:formatDate value="${b.regdate }" pattern="yy-MM-dd HH:mm:ss" />
						</c:if>
					</td>
					<td>${b.readcnt }</td>
				</tr>
			</c:forEach>
			
			<%-- 페이지 처리 부분 --%>
			<tr><td colspan="5" style="text-align: center">
			<c:if test="${pageNum <= 1 }">
				[이전]
			</c:if>
			<c:if test="${pageNum > 1 }">
				<a href="javascript:listcall(${pageNum - 1 })">[이전]</a>
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
				[다음]
			</c:if>
			<c:if test="${pageNum < maxpage }">
				<a href="javascript:listcall(${pageNum + 1 })">[다음]</a>
			</c:if>
				</td></tr>
		
		</c:if>
			<tr><td colspan="5" style="text-align:right"><a href="writeForm.do">[글쓰기]</a></td></tr>
	</table>
</body>
</html>

