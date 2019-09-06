<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/member/info.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 보기</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
</head>
<body>
	<table>
		<caption>MODEL2 회원 정보 보기</caption>
		<tr>
			<td rowspan="6">
				<img src="img/${mem.picture }" width="100" height="120">
			</td>
			<td>아이디</td><td>${mem.id }</td>
		</tr>
		<tr><td>이름</td><td>${mem.name }</td></tr>
		<tr><td>성별</td><td>${mem.gender==1?"남자":"여자" }</td></tr>
		<tr><td>전화번호</td><td>${mem.tel }</td></tr>
		<tr><td>이메일</td><td>${mem.email }</td></tr>
		<tr><td colspan="2">
				<a href="updateForm.me?id=${mem.id }">[수정]</a>
				<c:if test="${mem.id != 'admin' }">
					<a href="deleteForm.me?id=${mem.id }">[탈퇴]</a>
				</c:if>
			</td>
		</tr>
	</table>
</body>
</html>