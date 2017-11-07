<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>짝 게스트하우스</title>
    

</head>
<body>
    
	<div id="header">
		<jsp:include page="../common/header.jsp" />
	</div>
	<!-------------------------------------------->

	<div id="main">

		<!-- Navigation -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			<div class="container">
				<a class="navbar-brand" href="#">짝 ♥ 게스트하우스</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a class="nav-link" href="#">소개
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#">애정촌입소신청</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">짝짓기</a></li>
						<li class="nav-item"><a class="nav-link" href="#">데이트코스</a></li>
						<li class="nav-item"><a class="nav-link" href="#">후기</a></li>
						<li class="nav-item"><a class="nav-link" href="#">공지</a></li>
						<li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
						<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<!-- Page Content -->
		<div class="container">

			<div class="row">

				<div class="col-lg-3">
					<br> <br>
					<h2 class="my-4">데이트 코스</h2>
					<div class="list-group">
						<a href="#" class="list-group-item">데이트 코스1</a> 
						<a href="#" class="list-group-item">데이트 코스2</a> 
						<a href="#"	class="list-group-item">데이트 코스3</a>
					</div>

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
								<img class="d-block img-fluid" src="=http://placehold.it/900x350" alt="First slide">
							</div>
							<div class="carousel-item">
								<img class="d-block img-fluid" src="http://placehold.it/900x350"
									alt="Second slide">
							</div>
							<div class="carousel-item">
								<img class="d-block img-fluid" src="http://placehold.it/900x350"
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
									src="../img/love_word1.PNG" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">남자1호 ♥ 여자2호</a>
									</h4>
									<h5>2017년 8월 25일</h5>
									<p class="card-text">제주도와서 나의 반쪽을 만나서 너무 좋아요! ^^</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733;
										&#9733; &#9734;</small>
								</div>
							</div>
						</div>



						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="../img/love_word2.PNG" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">남자3호 ♥ 여자1호</a>
									</h4>
									<h5>2017년 9월 25일</h5>
									<p class="card-text">제주도와서 나의 반쪽을 만나서 너무 좋아요! ^^</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733;
										&#9733; &#9734;</small>
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="../img/love_word3.PNG" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">남자5호 ♥ 여자3호</a>
									</h4>
									<h5>2017년 9월 25일</h5>
									<p class="card-text">제주도와서 나의 반쪽을 만나서 너무 좋아요! ^^</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733;
										&#9733; &#9734;</small>
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="../img/love_word4.PNG" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">남자5호 ♥ 여자3호</a>
									</h4>
									<h5>2017년 10월 25일</h5>
									<p class="card-text">사랑은 제주도 짝 게스트하우스에서... ^^</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733;
										&#9733; &#9734;</small>
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="../img/love_word5.PNG" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">남자4호 ♥ 여자5호</a>
									</h4>
									<h5>2017년 10월 30일</h5>
									<p class="card-text">사랑은 제주도 짝 게스트하우스에서... ^^</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733;
										&#9733; &#9734;</small>
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="../img/love_word5.PNG" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">남자1호 ♥ 여자2호</a>
									</h4>
									<h5>2017년 11월 2일</h5>
									<p class="card-text">사랑은 제주도 짝 게스트하우스에서... ^^</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733;
										&#9733; &#9734;</small>
								</div>
							</div>
						</div>

					</div>
					<!-- /.row -->

				</div>
				<!-- /.col-lg-9 -->

			</div>
			<!-- /.row -->

		</div>
		<!-- /.container -->


		<!-- Bootstrap core JavaScript -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	</div>


	<!---------------------------------------------->
	<div id="footer">
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>