<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/board/freeForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 작성</title>
<script type="text/javascript">
	function board_submit() {
		f = document.f;
		if(f.name.value == "") {
			alert("글쓴이를 입력하세요.");
			f.name.focus();
			return;
		}
		if(f.pass.value == "") {
			alert("비밀번호를 입력하세요.");
			f.pass.focus();
			return;
		}
		if(f.subject.value == "") {
			alert("제목을 입력하세요.");
			f.subject.focus();
			return;
		}
		if(f.content.value == "") {
			alert("내용을 입력하세요.");
			f.content.focus();
			return;
		}
		f.submit();
	}
</script>
<style type="text/css">
	input[type=text], input[type=password] {
		width: 385px;
	}
</style>
</head>
<body>
	<form action="write.do" method="post" enctype="multipart/form-data" name="f">
		<input type="hidden" name="bclass" value="${param.bclass }">
		<table>
			<tr><td>작성자</td><td><input type="text" name="id" value="${sessionScope.login }"></td></tr>
			<tr><td>제목</td><td><input type="text" name="subject"></td></tr>
			<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
			<tr><td>내용</td><td><textarea rows="15" cols="45" name="content"></textarea></td></tr>
			<tr><td>첨부파일</td><td><input type="file" name="file"></td></tr>
			<tr><td colspan="2"><a href="javascript:board_submit()"><input type="button" value="게시물 등록"></a></td></tr>
		</table>
	</form>
</body>
</html>