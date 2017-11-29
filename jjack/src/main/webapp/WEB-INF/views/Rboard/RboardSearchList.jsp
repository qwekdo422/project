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
	var searchTotalList= $("#searchTotalList"); 
	if(searchTotalList == 0){
		alert("검색결과가 없습니다.");
		$(location).attr("href" , "../Rboard/RboardList.do"); 
	}
	
}); 

</script>
<body style="margin:0 auto;">
   <div id="header">
      <jsp:include page="../common/header.jsp" />
   </div>
      <div class="container">
		
<!-- 목록보여주고 -->
<input type="hidden" id="searchTotalList" value=${TOTAL}>
<table class="table table-hover table-striped table-bordered mt-4">
					<tr align="center">
						<th>번호</th>
						<th width=40% >제목</th>				
						<th width=10%>기수</th>
						<th width=10%>작성자</th>
						<th width=10%>짝</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>					
					<c:forEach var="data" items="${SLIST}" varStatus="st">
					<tr>
						<td align="center">${(PINFO.nowPage - 1) * PINFO.listCount + st.count}</td>
						<td class="title"><a href="../Rboard/rHitUpProc.do?rno=${data.rno}&nowPage=${nowPage}">${data.rtitle}</a><c:if test="${data.recnt ne 0}">&nbsp;&nbsp;<span class="badge badge-secondary">${data.recnt}</span></c:if></td>
						<td align="center">${data.gisoo}</td>
						<td align="center">${data.nickname} </td>
						<td align="center">${data.jjackname}</td>
						<td align="center">${data.rdate}</td>
						<td align="center">${data.rhis}</td>
					</tr>
					</c:forEach>
</table>


<%-- 페이징 처리하고 --%>
<%-- <table width="1000"  align="center">
		<tr>
			<td align="center">
					[이전]
				<c:if test="${PINFO.nowPage ne 1}"><!--'nowPage=1 이 맨 앞으로' 니까nowPage가 1이 아닐 때만 보이게 하자.  -->
						<a href="../Rboard/RboardSearch.do?nowPage=1">[맨 앞으로]</a>
				</c:if>		
				<c:if test="${(PINFO.startPage eq 1 || PINFO.startPage ne 1) && PINFO.nowPage ne 1}">★★ nowPage가 1페이지면 [이전] 버튼이 사라지는 로직
						<a href="../Rboard/RboardSearch.do?nowPage=${PINFO.nowPage -1}">[이전]</a>
				</c:if>
				
					[1][2][3]
				<c:forEach var="page"  begin="${PINFO.startPage}" end="${PINFO.endPage}">
					<a href="../Rboard/RboardSearch.do?nowPage=${page}" >[${page}]</a>
				</c:forEach>
			
					[다음]
				<c:if test="${PINFO.endPage ne PINFO.totalPage || PINFO.nowPage ne PINFO.totalPage}">
					<c:if test="${endPage ne totalPage || endPage eq totalPage}">
					<a href="../Rboard/RboardSearch.do?nowPage=${PINFO.nowPage + 1}">[다음]</a>	
				</c:if>

				<c:if test="${PINFO.nowPage ne PINFO.totalPage}"><!-- 맨 뒤로 가면 맨뒤로 이 버튼을 없애고 싶다. -->
					<a href="../Rboard/RboardSearch.do?nowPage=${PINFO.totalPage}">[맨 뒤로]</a>	
				</c:if>
			</td>
		</tr>
</table>			 --%>

<nav aria-label="Page navigation">
	<ul class="pagination justify-content-center">
		<%--	[이전] --%>
		<c:if test="${PINFO.nowPage ne 1}"><!--'nowPage=1 이 맨 앞으로' 니까nowPage가 1이 아닐 때만 보이게 하자.  -->
			<li class="page-item"><a class="page-link" href="../Rboard/RboardSearch.do?nowPage=1">맨 앞으로</a></li>
		</c:if>		
		<c:if test="${(PINFO.startPage eq 1 || PINFO.startPage ne 1) && PINFO.nowPage ne 1}"><%-- ★★ nowPage가 1페이지면 [이전] 버튼이 사라지는 로직--%>
			<li class="page-item"><a class="page-link" href="../Rboard/RboardSearch.do?nowPage=${PINFO.nowPage -1}">이전</a></li>
		</c:if>
		<!-- [1][2][3] -->
		<c:forEach var="page"  begin="${PINFO.startPage}" end="${PINFO.endPage}">
			<li class="page-item <c:if test="${PINFO.nowPage eq page}">active</c:if>">
				<a class="page-link"  href="../Rboard/RboardSearch.do?nowPage=${page}">${page}</a>
			</li>
		</c:forEach>
		<%--	[다음] --%>
		<c:if test="${PINFO.endPage ne PINFO.totalPage || PINFO.nowPage ne PINFO.totalPage}">
			<%--<c:if test="${endPage ne totalPage || endPage eq totalPage}"> --%>
			<li class="page-item"><a class="page-link" href="../Rboard/RboardSearch.do?nowPage=${PINFO.nowPage + 1}">다음</a></li>
		</c:if>

<%-- 맨 뒤로 가면 맨뒤로 이 버튼을 없애고 싶다. --%>
		<c:if test="${PINFO.nowPage ne PINFO.totalPage}">
			<li class="page-item"><a class="page-link" href="../Rboard/RboardSearch.do?nowPage=${PINFO.totalPage}">맨 뒤로</a></li>
		</c:if>
	</ul>
</nav>

		</div>
   <div id="footer">
      <jsp:include page="../common/footer.jsp" />
   </div>
</body>
</html>