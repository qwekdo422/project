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
<script src="../js/main/bootstrap.min.js"></script>
<script src="../js/alert/alertify.min.js"></script>
<%-- ====================== 필수  ======================  --%>
<link rel="stylesheet" href="../css/intro/intro.css" />
	<script>
 		$(document).ready(function(){
 			
 			/* 
 			// 일정그림 보여주기 부트스트랩 방식
 			$('.nav-tabs a').on('click', function (e) {
				  e.preventDefault();	// 클릭시 화면 위로 가는걸 방지
				  $(this).tab('show');
				});
			*/
				
 			// 일정그림 보여주기 jQuery 방식
			var day12=1;
			$('#day2').hide();
			$('#day1Btn').click(function(){
				if(day12==2) {
					$('#day2').hide();
					$("#day1Btn").attr("class", "nav-link active");
					$('#day1Btn').css('color', '#007bff');
					$('#day2Btn').css('color', '#212529');
					$("#day2Btn").attr("class", "nav-link");
					$('#day1').show();
					day12=1;
				}
			});

			$('#day2Btn').click(function(){
				if(day12==1) {
					$('#day1').hide();
					$("#day2Btn").attr("class", "nav-link active");
					$('#day2Btn').css('color', '#007bff');
					$('#day1Btn').css('color', '#212529');
					$("#day1Btn").attr("class", "nav-link");
					$('#day2').show();
					day12=2;
				}
			});
		});
	
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
				<h2>소개</h2><br />
				<div class="list-group text-right">
					<a href="../intro/thisGHis.do" class="list-group-item"><img src="../img/common/logo.png" id="introLogo"><br>게스트하우스는</a> 
					<a href="../intro/schedule.do" class="list-group-item active">애정촌 일정</a> 
					<a href="../intro/rules.do" class="list-group-item">애정촌 십계명</a>
				</div>
			</div>
				
			<!-- 본 화면 -->
		 	<div class="col-lg-9">
				<h2 class="mb-3">애정촌의 일정</h2>
				<p>애정촌의 짝 프로그램은 주로 토, 일 이틀간 진행합니다.<br>
						짝을 찾아온 입소자들은 다음과 같은 일정 속에서 사랑을 찾게 됩니다.
				</p><br><br>
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" id="day1Btn" style="color:#007bff;">첫째날</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" id="day2Btn">둘째날</a>
					</li> 
				</ul>
				<div id="day1">
					<img src="../img/intro/schedule1.png" class="introImg">
				</div>
				<div id="day2">
					<img src="../img/intro/schedule2.png" class="introImg">
				</div>
				<br><br>
				
				<!-- 
				이건 부트스트랩 방식. 포기하고 그냥 j쿼리로 구현	
 					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#day1">첫째날</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#day2">둘째날</a>
					</li> 
				</ul>
 				<div class="tab-content">
					<div class="tab-pane fade show active" id="day1" role="tabpanel">
						<img src="../img/intro/schedule1.png" class="introImg">
					</div>
					<div class="tab-pane fade" id="day2" role="tabpanel">
						<img src="../img/intro/schedule2.png" class="introImg">
					</div>
				</div> 
 -->
				
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