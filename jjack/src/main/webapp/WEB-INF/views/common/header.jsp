<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
>>>>>>> branch 'branche' of https://github.com/qwekdo422/project.git
<link rel="stylesheet" href="../css/common/bootstrap.min.css" />
<div id="top">
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
<<<<<<< HEAD
					<li class="nav-item"><a class="nav-link" href="../intro/thisGHis.do">소개
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="../houseApply/applyForm.do">애정촌입소신청</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">짝짓기</a></li>
					<li class="nav-item"><a class="nav-link" href="../datecourse/datecourse1.do">데이트코스</a>
					<li class="nav-item"><a class="nav-link" href="#">후기</a></li>
					<li class="nav-item"><a class="nav-link" href="#">공지</a></li>
				 <c:if test="${empty sessionScope.UID}"> 
					<li class="nav-item" style="margin-left:30px"><a class="nav-link" href="../SignUp/SignUpForm.do">회원가입</a></li>
					<li class="nav-item"><a class="nav-link" href="../Login/LoginForm.do">로그인</a></li>
					</c:if>			
					<c:if test="${!empty sessionScope.UID}">
					<li class="nav-link" ><font color="red">${sessionScope.UID}</font><font color="white"> 님 환영합니다.</font></li>
					<li class="nav-item"><a class="nav-link" href="../Login/Logout.do">로그아웃</a></li>
					</c:if>
					
					
					
=======
					<li class="nav-item"><a class="nav-link" href="../intro/thisGHis.do" id="mIntro">소개</a></li>
					<li class="nav-item"><a class="nav-link" href="../houseApply/applyForm.do" id="mHouseApply">애정촌입소신청</a></li>
					<li class="nav-item"><a class="nav-link" href="../houseApply/applicantList.do">[관리]</a></li>
					<li class="nav-item"><a class="nav-link" href="../mating/forLunch.do" id="mMating">짝짓기</a></li>
					<li class="nav-item"><a class="nav-link" href="../datecourse/BasicCourse.do" id="mDatecourse">데이트코스</a>
					<li class="nav-item"><a class="nav-link" href="#" id="mReview">후기</a></li>
					<li class="nav-item"><a class="nav-link" href="#" id="mNotice">공지</a></li>
					<li class="nav-item" style="margin-left:30px"><a class="nav-link" href="../SignUp/SignUpForm.do" id="mSignUp">회원가입</a></li>
					<li class="nav-item"><a class="nav-link" href="#" id="mLogIn">로그인</a></li>
>>>>>>> branch 'branche' of https://github.com/qwekdo422/project.git
				</ul>
			</div>
	</nav>
</div>

<script src="../js/common/header.js"></script>
<script src="../js/main/bootstrap.bundle.min.js"></script>