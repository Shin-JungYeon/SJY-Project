<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- /jspStudy2/WebContent/jstl/jstlfmtEx3.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fmt 태그 문제</title>
</head>
<body>
	<fmt:requestEncoding value="euc-kr" />  <%-- 인코딩 방식 설정도 가능. --%>
	<form method="post" name="f">
		이름 : <input type="text" name="name" value="${param.name }"><br>
		입사일 : <input type="text" name="hiredate" value="${param.hiredate }">yyyy-MM-dd 형태로 입력<br>
		급여 : <input type="text" name="salary" value="${param.salary }"><br>
		<script type="text/javascript">
			document.f.salary.value = '<fmt:formatNumber value="${param.salary }" pattern="#,###,###" />';
		</script>
		<input type="submit" value="전송">
	</form>
	
	<hr>
	
	이름 : ${param.name }<br>
	입사일 : ${param.hiredate }<br>
	급여 : ${param.salary }<br>
	
	<h3>문제 : 입사일은 yyyy년 MM월 dd일 E요일 형태로 출력하기.<br>
		급여는 세 자리마다 ,를 출력하기.<br>
		연봉은 급여*12로 계산하고, 세 자리마다 ,출력하기.</h3>
	이름 : ${param.name }<br>
	<fmt:parseDate var="date" value="${param.hiredate }" pattern="yyyy-MM-dd" />
	입사일 : <fmt:formatDate value="${date }" pattern="yyyy년 MM월 dd일 E요일" /><br>
	급여 : <fmt:formatNumber value="${param.salary }" pattern="#,###,###" /><br>
	연봉 : <fmt:formatNumber value="${param.salary*12 }" pattern="#,###,###" />
</body>
</html>