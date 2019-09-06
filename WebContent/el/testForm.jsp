<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/el/testForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>test Form</title>
</head>
<body>
	<form action="test.jsp" method="post">
		이름 : <input type="text" name="name"><br>
		나이 : <input type="text" name="age"><br>
		성별 : <input type="radio" name="gender" value="1" checked>남
			 <input type="radio" name="gender" value="2">여<br>
		출생년도 : <select name="year">
					<% for(int i=1981; i<=2019; i++) { %>
						<option><%=i %></option>
					<% } %>
				</select><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>