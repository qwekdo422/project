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
	<style>
		figure {
			border: 1px solid black;
			display:inline-block;
			transition:filter 1s, transform 1s;
			perspective: 100px;
		}
		figure img {
			width:150px;
			height:150px;
			border-bottom:1px solid black;
			cursor:pointer;
		}
		figcaption {
			cursor:pointer;
		}
		#btns {
			display:none;
		}
	</style>
	<script>
$(document).ready(function(){
	var who = 0;
	$('figure img, figcaption').click(function(){
		if(who==0) {
			who = $("figure").index($(this).parent())+1;
			$('#choose').val(who);
			$('figure').not($(this).parent()).css('filter', 'grayscale(100%)');
			$('#btns').delay(700).slideDown(400);
		}
	});
	
	$('#noBtn').click(function(){
		$('#choose').val("");
		who=0;
		$('figure').css('filter', 'grayscale(0%)');
		$('#btns').slideUp(400);
	});
	
	$('#chooseBtn').click(function(){
		$('figure').not($('figure')[who-1]).css('transform', 'rotate3d(1,1,0,90deg)').delay(1000).queue(function(){
			
		});
		
	});

});

	</script>
</head>
<body style="margin:0 auto;">
	<div id="header">
		<jsp:include page="../common/header.jsp" />
	</div>
	<div class="container">
		<h2 class="text-center mt-4">♥ 한명을 선택하세요</h2>
		<div class="container-fluid row mt-4 mb-5">
			<div class="col-xs-2 mx-auto">
				<figure class="figure">
					<img src="../img/guests/03.jpg" class="figure-img img-fluid">
					<figcaption class="text-center">여자 1호</figcaption>
				</figure>
			</div>
			<div class="col-xs-2 mx-auto">
				<figure class="figure">
					<img src="../img/guests/04.jpg" class="figure-img img-fluid polaroid">
					<figcaption class="text-center">여자 2호</figcaption>
				</figure>
			</div>
			<div class="col-xs-2 mx-auto">
				<figure class="figure">
					<img src="../img/guests/12.jpg" class="figure-img img-fluid polaroid">
					<figcaption class="text-center">여자 3호</figcaption>
				</figure>
			</div>
			<div class="col-xs-2 mx-auto">
				<figure class="figure">
					<img src="../img/guests/14.jpg" class="figure-img img-fluid polaroid">
					<figcaption class="text-center">여자 4호</figcaption>
				</figure>
			</div>
			<div class="col-xs-2 mx-auto">
				<figure class="figure">
					<img src="../img/guests/16.jpg" class="figure-img img-fluid polaroid">
					<figcaption class="text-center">여자 5호</figcaption>
				</figure>
			</div>
		</div>
		<!-- 사진들 div 종료 -->
		
		<div class="row container mb-5" id="btns">
			<div class="col-md-6 mx-auto">
				<button class="btn btn-danger btn-lg col-lg-7 mr-5 mb-3" id="chooseBtn">선택</button>
				<button class="btn btn-info btn-lg col-lg-3 mb-3" id="noBtn">변경</button>
			</div>
		</div>
		<form method="POST" action=""><input type="hidden" name="choose" id="choose" value=""></form>
	</div>
	<!--  /.container -->
	<!---------------------------------------------->
	<div id="footer">
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>