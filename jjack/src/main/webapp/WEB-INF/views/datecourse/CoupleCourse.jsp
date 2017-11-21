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
	$('.btn_map_hide').click(function(){
		$('#map_frame').hide();
	});
	$('.btn_food_hide').click(function(){
		$('#food_frame').hide();
	});

});

function open_map_frame(url){
	$('#map_frame').show();
	$('#map_frame').attr('src',url);
}

function open_food_frame(url){
	$('#food_frame').show();
	$('#food_frame').attr('src',url);
}

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
				<h4><커풀 데이트 코스></h4><br />
				<div class="list-group text-right">
					<a href="../datecourse/BasicCourse.do" class="list-group-item">기본 코스</a> 
					<a href="../datecourse/CoupleCourse.do" class="list-group-item">커플 데이트 코스</a>
					<a href="../datecourse/SoloCourse.do" class="list-group-item">솔로 코스</a>
				</div>
			</div>
			<!-- 본 화면 -->
		 	<div id="CoupleMain" class="col-lg-9">
				
			    <!-- Map url -->
				<button onclick='open_map_frame("https://www.google.com/maps/d/embed?mid=1z5yQJh_pAHZ8F8dbyF2qNvtJ1vGTg2r3");
					open_food_frame("https://m.store.naver.com/restaurants/listMap?back=false&category=%EB%B6%84%EC%8B%9D&menu=6&query=%EC%A0%9C%EC%A3%BC%EB%8F%84%20%EB%A7%9B%EC%A7%91&searchQuery=%EC%A0%9C%EC%A3%BC%EB%8F%84%20%EB%A7%9B%EC%A7%91&level=bottom&age=30")' 
					style="padding:0px"><img src="../img/datecourse/east_course.png"></button>
				<br>
				<br>
   			    <button onclick='open_map_frame("https://www.google.com/maps/d/embed?mid=1BNuO89rX3ZuCRCND53p6Gj9pTnzBSzCU");
   			    	open_food_frame("https://m.store.naver.com/restaurants/listMap?back=false&category=%EB%B6%84%EC%8B%9D&menu=6&query=%EC%A0%9C%EC%A3%BC%EB%8F%84%20%EB%A7%9B%EC%A7%91&searchQuery=%EC%A0%9C%EC%A3%BC%EB%8F%84%20%EB%A7%9B%EC%A7%91&level=bottom&age=30")' 
   			    	style="padding:0px"><img src="../img/datecourse/west_course.png"></button>
				<br>
				<br>
			    <button onclick='open_map_frame("https://www.google.com/maps/d/embed?mid=124b3u065zmVLoVFXD6rzHq5kMqsSum89");
			    	open_food_frame("https://m.store.naver.com/restaurants/listMap?back=false&category=%EB%B6%84%EC%8B%9D&menu=6&query=%EC%A0%9C%EC%A3%BC%EB%8F%84%20%EB%A7%9B%EC%A7%91&searchQuery=%EC%A0%9C%EC%A3%BC%EB%8F%84%20%EB%A7%9B%EC%A7%91&level=bottom&age=30")'
			    style="padding:0px"><img src="../img/datecourse/south_course.png"></button>
				<br>
				<br>
				<button class="btn_map_hide" style="padding:3px">지도 숨김</button>
				<button class="btn_food_hide" style="padding:3px">맛집 숨김</button>
				<br>
				<br>
				<div class="map_class">
				  <iframe id ="map_frame" width="530" height="450"></iframe>
				</div>
				<br>
				<div class="food_class">
				  <iframe id ="food_frame" width="530" height="450"></iframe>
				</div>
	
			
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