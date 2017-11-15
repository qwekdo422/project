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
<body style="margin:0 auto;">
   <div id="header">
      <jsp:include page="../common/header.jsp" />
   </div>
      <div class="container">
			<!-- 검색상자 만들고 -->
			<!-- 목록보여주고 -->
			<form method="post"  id="nfrm" action="">
				<table width="1000" border="1" align="center">
					<tr>
						<th>번호</th>
						<th>작성일</th>
						<th>제목</th>
						<th>조회수</th>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</form>
			
			
			
			
			<!-- 페이지이동기능 만들고 -->
			<!-- 기타기능만들고 -->
		</div>
   <div id="footer">
      <jsp:include page="../common/footer.jsp" />
   </div>
</body>
</html>