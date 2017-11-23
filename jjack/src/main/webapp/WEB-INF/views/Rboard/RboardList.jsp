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
	//버튼 누르면 글쓰기 폼으로 가진다. 
		$(location).attr("href","../Rboard/RboardForm.do"); 
		
	}); 
});
</script>








<body style="margin:0 auto;">
   <div id="header">
      <jsp:include page="../common/header.jsp" />
   </div>
      <div class="container">
      
<!-- 목록보여주고 -->
<table width="1100" border="1" align="center">
					<tr align="center">
						<th>번호</th>
						<th width=40% >제목</th>				
						<th width=10%>기수</th>
						<th width=10%>작성자</th>
						<th width=10%>짝</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<%-- 
					<c:forEach var="data" items="${???}">
					<tr>
						<td>${data.rno}</td>
						<td>${data.rtitle}</td>
						<td>${???}</td>
						<td>${data.rid}</td>
						<td>${???}</td>
						<td>${data.rdate}</td>
						<td>${data.rhit}</td>
					</tr>
					</c:forEach>
					--%>
</table>
				
				
				
<%-- 페이징 처리하고 --%>
<table>

</table>



<%-- 후기남기기 버튼 --%>
<c:if test="${!empty sessionScope.UID}"><!-- session이 있을때면 이 버튼이 보이도록 조치한다. -->
	<div align="center">
		<input type="button" id="rBtn" value="후기 남기기" align="center">	
	<div>
</c:if>
			
<%-- 검색창 --%>
<form method="post" action="">
		<table align="center">
				<tr>
					<td>
						<select id="kind" name="kind">
							<option value="rtitle">제목</option>
							<option value="rcontents">내용</option>
							<option value="rgisu">기수</option>
							<option value="rdate">작성일</option>
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