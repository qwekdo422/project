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
<table class="table table-hover table-striped table-bordered mt-4">
			<tr align="center">
				<th >번호</th>
				<th >작성일</th>
				<th width="60%">제목</th>
				<th>조회수</th>
			</tr>
				<c:forEach var="data" items="${NLIST}">
			<tralign="center">
				<td align="center">${data.nno}</td>
				<td align="center">${data.nday}</td>
				<td><a href="../Nboard/HitUpProc.do?nno=${data.nno}&nowPage=${nowPage}">${data.ntitle}</a></td>
				<td align="center">${data.nhits}</td>
			</tr>
				</c:forEach>
</table>
				
			
<!-- 페이징 처리 -->
<nav aria-label="Page navigation">
	<ul class="pagination justify-content-center">
		<%--	[이전] --%>
		<c:if test="${nowPage ne 1}"><!--'nowPage=1 이 맨 앞으로' 니까nowPage가 1이 아닐 때만 보이게 하자.  -->
			<li class="page-item"><a class="page-link" href="../Nboard/NboardList.do?nowPage=1">맨 앞으로</a></li>
		</c:if>		
		<c:if test="${(startPage eq 1 || startPage ne 1) && nowPage ne 1}"><%-- ★★ nowPage가 1페이지면 [이전] 버튼이 사라지는 로직--%>
			<li class="page-item"><a class="page-link" href="../Nboard/NboardList.do?nowPage=${nowPage -1}">이전</a></li>
		</c:if>
		<!-- [1][2][3] -->
		<c:forEach var="page" begin="${startPage}" end="${endPage}">
			<li class="page-item <c:if test="${nowPage eq page}">active</c:if>">
				<a class="page-link" href="../Nboard/NboardList.do?nowPage=${page}">${page}</a>
			</li>
		</c:forEach>
		<%--	[다음] --%>
		<c:if test="${endPage ne totalPage || nowPage ne totalPage}">
			<%--<c:if test="${endPage ne totalPage || endPage eq totalPage}"> --%>
			<li class="page-item"><a class="page-link" href="../Nboard/NboardList.do?nowPage=${nowPage + 1}">다음</a></li>
		</c:if>

		<c:if test="${nowPage ne totalPage}"><!-- 맨 뒤로 가면 맨뒤로 이 버튼을 없애고 싶다. -->
			<li class="page-item"><a class="page-link" href="../Nboard/NboardList.do?nowPage=${totalPage}">맨 뒤로</a></li>
		</c:if>
	</ul>
</nav>
			
			
<!-- 글쓰기 버튼 -->
<div align="center">
		<c:if test="${sessionScope.UID eq 'admin'}">
				<input type="button" value="글쓰기" id="sBtn" class="btn btn-info">
		</c:if>
</div>
			
			
			
			
			<%--검색상자 : 나중에 연습해라			
			<form method="post" action="">
			<table width="800" align="center">
					<tr>
						<td align="center">
							<select id="kind" name="kind"><!-- kind에 따라서 value값이 정해지겠지 -->
								<option value="ntitle">제목</option>
								<option value="ncontents">본문</oprtion>
								<option value="nday">날짜</option>
								<option value="all">전체검색</option>
						 </select>
						 		<input type="text" id="search" name="search" >
						 		<input type="submit" id="sBtn" value="검색">
						</td>
					</tr>
			</table>			
			</form>
			--%>

			
		</div>
   <div id="footer">
      <jsp:include page="../common/footer.jsp" />
   </div>
</body>
</html>