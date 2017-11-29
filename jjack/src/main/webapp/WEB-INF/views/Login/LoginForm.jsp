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
</head>

<!-- LoginForm.js javascript 경로 -->
 <script src="../js/LoginForm/LoGinForm.js"></script>
<script>
var pwfail =${pwfail}; 
</script>
<body style="margin:0 auto;">
   <div id="header">
      <jsp:include page="../common/header.jsp" />
   </div>
      <div class="container">

		<div id="main">
<div class="row mt-5 mb-5">
	<div class="col-lg-5 mx-auto">
	<form method="POST" id="lfrm" action="../Login/LoginProc.do">
	<%-- 인터셉터 걸렸을 경우 요청 url를 기억할 파라메터--%>
	<c:if test="${!empty url}">
		<input type="hidden" name="url" value="${url}">
	</c:if>
	<table class="table  table-striped table-bordered mt-12">
		<tr>
			<td align="center">아이디</td>
			<td><input type="text" id="id" name="id" value="${param.ID}" class="form-control form-control-sm"></td>
		</tr>
		<tr>
			<td align="center">비밀번호</td>
			<td><input type="password" id="pw" name="pw" class="form-control form-control-sm"></td>
		</tr>


	</table>
					<input type="button" value="로그인" id="lBtn" class="btn btn-info btn-block" align="center">	
	
	</form>
		</div>
	</div>
</div>

	</div>
   <div id="footer">
      <jsp:include page="../common/footer.jsp" />
   </div>
</body>
</html>