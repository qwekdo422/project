<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<META HTTP-EQUIV="Refresh" content="3; URL=../main/mainForm.do">
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
	.eDiv {
		font-weight: bold;
		font-size: 30px;
	}
</style>
</head>
<body style="margin:0 auto;">
	<div id="header">
      <jsp:include page="../common/header.jsp" />
	</div>
	
	<div class="container">
		<div class="eDiv">
			<br><br><br>
			<font color="red">페이지 오류</font> <br><br>
			잘못된 접근입니다. <br> 
			정상적으로 접근하십시오. <br>
			잠시후 메인화면으로 이동합니다. 
			<br><br><br>
		</div>		
	</div>
	
	<div id="footer">
	   <jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>