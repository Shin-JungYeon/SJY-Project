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
		�̸� : <input type="text" name="name"><br>
		���� : <input type="text" name="age"><br>
		���� : <input type="radio" name="gender" value="1" checked>��
			 <input type="radio" name="gender" value="2">��<br>
		����⵵ : <select name="year">
					<% for(int i=1981; i<=2019; i++) { %>
						<option><%=i %></option>
					<% } %>
				</select><br>
		<input type="submit" value="����">
	</form>
</body>
</html>