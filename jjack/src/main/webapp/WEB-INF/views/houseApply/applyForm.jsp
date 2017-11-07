<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입소신청</title>
<link rel="stylesheet" href="../css/common/header.css" />
<link rel="stylesheet" href="../css/common/footer.css" />
<link rel="stylesheet" href="../css/common/mainBody.css" />
<link rel="stylesheet" href="../css/alert/alertify.core.css" />
<link rel="stylesheet" href="../css/alert/alertify.default.css" />
<%-- 캘린더  --%>
<link rel="stylesheet" href="../css/houseApply/calendar.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../js/alert/alertify.min.js"></script>
<%-- 캘린더 --%>

<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="../common/header.jsp" />
		</div>
		
		<div id="main">
			<jsp:include page="./calendar.jsp" />
		</div>

		<div id="footer">
			<jsp:include page="../common/footer.jsp" />
		</div>
	</div>
</body>
</html>