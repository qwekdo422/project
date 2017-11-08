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
    <style>
    	#introBody {
    		margin: 0px;
    		font-size:16px;
    	}
    	
    	/* 메뉴 */
    	#introNav {
    		float:left;
    		background-color:#aee5f6;
    		width:180px;
    		font-size:20px;
    	}
    	#introNav div {
    		box-sizing: border-box;
    		-webkit-box-sizing: border-box;
    		-moz-box-sizing: border-box;
    		border-bottom:1px solid black;
    		height:100px;
    		text-align:right;
    		padding-right:10px;
    	}
    	#navFloat1{
    		float: left;
			height: 50%;
			margin-bottom: -60px; /* navMenu 높이의 절반 */
    	}
    	#introNav div:first-child {
    		box-sizing: border-box;
    		-webkit-box-sizing: border-box;
    		-moz-box-sizing: border-box;
    		border-bottom:1px solid black;
    		height:120px;
    	}
    	.navFloat{
    		float: left;
			height: 50%;
			margin-bottom: -25px; /* navMenu 높이의 절반 */
    	}
    	.navMenu {
    		clear: both;
			position: relative;
			height:50px;
    	}
    	#introLogo {
    		width:35px;
    	}
    	
    	/* 본문 */
    	#introMain {
    		margin:50px 200px;
    	}
    	
    	
    	
    
    </style>
    <script>
    	$(document).ready(function(){
    		$("#intro1").click(function(){
    			location.href("../intro/schedule.do");
    		});
    		
    		
    		
    		
    	});
    </script>
</head>
<body style="margin: 0 auto;">
	<div id="wrap">
		<div id="header">
			<jsp:include page="../common/header.jsp" />
		</div>
		<div id="main">
			<nav id="introNav">
		 		<div id="intro1">
					<div id="introfloater1"></div>
					<div id="nav_GH" class="navMenu"><img src="../img/logo.png" id="introLogo"><br>게스트하우스는</div>
				</div>
				<div id="intro2">
					<div class="introfloater"></div>
					<div id="nav_schedule">애정촌 일정</div>
				</div>
				<div id="intro3">
					<div class="introfloater"></div>
					<div id="nav_rules">애정촌 십계명</div>
				</div>
			</nav>
			<div id="introMain">
				<img id="thisGHis" src="../img/JjakGH.jpg">
				<h3>짝 게스트하우스에 오신 걸 환영합니다!</h3>
				<pre>TV에서 보신 인연찾기 프로그램 짝! 그 ‘짝’을 실제로 경험할 수 있는 곳이 제주도에 있습니다.
제주도의 매력넘치는 자연 속에서 독특한 방식의 미팅으로 인연을 찾아보세요.
애정촌에서의 여러 프로그램들은 메마른 도시인들의 감성에서도 사랑을 틔워
낼 수 있습니다. 사랑 가득한 제주의 애정촌이 당신의 운명같은 짝을 짝지어줍니다.</pre>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="../common/footer.jsp" />
		</div>
	</div>
</body>
</html>
