<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
<body style="margin:0 auto;">
   <div id="header">
      <jsp:include page="../common/header.jsp" />
   </div>
      <div class="container">

<c:if test="${null ne id}"><!-- id가 null이 아니면 -->
<c:redirect url="../Login/LoginForm.do">
<c:param name="ID" value="${id}"></c:param>
</c:redirect>
</c:if>


<!-- 로그인에 성공한 경우 -->
<c:if test="${OBJECT eq 1}">
<input type="hidden" id="uid" value="${UID}">
<script>
var uid =document.getElementById("uid").value; //그 폼의 value값을 가져와서 변수에다 저장함
//var UID=${sessionScope.UID}; 
//alert(UID);  대오형 안되잖소?
alert(uid +"님 환영합니다"); 
document.location.href="../main/mainForm.do";
</script>
</c:if>


<!-- 로그인에 실패한 경우  -->
<c:if test="${OBJECT eq 0}">
<script>
alert("아이디와 비밀번호가 유효하지 않습니다.");
document.location.href="../Login/LoginForm.do"; 
</script>
</c:if> 




			
		</div>
   <div id="footer">
      <jsp:include page="../common/footer.jsp" />
   </div>
</body>
</html>