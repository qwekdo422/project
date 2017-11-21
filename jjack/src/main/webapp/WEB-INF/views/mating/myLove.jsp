<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>♥선택의 시간</title>
<%-- ====================== 필수  ======================  --%>
<link rel="stylesheet" href="../css/common/header.css" />
<link rel="stylesheet" href="../css/common/footer.css" />
<link rel="stylesheet" href="../css/alert/alertify.core.css" />
<link rel="stylesheet" href="../css/alert/alertify.default.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../js/alert/alertify.min.js"></script>
<%-- ====================== 필수  ======================  --%>
<link rel="stylesheet" href="../css/mating/myLove.css" />
<script src="../js/mating/myLove.js"></script>
</head>
<body style="margin:0 auto;">
	<div id="header">
		<jsp:include page="../common/header.jsp" />
	</div>
	<div class="container">
		<h2 class="text-center mt-4">♥ 한명을 선택하세요</h2>
		<div class="container row mt-4 mb-5 ml-1">
			<c:forEach var="p" items="${myLoves}">
				<div class="col-xs-2 mx-auto">
					<figure class="figure">
						<img src="../file/${p.pic}" class="figure-img img-fluid">
						<figcaption class="text-center">${p.nick}</figcaption>
						<input type="hidden" class="gno" value="${p.gno}">
					</figure>
				</div>
			</c:forEach>
		</div>
		<!-- 사진들 div 종료 -->
		
		<div class="row container mb-5" id="btns">
			<div class="col-md-6 mx-auto">
				<form method="POST" action="../mating/Loved.do">
					<input type="hidden" name="myGno" value="${myGno}">
					<input type="hidden" name="myLove" id="myLove" value="">
					<input type="button" class="btn btn-danger btn-lg col-lg-7 mr-5 mb-3" id="chooseBtn" value="선택">
					<input type="button" class="btn btn-info btn-lg col-lg-3 mb-3" id="noBtn" value="변경">
				</form>
			</div>
		</div>
	</div>
	<!--  /.container -->
	<!---------------------------------------------->
	<div id="footer">
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>