<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<!-- 
					세션에 등록할 상태 정보
					(키이름은 cond로 하든 auth로 하든 맘대로)
					cond = 0 : 디폴트. 일반상태
								 1 : 입소확정자이자 퇴소하지 않은 사람(tb_apply 최신정보의 a_cond가 4, 8인 경우). 전체 데이트코스 열람 가능
								2 : 점심짝이 결정되고 데이트코스가 없는 사람. 짝짓기 메뉴 선택시 최종 짝선택 페이지로 연결
								3 : 최종 솔로 확정이고 퇴소하지 않은 사람. 데이트코스 메뉴 선택시 솔로 코스로 연결
								4 : 퇴소했지만 후기 미작성자(tb_apply 최신정보의 a_cond가 9인 경우). 전체데이트코스 열람 불가
								후기 쓰면 cond = 0 으로 변경
				 -->
			
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="../intro/thisGHis.do" id="mIntro">소개</a></li>
					<c:if test="${sessionScope.MNO ne 0}">
					<li class="nav-item"><a class="nav-link" href="../scheduler/list.do?status=U" id="mHouseApply">애정촌입소신청</a></li>
					</c:if>
<%-- admin 계정이면 볼 수 있는  메뉴. 작업하기 귀찮으니까 주석처리해둠
					<c:if test="${sessionScope.MNO eq 0}">
 --%>
					<li class="nav-item"><a class="nav-link" href="../applicantList/ManageList.do">[신청자]</a></li>
					<li class="nav-item"><a class="nav-link" href="../scheduler/list.do?status=A">[일정관리]</a></li>
<%-- 
					</c:if>
 --%>
					<li class="nav-item"><a class="nav-link" href="../mating/forLunch.do" id="mMating">짝짓기</a></li>
					<li class="nav-item"><a class="nav-link" href="../datecourse/BasicCourse.do" id="mDatecourse">데이트코스</a>
					<li class="nav-item"><a class="nav-link" href="#" id="mReview">후기</a></li>
					<li class="nav-item"><a class="nav-link" href="../Nboard/NboardList.do" id="mNotice">공지</a></li>
					<c:if test="${empty sessionScope.UID }">
						<li class="nav-item" style="margin-left:30px"> <a class="nav-link" href="../Login/LoginForm.do" id="mLogIn">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="../SignUp/SignUpForm.do" id="mSignUp">회원가입</a></li>
					</c:if>
					<c:if test="${!empty sessionScope.UID }">
						<li class="nav-item"  style="float:right">	<font color="red"><a href="../Login/modifyForm.do">${sessionScope.UID}</a></font><font color="white"> 님 환영합니다. </font></li>
						<li class="nav-item"><a class="nav-link" href="../Login/Logout.do" id="mLogout">로그아웃</a></li>
					</c:if>
				</ul>
			</div>
	</nav>
</div>

<script src="../js/common/header.js"></script>
<script src="../js/main/bootstrap.bundle.min.js"></script>
