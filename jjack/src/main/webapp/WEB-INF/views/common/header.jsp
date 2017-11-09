<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
    // Picture element HTML5 shiv
    document.createElement( "picture" );
</script>
<script src="../js/main/bootstrap.min.js"></script>
<script src="../js/main/picturefill.min.js" async></script>
<link rel="stylesheet" href="../css/common/bootstrap.min.css" />
<div id="top">
	<!-- <a href="../main/mainForm.do"><img src="../img/main.jpg" id="headerImg"></a> -->
	<a href="../main/mainForm.do">
		<picture>
			<source srcset="../img/common/header.jpg" media="(min-width:768px)" class="headerImg">
			<source srcset="../img/common/header_tab.jpg" media="(min-width:550px)" class="headerImg">
			<img srcset="../img/common/header_mobile.jpg" class="headerImg">
		</picture>
	</a>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark position-relative">
			<a class="navbar-brand" href="../main/mainForm.do">짝 ♥ 게스트하우스</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="../intro/thisGHis.do">소개</a></li>
					<li class="nav-item"><a class="nav-link" href="../houseApply/applyForm.do">애정촌입소신청</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">짝짓기</a></li>
					<li class="nav-item"><a class="nav-link" href="../datecourse/datecourse1.do">데이트코스</a>
					<li class="nav-item"><a class="nav-link" href="#">후기</a></li>
					<li class="nav-item"><a class="nav-link" href="#">공지</a></li>
					<li class="nav-item" style="margin-left:30px"><a class="nav-link" href="../SignUp/SignUpForm.do">회원가입</a></li>
					<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
				</ul>
			</div>
	</nav>
</div>