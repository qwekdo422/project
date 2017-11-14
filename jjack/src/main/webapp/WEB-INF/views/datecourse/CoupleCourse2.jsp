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

<script type="text/javascript">

$(function(){

	$('.btn_east_course').click(function(){
		$('.btn_word').show();
	});
	$('.btn_west_course').click(function(){
		$('.btn_west_map').show();
	});	
	$('.btn_south_course').click(function(){
		$('.btn_south_map').show();
	});
});

</script>
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
				<h2><데이트 코스></h2><br />
				<div class="list-group text-right">
					<a href="../datecourse/BasicCourse.do" class="list-group-item">기본 코스</a> 
					<a href="../datecourse/CoupleCourse.do" class="list-group-item">커풀 데이트 코스</a>
					<a href="../datecourse/SoloCourse.do" class="list-group-item">솔로 코스</a>
				</div>
			</div>
			<!-- 본 화면 -->
		 	<div id="CoupleMain" class="col-lg-9">
				
				<!-- 
				<button class="btn_east_course" style="padding:0px"><img src="../img/datecourse/east_course.png"></button>
				 -->
				<button onclick='open_in_frame("https://m.naver.com")'style="padding:0px"><img src="../img/datecourse/east_course.png"></button>
				<br>
				<br>
				<button class="btn_west_course" style="padding:0px"><img src="../img/datecourse/west_course.png"></button>
				<br>
				<br>
				<button class="btn_south_course" style="padding:0px"><img src="../img/datecourse/south_course.png"></button>
				<br>
				<br>

				
				<iframe id ="east_frame"></iframe>
			
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