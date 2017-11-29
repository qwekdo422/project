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
<script src="../js/main/mainForm.js"></script>
<link rel="stylesheet" href="../css/main/WordCloud.css" />
<script>
	var come = "${come}";
  //타이머 설정으로 워드 클라우드 이미지 등록 처리 작업
  playAlert = setInterval(function(){$('.col-lg-3 img').attr('src','../img/main/real_word.jpg?timestamp='+new Date().getTime());},1000);

</script>
</head>
<body style="margin:0 auto;">


	<div id="header">
		<jsp:include page="../common/header.jsp" />
	</div>
		<div class="container">
		<!-- Page Content -->
			<div class="row">

 
				<div class="col-lg-3" align="center">
					<br>
					<!--  <h5 align="center"> [실시간 워드 클라우드] </h5> <br> -->
					<div id ="ani" class="title_word1">Word Cloud</div>
					<br>
					<br>
                    <img class="card-img-top" src="../img/main/real_word.jpg">
                    <br>
                    <br>
                    <!--  <button class="btn_word" id="btn">후기 업데이트</button> -->
                 
                   
				</div>

				<!-- /.col-lg-3 -->

				<div class="col-lg-9">

					<div id="carouselExampleIndicators" class="carousel slide my-4"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0"
								class="active"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner" role="listbox">
							<div class="carousel-item active">
								<img class="d-block img-fluid" src="../img/main/guest1.jpg" alt="First slide">
							</div>
							<div class="carousel-item">
								<img class="d-block img-fluid" src="../img/main/guest2.jpg"
									alt="Second slide">
							</div>
							<div class="carousel-item">
								<img class="d-block img-fluid" src="../img/main/guest3.jpg"
									alt="Third slide">
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>

					<div class="row">

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="../img/main/love_word1.jpg" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">남자1호 ♥ 여자2호</a>
									</h4>
									<h5 class="card-subtitle" align="center" style="color:red">
										2017년 11월 25일
									</h5>	
								</div>
							
							</div>
						</div>



						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="../img/main/love_word2.jpg" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">남자3호 ♥ 여자1호</a>
									</h4>
									<h5 class="card-subtitle" align="center" style="color:red">
										2017년 11월 18일
									</h5>									
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="../img/main/love_word3.jpg" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">남자5호 ♥ 여자3호</a>
									</h4>
									<h5 class="card-subtitle" align="center" style="color:red">
										2017년 11월 15일
									</h5>									
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="../img/main/love_word4.jpg" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">남자5호 ♥ 여자3호</a>
									</h4>
									<h5 class="card-subtitle" align="center" style="color:red">
										2017년 11월 9일
									</h5>									
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="../img/main/love_word5.jpg" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">남자4호 ♥ 여자5호</a>
									</h4>
									<h5 class="card-subtitle" align="center" style="color:red">
										2017년 10월 30일
									</h5>
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="../img/main/love_word6.jpg" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">남자1호 ♥ 여자2호</a>
									</h4>
									<h5 class="card-subtitle" align="center" style="color:red">
										2017년 11월 3일
									</h5>
							
									
								</div>
							</div>
						</div>

					</div>
					<!-- /.row -->

				</div>
				<!-- /.col-lg-9 -->

			</div>
			<!-- /.row -->
			<script src="../js/main/jquery.min.js"></script>
            <script src="../js/main/bootstrap.bundle.min.js"></script>
		</div>
		<!--  /.container -->
		
	<!---------------------------------------------->
	<div id="footer">
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>