<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/member/list.jsp --%>		
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 목록 조회</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
<script type="text/javascript">
	function del(id) {
		if(confirm(id + "님을 정말로 탈퇴 시키시겠습니까?") == true) {
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
						<option value="">선택하세요</option>
						<option value="id">아이디</option>
						<option value="name">이름</option>
						<option value="tel">전화</option>
					</select>
					<script>
						document.sf.column.value = "${param.column}";
					</script>
					<input type="text" name="find" value="${param.find}" style="width: 300px;">
					<input type="submit" value="검색">
				</td>
			</tr>
		</table>
		<table>
			<caption>MODEL2 회원 목록</caption>
			<tr><th>사진</th><th>아이디</th><th>이름</th><th>성별</th><th>전화번호</th><th>&nbsp;</th></tr>
			<c:forEach var="m" items="${list }">
				<tr><td><img src="img/${m.picture }" width="30" height="40"></td>
					<td><a href="info.me?id=${m.id }">${m.id }</a></td>
					<td>${m.name }</td>
					<td>${m.gender==1?"남자":"여자" }</td>
					<td>${m.tel }</td>
					<td><a href="updateForm.me?id=${m.id }">[수정]</a>
					<c:if test="${m.id != 'admin' }">
						<a href="javascript:del('${m.id }')">[강제탈퇴]</a>
					</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>
