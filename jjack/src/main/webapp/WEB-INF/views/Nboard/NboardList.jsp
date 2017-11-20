<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>짝 게스트하우스</title>
	<%-- ====================== 필수  ======================  --%>
	<link rel="stylesheet" href="../css/common/header.css" />
	<link rel="stylesheet" href="../css/common/footer.css" />
	<link rel="stylesheet" href="../css/alert/alertify.core.css" />
	<link rel="stylesheet" href="../css/alert/alertify.default.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="../js/alert/alertify.min.js"></script>
	<%-- ====================== 필수  ======================  --%>
</head>
<script>
$(document).ready(function(){
	$("#sBtn").click(function(){

		$(location).attr("href", "../Nboard/NboardForm.do"); 
	});
}); 

</script>
<body style="margin:0 auto;">
   <div id="header">
      <jsp:include page="../common/header.jsp" />
   </div>
      <div class="container">
			<!--목록보여주기-->
				<table width="1000" border="1" align="center">
					<tr>
						<th>번호</th>
						<th>작성일</th>
						<th>제목</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="data" items="${NLIST}">
					<tr>
						<td>${data.nno}</td>
						<td>${data.nday}</td>
						<td><a href="../Nboard/HitUpProc.do?nno=${data.nno}&nowPage=${NPINFO.nowPage}">${data.ntitle}</a></td>
						<td>${data.nhits}</td>
					</tr>
					</c:forEach>
				</table>

			
		
			
			
				<div align="center">
				<c:if test="${sessionScope.UID eq 'admin'}">
				<input type="button" value="글쓰기" id="sBtn">
				</c:if>
				</div>
			
			
			
			<!-- 페이지이동기능 만들고 -->
				<table width="1000" border="1" align="center">
		<tr>
			<td align="center">
				<%--	[이전] --%>
				
				<c:if test="${NPINFO.startPage eq 1}">
					[이전]
				</c:if>
				<c:if test="${NPINFO.startPage ne 1}">
					<a href="">[이전]</a>
				</c:if>
				<%--	[1][2][3] --%>
				<c:forEach var="page" begin="${NPINFO.startPage}" end="${NPINFO.endPage}">
					<a href="../Nboard/NboardList.do?nowPage=${page}">[${page}]</a>
				</c:forEach>
				
				<%--	[다음] --%>
				<c:if test="${NPINFO.endPage eq NPINFO.totalPage}">
					<a href="../Nboard/NboardList.do?nowPage=${NPINFO.nowPage + 1}">[다음]</a>
				</c:if>
				<c:if test="${NPINFO.endPage ne NPINFO.totalPage}">
					<a href="">[다음]</a>
				</c:if>
			</td>
		</tr>
	</table>
			
			
			<!--검색상자 만들기 -->
		</div>
   <div id="footer">
      <jsp:include page="../common/footer.jsp" />
   </div>
</body>
</html>