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
<link rel="stylesheet" href="../css/intro/intro.css" />
</head>
<body style="margin:0 auto;">
	<div id="header">
		<jsp:include page="../common/header.jsp" />
	</div>
	<div class="container">
		<!-- Page Content -->
		<div class="row mt-4">
 			<!-- 서브메뉴 -->
			<div class="col-lg-3 mb-4">
				<h2>소개</h2><br />
				<div class="list-group text-right">
					<a href="../intro/thisGHis.do" class="list-group-item"><img src="../img/common/logo.png" id="introLogo"><br>게스트하우스는</a> 
					<a href="../intro/schedule.do" class="list-group-item">애정촌 일정</a> 
					<a href="../intro/rules.do" class="list-group-item active">애정촌 십계명</a>
				</div>
			</div>
			<!-- 본 화면 -->
		 	<div id="introMain" class="col-lg-9">
				<img id="rules" src="../img/intro/rules.jpg" class="introImg mb-4">
			</div>
			<!-- 본 화면 -->
		</div>
		<!-- 전체 화면 -->
	</div>
	<!--  /.container -->
	<div id="footer">
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>