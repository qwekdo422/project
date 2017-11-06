<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>짝 게스트하우스</title>
<link rel="stylesheet" href="../css/common/header.css" />
<link rel="stylesheet" href="../css/common/footer.css" />
<link rel="stylesheet" href="../css/common/mainBody.css" />
<link rel="stylesheet" href="../css/alert/alertify.core.css" />
<link rel="stylesheet" href="../css/alert/alertify.default.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../js/alert/alertify.min.js"></script>
<script>
function abc() {
	alertify.alert("aa");
}
</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="../common/header.jsp" />
		</div>
		
		<div id="main">
			메인화면 body
			<br>
			<button onclick="abc();">알럿 테스트</button>
			<br>
			<a href="../test/testMember.do?no=15">DB테스트</a>			
		</div>

		<div id="footer">
			<jsp:include page="../common/footer.jsp" />
		</div>
	</div>
</body>
</html>