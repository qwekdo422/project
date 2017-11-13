<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%-- ====================== 필수  ======================  --%>
<link rel="stylesheet" href="../css/common/header.css" />
<link rel="stylesheet" href="../css/common/footer.css" />
<link rel="stylesheet" href="../css/alert/alertify.core.css" />
<link rel="stylesheet" href="../css/alert/alertify.default.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../js/alert/alertify.min.js"></script>
<%-- ====================== 필수  ======================  --%>
</head>

<!-- LoginForm.js javascript 경로 -->
 <script src="../js/LoginForm/LoGinForm.js"></script>

<body style="margin:0 auto;">
   <div id="header">
      <jsp:include page="../common/header.jsp" />
   </div>
      <div class="container">

		<div id="main">
	<form method="POST" id="lfrm" action="../Login/LoginProc.do">
	<table width="500" align="center" board="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" id="id" name="id" value="${param.ID}"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" id="pw" name="pw"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="로그인" id="lBtn"align="center">	
			</td>		
		</tr>
	</table>
	</form>
		</div>


	</div>
   <div id="footer">
      <jsp:include page="../common/footer.jsp" />
   </div>
</body>
</html>