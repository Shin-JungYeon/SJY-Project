<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/member/imgUpload.jsp --%>
<script>
	img = opener.document.getElementById("pic");  //opener : joinForm.jsp �� id�� pic�� �±׸� �����ؼ� ������.
	img.src = "img/${filename }";  //���ε� �� �̹����� ȸ������ ȭ�鿡 ���.
	opener.document.f.picture.value = "${filename }";  //�Ķ���Ϳ� �����̸� ����.
	self.close();  //���� ������â �ݱ�.
</script>