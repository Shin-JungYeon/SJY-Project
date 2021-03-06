<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="day" class="java.util.Date" />
<fmt:formatDate var="today" value="${day }" pattern="yyyyMMdd" />
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<style>
   body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif;}
   .w3-third img{margin-bottom: -6px; opacity: 0.8; cursor: pointer}
   .w3-third img:hover{opacity: 1}
   input[type=button], input[type=submit] {
      border: none;
      color: white;
      padding: 4px 10px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 14px;
   }
</style>
<script type="text/javascript">
   function listcall(page) {
      document.sf.pageNum.value = page;
      document.sf.submit();
   }
</script>
<title>내 정보</title>
<link rel="stylesheet" href="${path }/css/project.css">
</head>
<body class="w3-light-grey w3-content" style="max-width:2400px">

	<nav class="w3-sidebar w3-bar-block w3-white w3-text-grey w3-collapse w3-top w3-center" style="z-index:3;width:300px;font-weight:bold" id="mySidebar"><br>
		<h3 class="w3-padding-32 w3-center"><a href="../board/main.do" style="text-decoration: none"><b>Jeang's<br>Play</b></a></h3>
		<a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-hide-large">CLOSE</a>
		<a href="info.me?id=${sessionScope.login }" onclick="w3_close()" class="w3-bar-item w3-button">정보 상세보기</a> 
	
	<%-- 관리자 --%>
	<c:if test="${mclass == 0 }">
		<a href="infoMem.me?mclass=1" onclick="w3_close()" class="w3-bar-item w3-button">일반 회원 목록</a> 
		<a href="infoMem.me?mclass=2" onclick="w3_close()" class="w3-bar-item w3-button">공연관계자 회원 목록</a>
		<a href="infoJoinReq.me" onclick="w3_close()" class="w3-bar-item w3-button">회원가입 요청 내역</a>
		<a href="infoPointReq.me" onclick="w3_close()" class="w3-bar-item w3-button">포인트 신청 내역</a>
	</c:if>
	
	<%-- 일반 회원 --%>
		<c:if test="${mclass == 1 }">
		<a href="myboardinfo.do?id=${mem.id }" onclick="w3_close()" class="w3-bar-item w3-button">작성글 관리</a> 
		<a href="pointinfo.do?id=${mem.id }" onclick="w3_close()" class="w3-bar-item w3-button">포인트 관리</a>
	</c:if>
	
	<%-- 관계자 회원 --%>
	<c:if test="${mclass == 2 }">
		<a href="myboardinfo.do?id=${mem.id }" onclick="w3_close()" class="w3-bar-item w3-button">작성글 관리</a> 
		<a href="careerinfo.do?id=${mem.id }" onclick="w3_close()" class="w3-bar-item w3-button">이력 관리</a>
	</c:if>	
	</nav>
   

   <!-- Overlay effect when opening sidebar on small screens -->
   <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
   
   <div class="w3-center" style="margin-left:35%;margin-top:10%;">
		<div style = "margin-top: 50px; margin:auto; max-width: 1450px; min-width:700px;">


		<form action="" method="post" name="sf">
			<input type="hidden" name="pageNum" value="1">
			<input type="hidden" name="bclass" value="${param.bclass }">
			<table>
				<tr>
					<td>
						<select name="column">
							<option value="">선택하세요</option>
							<option value="content">내용</option>
						</select>
					</td>
					<td><input type="text" name="find" value="${param.find }" style="width: 300px;" ></td>
					<td><input type="submit" value="검색"></td>
				</tr>
			</table>
			<script type="text/javascript">
				document.sf.column.value = "${param.column}";
			</script>
		</form>





   <div>
   <%-- 게시글 목록 --%>
	<div class="board_title">
		<table>
			<tr>
				<td colspan="6" style="text-align: right"><font size="2">게시물 수 : ${boardcount }</font></td></tr>
                  <tr><th>No.</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th><th>추천수</th>
                  </tr>
               <c:forEach var="b" items="${myblist }">
                  <tr><td>${boardnum }</td>
                     <td>
                     <c:set var="boardnum" value="${boardnum - 1 }" />
                     <c:if test="${!empty b.file }">
                        <a href="file/${b.file }" style="text-decoration: none;">@</a>
                     </c:if>
                     <c:if test="${empty b.file }">
                        &nbsp;&nbsp;&nbsp;
                     </c:if>
                     <c:if test="${b.reflevel > 0 }">
                        <c:forEach var="i" begin="1" end="${b.reflevel }">
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </c:forEach>└ 
                     </c:if>
                     <c:if test="${b.bclass == 0 }">   
                        <a href="../board/notice.do?num=${b.num }&bclass=${b.bclass }">${b.subject }</a>
                     </c:if>
                     <c:if test="${b.bclass == 1 }">   
                        <a href="../board/pnotice.do?num=${b.num }&bclass=${b.bclass }">${b.subject }</a>
                     </c:if>
                     <c:if test="${b.bclass == 2 }">   
                        <a href="../board/review.do?num=${b.num }&bclass=${b.bclass }">${b.subject }</a>
                     </c:if>
                     <c:if test="${b.bclass == 3 }">   
                        <a href="../board/information.do?num=${b.num }&bclass=${b.bclass }">${b.subject }</a>
                     </c:if>
                     <c:if test="${b.bclass == 4 }">   
                        <a href="../board/free.do?num=${b.num }&bclass=${b.bclass }">${b.subject }</a>
                     </c:if>
                     </td>
                     <td>${b.id }</td>
                     <td>
                        <fmt:formatDate var="rdate" value="${b.regdate }" pattern="yyyyMMdd" />
                     <c:if test="${today == rdate }">
                        <fmt:formatDate value="${b.regdate }" pattern="HH:mm:ss" />
                     </c:if>
                     <c:if test="${today != rdate }">
                        <fmt:formatDate value="${b.regdate }" pattern="yy-MM-dd HH:mm:ss" />
                     </c:if>
                     </td>
                     <td>${b.readcnt }</td>
                  <c:if test="${b.bclass==2 || b.bclass==3 }">
                     <td>${b.likecnt }</td>
                  </c:if>
                  <c:if test="${b.bclass==4 }">
                  	<td>x</td>
                  </c:if>
                  </tr>
               </c:forEach>
     
              </table></div>
               </div>
      
   </div>
   </div>
   
   <!-- Push down content on small screens --> 
   <div class="w3-hide-large" style="margin-top:83px"></div>

   <div class="w3-black w3-center w3-bottom w3-padding-24">Made by <a href="../board/main.do" title="W3.CSS" target="_blank" class="w3-hover-opacity">Jaeng</a></div>
   
   <script>
   // Script to open and close sidebar
   function w3_open() {
      document.getElementById("mySidebar").style.display = "block";
      document.getElementById("myOverlay").style.display = "block";
   }

   function w3_close() {
      document.getElementById("mySidebar").style.display = "none";
      document.getElementById("myOverlay").style.display = "none";
   }
   </script>
</body>
</html>