<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/board/replyForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>답글 쓰기 화면</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
<script type="text/javascript">
	function submit() {
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
		if(f.content.value == "") {
			alert("내용을 입력하세요.");
			f.content.focus();
			return;
		}
		f.submit();
	} 
</script>
</head>
<body>
	<form action="reply.do" method="post" name="f">
	<%-- 원글에 대한 정보 : num, ref, reflevel(0~999), refstep --%>
		<input type="hidden" name="num" value="${b.num }">
		<input type="hidden" name="ref" value="${b.ref }">
		<input type="hidden" name="reflevel" value="${b.reflevel }">
		<input type="hidden" name="refstep" value="${b.refstep }">
		<table>
			<caption>MODEL2 게시판 답글 등록</caption>
			<%-- 답글에 대한 정보 : name, pass, content. subject는 원글의 제목 가져옴. --%>
			<tr><td>글쓴이</td><td><input type="text" name="name"></td></tr>
			<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
			<tr><td>제목</td><td><input type="text" name="subject" value="RE : ${b.subject }"></td></tr>
			<tr><td>내용</td><td><textarea name="content" rows="15"></textarea></td></tr>
			<tr><td colspan="2"><a href="javascript:document.f.submit()">[답변글 등록]</a></td></tr>
		</table>
	</form>
</body>
</html>