<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<!-- Page Content -->
		<div class="row mt-4">
 			<!-- 서브메뉴 -->
			<div class="col-lg-3">
				<h2>짝짓기</h2><br />
				<div class="list-group text-right">
					<a href="../mating/forLunch.do" class="list-group-item">도시락 사다리</a> 
					<a href="../mating/Arrows.do" class="list-group-item">사랑의 작대기</a>
					<a href="../mating/myLove.do" class="list-group-item">[임시]짝선택</a>
				</div>
			</div>
			<!-- 본 화면 -->
		 	<div id="introMain" class="col-lg-9">
				
				
				<!-- 여기에 사랑의 작대기 -->
				
				
			</div>
			<!-- 본 화면 -->
		</div>
		<!-- 전체 화면 -->
	</div>
	<!--  /.container -->
	<!---------------------------------------------->
	<div id="footer">
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>