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
	<link rel="stylesheet" href="../css/intro/intro.css" />
</head>
<body style="margin:0 auto;">
	<div id="header">
		<jsp:include page="../common/header.jsp" />
	</div>
	<div class="container">
		<!-- Page Content -->
		<div class="row mt-4">
	 		<!-- 서브메뉴 -->
			<div class="col-lg-3 mb-4">
				<h2>소개</h2><br />
				<div class="list-group text-right">
					<a href="../intro/thisGHis.do" class="list-group-item active"><img src="../img/common/logo.png" id="introLogo"><br>게스트하우스는</a> 
					<a href="../intro/schedule.do" class="list-group-item">애정촌 일정</a> 
					<a href="../intro/rules.do" class="list-group-item">애정촌 십계명</a>
				</div>
			</div>
				
			<!-- 본 화면 -->
		 	<div id="introMain" class="col-lg-9">
				<img class="introImg" src="../img/intro/JjakGH.jpg" id="jjakGH">
				<h2 class="mb-3 text-center">짝 게스트하우스에 오신 걸 환영합니다!</h2>
				<div class="container mb-4" id="intro1p">
					<p>TV에서 보신 인연찾기 프로그램 짝! 그 ‘짝’을 실제로 경험할 수 있는 곳이 제주도에 있습니다.<br>
					제주도의 매력넘치는 자연 속에서 독특한 방식의 미팅으로 인연을 찾아보세요.<br>
					애정촌에서의 여러 프로그램들은 메마른 도시인들의 감성에서도 사랑을 틔워낼 수 있습니다.<br>
					사랑 가득한 제주의 애정촌이 당신의 운명같은 짝을 연결해줍니다.</p><br><br>
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