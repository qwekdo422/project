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
<link rel="stylesheet" href="../css/mating/Arrows.css" />
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
				<div class="row">
				
					<div id="men" class="col-lg-2">
					
<%-- 						<c:forEach var="ml" items="${menList}">
							<div class="col-xs-2 mx-auto">
								<figure class="figure">
									<img src="../file/${ml.pic}" class="figure-img img-fluid">
									<figcaption class="text-center">${ml.nick}</figcaption>
									<input type="hidden" class="gno" value="${ml.gno}">
								</figure>
							</div>
						</c:forEach> --%>
						<div class="col-xs-2 mx-auto">
							<figure class="figure">
								<img src="../file/21.jpg" class="figure-img img-fluid">
								<figcaption class="text-center">남자 1호</figcaption>
								<input type="hidden" class="gno" value="21">
							</figure>
						</div>
						<div class="col-xs-2 mx-auto">
							<figure class="figure">
								<img src="../file/22.jpg" class="figure-img img-fluid">
								<figcaption class="text-center">남자 2호</figcaption>
								<input type="hidden" class="gno" value="22">
							</figure>
						</div>
						<div class="col-xs-2 mx-auto">
							<figure class="figure">
								<img src="../file/23.jpg" class="figure-img img-fluid">
								<figcaption class="text-center">남자 3호</figcaption>
								<input type="hidden" class="gno" value="23">
							</figure>
						</div>
						<div class="col-xs-2 mx-auto">
							<figure class="figure">
								<img src="../file/24.jpg" class="figure-img img-fluid">
								<figcaption class="text-center">남자 4호</figcaption>
								<input type="hidden" class="gno" value="24">
							</figure>
						</div>
						<div class="col-xs-2 mx-auto">
							<figure class="figure">
								<img src="../file/25.jpg" class="figure-img img-fluid">
								<figcaption class="text-center">남자 5호</figcaption>
								<input type="hidden" class="gno" value="25">
							</figure>
						</div>
						
					</div>
					<!-- 남자리스트 영역 종료 -->
					
					<div id="arrowsDiv" class="col-lg-8">
					작대기 영역
					
					
					
					
					</div>
					<!-- 사랑의 작대기 영역 종료 -->
					
					<div id="women" class="col-lg-2">
					
						<div class="col-xs-2 mx-auto">
							<figure class="figure">
								<img src="../file/1.jpg" class="figure-img img-fluid">
								<figcaption class="text-center">여자 1호</figcaption>
								<input type="hidden" class="gno" value="1">
							</figure>
						</div>
						<div class="col-xs-2 mx-auto">
							<figure class="figure">
								<img src="../file/2.jpg" class="figure-img img-fluid">
								<figcaption class="text-center">여자 2호</figcaption>
								<input type="hidden" class="gno" value="2">
							</figure>
						</div>
						<div class="col-xs-2 mx-auto">
							<figure class="figure">
								<img src="../file/3.jpg" class="figure-img img-fluid">
								<figcaption class="text-center">여자 3호</figcaption>
								<input type="hidden" class="gno" value="3">
							</figure>
						</div>
						<div class="col-xs-2 mx-auto">
							<figure class="figure">
								<img src="../file/4.jpg" class="figure-img img-fluid">
								<figcaption class="text-center">여자 4호</figcaption>
								<input type="hidden" class="gno" value="4">
							</figure>
						</div>
						<div class="col-xs-2 mx-auto">
							<figure class="figure">
								<img src="../file/5.jpg" class="figure-img img-fluid">
								<figcaption class="text-center">여자 5호</figcaption>
								<input type="hidden" class="gno" value="5">
							</figure>
						</div>
					
					</div>
					<!-- 여자리스트 종료 -->
				
				</div>
				<!-- row -->
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