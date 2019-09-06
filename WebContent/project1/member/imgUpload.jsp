<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/member/imgUpload.jsp --%>
<script>
	img = opener.document.getElementById("pic");  //opener : joinForm.jsp 의 id가 pic인 태그를 선택해서 보여줘.
	img.src = "img/${filename }";  //업로드 된 이미지를 회원가입 화면에 출력.
	opener.document.f.picture.value = "${filename }";  //파라미터에 파일이름 설정.
	self.close();  //현재 윈도우창 닫기.
</script>