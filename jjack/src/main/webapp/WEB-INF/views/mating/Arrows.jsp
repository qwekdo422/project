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
<script src="../js/mating/Arrows.js"></script>
<script>
	// 선택을 아직 하지 않은 사람 수
	var allClear = ${numbers.tCount} -${numbers.cCount};
	
	// 선 그리기
	function drawLine(e){
		e[0].beginElement();
		e[1].beginElement();
	}
	
</script>
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
 						<c:forEach var="ml" items="${mList}" varStatus="vs">
							<div class="col-xs-2 mx-auto">
								<figure class="figure">
									<img src="../file/${ml.pic}" class="figure-img img-fluid">
									<figcaption class="text-center">${ml.nick}</figcaption>
									<input type="hidden" class="lno" value="${ml.loveNo}">
								</figure>
							</div>
						</c:forEach>
					</div>
					<!-- 남자리스트 영역 종료 -->
					
					<div id="arrowsDiv" class="col-lg-8">
					
						<svg xmlns="http://www.w3.org/2000/svg" version="1.1">
							<g>
								<!-- 남자 선 -->
								<line x1="10" x2="10" y1="70" y2="70" class="mLine">
									<animate attributeName='x2' attributeType='XML' to='510' begin='indefinite' dur='1s' fill='freeze' />
									<animate class="y2anm" attributeName='y2' attributeType='XML' to='' begin='indefinite' dur='1s' fill='freeze' />
								</line>
								<line x1="10" x2="10" y1="225" y2="225" class="mLine" >
									<animate attributeName='x2' attributeType='XML' to='510' begin='indefinite' dur='1s'  fill='freeze' />
									<animate class="y2anm" attributeName='y2' attributeType='XML' to='' begin='indefinite' dur='1s' fill='freeze' />
								</line>
								<line x1="10" x2="10" y1="385" y2="385" class="mLine" >
									<animate attributeName='x2' attributeType='XML' to='510' begin='indefinite' dur='1s'  fill='freeze' />
									<animate class="y2anm" attributeName='y2' attributeType='XML' to='' begin='indefinite' dur='1s' fill='freeze' />
								</line>
								<line x1="10" x2="10" y1="540" y2="540" class="mLine" >
									<animate attributeName='x2' attributeType='XML' to='510' begin='indefinite' dur='1s'  fill='freeze' />
									<animate class="y2anm" attributeName='y2' attributeType='XML' to='' begin='indefinite' dur='1s' fill='freeze' />
								</line>
								<line x1="10" x2="10" y1="695" y2="695" class="mLine" >
									<animate attributeName='x2' attributeType='XML' to='510' begin='indefinite' dur='1s'  fill='freeze' />
									<animate class="y2anm" attributeName='y2' attributeType='XML' to='' begin='indefinite' dur='1s' fill='freeze' />
								</line>
								<!-- 여자 선 -->
								<line x1="510" x2="510" y1="70" y2="70" class="fLine" >
									<animate attributeName='x2' attributeType='XML' to='10' begin='indefinite' dur='1s'  fill='freeze' />
									<animate class="y2anm" attributeName='y2' attributeType='XML' to='' begin='indefinite' dur='1s' fill='freeze' />
								</line>
								<line x1="510" x2="510" y1="225" y2="225" class="fLine" >
									<animate attributeName='x2' attributeType='XML' to='10' begin='indefinite' dur='1s'  fill='freeze' />
									<animate class="y2anm" attributeName='y2' attributeType='XML' to='' begin='indefinite' dur='1s' fill='freeze' />
								</line>
								<line x1="510" x2="510" y1="385" y2="385" class="fLine" >
									<animate attributeName='x2' attributeType='XML' to='10' begin='indefinite' dur='1s'  fill='freeze' />
									<animate class="y2anm" attributeName='y2' attributeType='XML' to='' begin='indefinite' dur='1s' fill='freeze' />
								</line>
								<line x1="510" x2="510" y1="540" y2="540" class="fLine" >
									<animate attributeName='x2' attributeType='XML' to='10' begin='indefinite' dur='1s'  fill='freeze' />
									<animate class="y2anm" attributeName='y2' attributeType='XML' to='' begin='indefinite' dur='1s' fill='freeze' />
								</line>
								<line x1="510" x2="510" y1="695" y2="695" class="fLine" >
									<animate attributeName='x2' attributeType='XML' to='10' begin='indefinite' dur='1s'  fill='freeze' />
									<animate class="y2anm" attributeName='y2' attributeType='XML' to='' begin='indefinite' dur='1s' fill='freeze' />
								</line>
							</g>
							<!-- 남자 원 -->
							<circle cx="10" cy="70" r="6" class="mCircle" />
							<circle cx="10" cy="225" r="6" class="mCircle" />
							<circle cx="10" cy="385" r="6" class="mCircle" />
							<circle cx="10" cy="540" r="6" class="mCircle" />
							<circle cx="10" cy="695" r="6" class="mCircle" />
							<!-- 여자 원 -->
							<circle cx="510" cy="70" r="6" class="fCircle" />
							<circle cx="510" cy="225" r="6" class="fCircle" />
							<circle cx="510" cy="385" r="6" class="fCircle" />
							<circle cx="510" cy="540" r="6" class="fCircle" />
							<circle cx="510" cy="695" r="6" class="fCircle" />
						</svg>
					
					</div>
					<!-- 사랑의 작대기 영역 종료 -->
					
					<div id="women" class="col-lg-2">
 						<c:forEach var="fl" items="${fList}">
							<div class="col-xs-2 mx-auto">
								<figure class="figure">
									<img src="../file/${fl.pic}" class="figure-img img-fluid">
									<figcaption class="text-center">${fl.nick}</figcaption>
									<input type="hidden" class="lno" value="${fl.loveNo}">
								</figure>
							</div>
						</c:forEach>
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