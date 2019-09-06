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
<title>공지사항 게시판</title>
<link rel="stylesheet" href="/project1/css/project.css">
<script type="text/javascript">
	function listcall(page) {
		document.sf.pageNum.value = page;
		document.sf.submit();
	}
</script>
</head>
<body>
	<%-- 게시글 검색 --%>
	<div>
		<form action="" method="post" name="sf">
			<input type="hidden" name="pageNum" value="1">
			<input type="hidden" name="bclass" value="${param.bclass }">
			<table>
				<tr>
					<td>
						<select name="column">
							<option value="">선택하세요</option>
							<option value="content">내용</option>
						</select>
					</td>
					<td><input type="text" name="find" value="${param.find }" style="width: 300px;" ></td>
					<td><input type="submit" value="검색"></td>
				</tr>
			</table>
			<script type="text/javascript">
				document.sf.column.value = "${param.column}";
			</script>
		</form>
	</div>
	
	
	<div>
	<%-- 게시글 목록 --%>
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
							<td><font size="2">게시물 수 : ${boardcount }</font></td></tr>
						<tr><th>No.</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th>
						<c:if test="${param.bclass==2 || param.bclass==3 }">
							<th>추천수</th>
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
								</c:forEach>└ 
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
					
			<%-- 페이지 번호 --%>
					<tr>
						<td colspan="6">
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
						<c:if test="${pageNum < maxpage }">
							<a href="javascript:listcall(${pageNum +1 })">[다음]</a>
						</c:if>
						<c:if test="${pageNum >= maxpage }">
							[다음]
						</c:if>
						</td>
					</tr>
					
			<%-- 공지 게시판 --%>
			<c:if test="${param.bclass == 0 }">
				<c:if test="${mclass == 0 }">
					<tr><td colspan="4"></td>
						<td>
							<form action="noticeForm.do" method="post" name="wf">
								<input type="hidden" name="bclass" value="${param.bclass }">
								<input type="submit" value="글쓰기">
								<input type="hidden" name="bclass" value="${param.bclass }">
								<input type="hidden" name="id" value="${sessionScope.login }">
							</form>
						</td>
					</tr>
				</c:if>
			</c:if>
			
			<%-- 포인트 게시판 --%>
			<c:if test="${param.bclass == 1 }">
				<c:if test="${mclass == 0 }">
					<tr>
						<td colspan="5" style="text-align: right">
							<form action="pnoticeForm.do" method="post" name="wf">
								<input type="hidden" name="bclass" value="${param.bclass }">
								<input type="submit" value="글쓰기">
								<input type="hidden" name="bclass" value="${param.bclass }">
								<input type="hidden" name="id" value="${sessionScope.login }">
							</form>
						</td>
					</tr>
				</c:if>
				
		<div>
			<form action="pitemForm.do" method="post" >
				<table style="width: 70%">
					<tr><th>사용 포인트</th><th>포인트 사용 내용</th><th>신청</th>
					<c:if test="${mclass == 0 }">
						<th>삭제</th>
					</c:if>
					</tr>
				<c:forEach var="p" items="${plist }">
					<tr><td>${p.point }</td><td>${p.name }</td><td><a href="pointaskForm.do?no=${p.no }">신청</a></td>
					<c:if test="${mclass == 0 }">
						<td><a href="pitemDel.do?no=${p.no }&bclass=${param.bclass }" onclick="return pitemDel('${p.name}')">삭제</a></td>
					</c:if>
					
					</tr>
				</c:forEach>
				<c:if test="${sessionScope.login == 'admin' }">
					<tr><td colspan="5" style="text-align: right"><input type="submit" value="상품 추가"></td></tr>
				</c:if>
				</table>		
			</form>
		</div>
			</c:if>
			
			<%-- 리뷰 게시판 --%>
			<c:if test="${param.bclass == 2 }">
				<c:if test="${mclass == 1 }">
					<tr><td colspan="5"></td>
						<td>
							<form action="reviewForm.do" method="post" name="wf">
								<input type="hidden" name="bclass" value="${param.bclass }">
								<input type="submit" value="글쓰기">
								<input type="hidden" name="id" value="${sessionScope.login }">
							</form>
						</td>
					</tr>
				</c:if>
			</c:if>
			
			<%-- 정보 게시판 --%>
			<c:if test="${param.bclass == 3 }">
				<c:if test="${mclass == 2 }">
					<tr><td colspan="5"></td>
						<td>
							<form action="informationForm.do" method="post" name="wf">
								<input type="hidden" name="bclass" value="${param.bclass }">
								<input type="submit" value="글쓰기">
								<input type="hidden" name="id" value="${sessionScope.login }">
							</form>
						</td>
					</tr>
				</c:if>
			</c:if>	
			
			<%-- 자유 게시판 --%>
			<c:if test="${param.bclass == 4 }">
					<tr><td colspan="4"></td>
						<td>
							<form action="freeForm.do" method="post" name="wf">
								<input type="hidden" name="bclass" value="${param.bclass }">
								<input type="submit" value="글쓰기">
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
			var message = confirm(pname + " 상품을 정말 삭제하시겠습니까?");
			if(message == true) {
				return true;
			} else {
				return false;
			}
		}
	</script>
</body>
</html>