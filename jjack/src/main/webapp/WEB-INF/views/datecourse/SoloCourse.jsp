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
});

function open_in_frame(url){
	$('#map_frame').show();
	$('#map_frame').attr('src',url);
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
				<h4><솔로 코스></h4><br />
				<div class="list-group text-right">
					<a href="../datecourse/BasicCourse.do" class="list-group-item">기본 코스</a> 
					<a href="../datecourse/CoupleCourse.do" class="list-group-item">커풀 데이트 코스</a>
					<a href="../datecourse/SoloCourse.do" class="list-group-item">솔로 코스</a>
				</div>
			</div>
			<!-- 본 화면 -->
		 	<div id="SoloMain" class="col-lg-9">
				
				<img src="../img/datecourse/solo_course.png" width="480">
				<br>
				<br>
				<button class="btn_map_hide" style="padding:3px">지도 감추기</button>
				<br>
				<br>
				
			    <!-- East -->
			    <button name="btn_course2" type="button" onclick='open_in_frame("https://www.google.com/maps/d/embed?mid=1BNuO89rX3ZuCRCND53p6Gj9pTnzBSzCU")'
				
				style="width:143px;height:134px;cursor:hand;filter:alpha(opacity=50);opacity:0.6;
				position:absolute;top:72px;left:63px;z-index:10"></button>

				<!-- West -->
				<button name="btn_course1" type="button" onclick='open_in_frame("https://www.google.com/maps/d/embed?mid=1gmRk5fN8ji0Id50mbmBvnJAb-gDjWycZ")'
				style="width:180px;height:186px;cursor:hand;filter:alpha(opacity=50);opacity:0.6;
				position:absolute;top:23px;left:295px;z-index:10"></button>
				
				<!-- South -->
				<button name="btn_course3" type="button" onclick='open_in_frame("https://www.google.com/maps/d/embed?mid=1lswMDVaMXFXlxcd0ZNlPWhZIXrAeSxBt")'
				style="width:210px;height:80px;cursor:hand;filter:alpha(opacity=50);opacity:0.6;
				position:absolute;top:276px;left:118px;z-index:10"></button>


			    <div class="map_class">
				  <iframe id ="map_frame" width="480" height="400"></iframe>
				</div>
				
				<br>
				<br>
				<br>
				<br>
				<br>
			
			
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