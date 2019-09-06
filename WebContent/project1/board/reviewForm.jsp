<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/board/reviewForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리뷰 글쓰기</title>
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
		if(f.content.value == "") {
			alert("내용을 입력하세요.");
			f.content.focus();
			return;
		}
		f.submit();
	}
</script>
<style type="text/css">
	select {
		width: 85px;
	}
</style>
</head>
<body>
	<form action="write.do" method="post" enctype="multipart/form-data" name="f">
		<input type="hidden" name="bclass" value="${param.bclass }">
		<table>
			<tr><td><select name="genre">
						<option>장르</option>
						<option value="로맨스">로맨스</option>
						<option value="공포">공포</option>
						<option value="드라마">드라마</option>
						<option value="판타지">판타지</option>
						<option value="추리스릴러">추리스릴러</option>
					</select></td>
				<td><input type="date" name="watchdate"></td>
				<td><select name="watchloc">
						<option>관람지역</option>
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="인천">인천</option>
						<option value="부산">부산</option>
					</select></td>
				<td><select name="grade">
						<option>평점</option>
						<option value="1">★☆☆☆☆</option>
						<option value="2">★★☆☆☆</option>
						<option value="3">★★★☆☆</option>
						<option value="4">★★★★☆</option>
						<option value="5">★★★★★</option>
					</select>
				</td></tr>
		<tr><td>작성자</td><td colspan="3"><input type="text" name="id" value="${sessionScope.login }"></td></tr>
		<tr><td>비밀번호</td><td colspan="3"><input type="password" name="pass"></td></tr>
		<tr><td>제목</td><td colspan="3"><input type="text" name="subject"></td></tr>
		<tr><td>내용</td><td colspan="3"><textarea rows="15" name="content"></textarea></td></tr>
		<tr><td>첨부파일</td><td colspan="3"><input type="file" name="file"></td></tr>
		<tr><td colspan="4" style="text-align: right"><a href="javascript:board_submit()"><input type="button" value="게시물 등록"></a></td></tr>
		</table>
		
	</form>
</body>
</html>