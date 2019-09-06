<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/board/informationForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>정보 글쓰기</title>
<script type="text/javascript">
	function board_submit() {
		f = document.f;
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
		if(f.psub.value == "") {
			alert("연극 제목을 입력하세요.");
			f.psubject.focus();
			return;
		}
		if(f.pcon.value == "") {
			alert("연극 내용을 입력하세요.");
			f.content.focus();
			return;
		}
		f.submit();
	}
	function win_upload() {
		var op = "width=500, height=150, left=50, top=150";
		open("fileUploadForm.jsp", "", op);
	}
</script>
</head>
<body>
	<form action="write.do" method="post" enctype="multipart/form-data" name="f">
		<input type="hidden" name="bclass" value="${param.bclass }">
		<input type="hidden" name="picture" value="">
		<table>
			<tr><td>제목</td><td><input type="text" name="subject" value="[연극 정보] "></td></tr>
			<tr><td>작성자</td><td><input type="text" name="id" value="${sessionScope.login }"></td></tr>
			<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
			<tr><td colspan="2">
					<img src="" width="100" height="120" id="poster"><br>
					<font size="1"><a href="javascript:win_upload()">[포스터 등록]</a></font>
				</td></tr>
			<tr><td>연극 장르</td>
				<td><select name="genre">
						<option>장르</option>
						<option value="로맨스">로맨스</option>
						<option value="공포">공포</option>
						<option value="드라마">드라마</option>
						<option value="판타지">판타지</option>
						<option value="추리스릴러">추리스릴러</option>
					</select></td>
			<tr><td>연극 제목</td><td><input type="text" name="psub"></td></tr>
			<tr><td>연극 내용</td><td><textarea name="pcon"></textarea></td></tr>
			<tr><td>연극 출연진</td><td><input type="text" name="cast"></td></tr>
			<tr><td>연극 일정</td><td><input type="date" name="schedule1"> ~ <input type="date" name="schedule2"></td></tr>
			<tr><td colspan="2"><a href="javascript:board_submit()"><input type="button" value="게시물 등록"></a></td></tr>
		</table>
	</form>
</body>
</html>