<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/board/posterUpload.jsp --%>
<script>
	img = opener.document.getElementById("poster");
	img.src = "file/${filename }";
	opener.document.f.picture.value = "${filename }";
	self.close();
</script>