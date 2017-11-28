<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="../css/common/bootstrap.min.css" />
<script src="../js/common/header.js"></script>
<script src="../js/main/bootstrap.bundle.min.js"></script>

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
				<!-- 
					세션에 등록할 상태 정보
					(키이름은 cond로 하든 auth로 하든 맘대로)
					cond = 0 : 디폴트. 일반상태
								 1 : 최신 a_cond가 4 :  전체 데이트코스 열람 가능
								2 : a_cond 8 : 짝짓기 메뉴 선택시 최종 짝선택 페이지로 연결
								3 : a_cond 8 & g_course S : 데이트코스 메뉴 선택시 솔로 코스로 연결
								4 : a_cond 9 : 후기 쓰기. 가능
								후기 쓰면 cond = 0 으로 변경
				 -->
			
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="../intro/thisGHis.do" id="mIntro">소개</a></li>
					<c:if test="${sessionScope.UID ne 'admin'}">
					<li class="nav-item"><a class="nav-link" href="../scheduler/list.do?status=U" id="mScheduler">애정촌입소신청</a></li>
					</c:if>
					<c:if test="${sessionScope.UID eq 'admin'}">
					<li class="nav-item"><a class="nav-link" href="../applicantList/ManageList.do" id="mManageList">신청자관리</a></li>
					<li class="nav-item"><a class="nav-link" href="../scheduler/list.do?status=A" id="mScheduler">일정관리</a></li>
					</c:if>
					<li class="nav-item">
						<%-- 입소자 외에는 커넥터로 연결 --%>
						<c:if test="${sessionScope.Auth ne 2 and sessionScope.Auth ne 3}">
							<a  class="nav-link" href="../mating/matingConnector.do" id="mMating">짝짓기</a>
						</c:if>
						<%-- 입소한 사람은 짝 선택으로 연결 --%>
						<c:if test="${sessionScope.Auth eq 2 or sessionScope.Auth eq 3}">
							<a class="nav-link" href="../mating/myLove.do" id="mMating">짝선택</a>
						</c:if>
					</li>
					<li class="nav-item">
							<a class="nav-link" href="../datecourse/DateCourse.do" id="mDatecourse">데이트코스</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="../Rboard/RboardList.do" id="mReview">후기</a></li>
					<li class="nav-item mr-4"><a class="nav-link" href="../Nboard/NboardList.do" id="mNotice">공지</a></li>
					<c:if test="${empty sessionScope.UID }">
						<li class="nav-item"><a class="nav-link" href="../Login/LoginForm.do" id="mLogIn">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="../SignUp/SignUpForm.do" id="mSignUp">회원가입</a></li>
					</c:if>
					<c:if test="${!empty sessionScope.UID }">
						<li class="nav-item"><font color="red"><a href="../Login/modifyForm.do">${sessionScope.UID}</a></font><font color="white"> 님 환영합니다. </font></li>
						<li class="nav-item"><a class="nav-link" href="../Login/Logout.do" id="mLogout">로그아웃</a></li>
					</c:if>
				</ul>
			</div>
	</nav>
</div>
