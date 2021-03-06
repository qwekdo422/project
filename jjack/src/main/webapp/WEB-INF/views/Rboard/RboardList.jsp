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
	$("#rBtn").click(function(){
	//후기 남기기 버튼 누르면 글쓰기 폼으로 가진다. 
		$(location).attr("href","../Rboard/RboardForm.do"); 
		
	}); 
	
	//검색 버튼 누르면 검색결과가 목록으로 나온다. 
 		$("#sBtn").click(function(){
		
		$("#search").submit(); 
	}); 
});


</script>








<body style="margin:0 auto;">
   <div id="header">
      <jsp:include page="../common/header.jsp" />
   </div>
      <div class="container">
      
<!-- 목록보여주고 -->
<table class="table table-hover table-striped table-bordered mt-4">
					<tr align="center">
						<th>번호</th>
						<th width=40% >제목</th>				
						<th width=10%>기수</th>
						<th width=10%>작성자</th>
						<th>작성일</th>
						<th width=10%>짝</th>
						<th>조회수</th>
					</tr>					
					<c:forEach var="data" items="${RLIST}">
					<tr>
						<td>${data.rno}</td>
						<td class="title"><a href="../Rboard/rHitUpProc.do?rno=${data.rno}&nowPage=${nowPage}">${data.rtitle}</a></td>
						<td>기수?</td>
						<td>작성자?</td>
						<td>${data.rdate}</td>
						<td>짝?</td>
						<td>${data.rhis}</td>
					</tr>
					</c:forEach>
</table>
				
				
				
<%-- 페이징 처리하고 --%>
<table width="1000"  align="center">
		<tr>
			<td align="center">
				<%--	[이전] --%>
				<c:if test="${nowPage ne 1}"><!--'nowPage=1 이 맨 앞으로' 니까nowPage가 1이 아닐 때만 보이게 하자.  -->
						<a href="../Rboard/RboardList.do?nowPage=1">[맨 앞으로]</a>
				</c:if>		
				<c:if test="${(startPage eq 1 || startPage ne 1) && nowPage ne 1}"><%-- ★★ nowPage가 1페이지면 [이전] 버튼이 사라지는 로직--%>
						<a href="../Rboard/RboardList.do?nowPage=${nowPage -1}">[이전]</a>
				</c:if>
				
				<%--	[1][2][3] --%>
				<c:forEach var="page" begin="${startPage}" end="${endPage}">
					<a href="../Rboard/RboardList.do?nowPage=${page}">[${page}]</a>
				</c:forEach>
			
				<%--	[다음] --%>
				<c:if test="${endPage ne totalPage || nowPage ne totalPage}">
					<%--<c:if test="${endPage ne totalPage || endPage eq totalPage}"> --%>
					<a href="../Rboard/RboardList.do?nowPage=${nowPage + 1}">[다음]</a>	
				</c:if>

				<c:if test="${nowPage ne totalPage}"><!-- 맨 뒤로 가면 맨뒤로 이 버튼을 없애고 싶다. -->
					<a href="../Rboard/RboardList.do?nowPage=${totalPage}">[맨 뒤로]</a>	
				</c:if>
			</td>
		</tr>
</table>




<%-- 후기남기기 버튼 --%>
<c:if test="${sessionScope.Auth eq '4'}"><!-- session이 있을때면 이 버튼이 보이도록 조치한다. -->
	<div align="center">
		<input type="button" id="rBtn" value="후기 남기기" align="center">	
	<div>
</c:if>
			
<%-- 검색창 --%>
<form method="post"   id="search" action="../Rboard/RboardSearch.do">
		<table align="center">
				<tr>
					<td>
						<select id="kind" name="kind">
							<option value="rtitle">제목</option>
							<option value="rcontents">내용</option>
							<option value="rgisu">기수</option>
							<option value="rdate">작성일</option>
							<option value="both">제목+내용</option>
							<input type="text" id="rsearch" name="rsearch">
							<input type="button" id="sBtn" value="검색">
						</select>
					</td>
				</tr>
		</table>
</form>			
				
		</div>
   <div id="footer">
      <jsp:include page="../common/footer.jsp" />
   </div>
</body>
</html>