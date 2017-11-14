<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- SignUpForm.js javascript 경로 -->
<script src="../js/SignUpForm/SignUpForm.js"></script>


<!-- Jquery 달력 사용을 위한 라이브러리 설정 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

<script>

function checkId(){
	  alert("?"); 
	  var inputd=$("#id").val(); 
	  $.ajax({
		  data : {
			  id : inputd //id폼에 입력된 그 데이터를 서버에 전송하기 위해 준비
		  },
		  	 url : "../SignUp/Overlap.do",
		  	type : 'get',
		  	 success : function(data){//요청에 성공
		  		var dd=  data.result; 
		  		alert(dd); 
		  	 },
		  	 error : function(){
		  		 alert("오류뜨네"); 
		  	 }

	  });//ajax 종료 
	  
}//checkId() 함수 종료 
	</script>
</head>	

<body style="margin:0 auto;">
   <div id="header">
      <jsp:include page="../common/header.jsp" />
   </div>
      <div class="container">

		<div id="main">
				<form method="post" action="../SignUp/SignUpProc.do" id="Sfrm">
			<table width="800" align="center" border="1">
			<tr>
					<td>아이디 :</td>
					<td> <input type="text"  name="id"  id="id"  placeholder="아이디는 6자 이상입니다."  oninput="checkId()"><input type="button" id="oBtn" value="중복확인"></td>
			</tr>
			<tr>
					<td>비밀번호 : </td><td><input type="password" name="pw" id="pw"></td>
			</tr>
			<tr>
					<td>비밀번호 확인 : </td><td><input type="password" name="cpw" id="cpw"></td>
			</tr>
			<tr>
					<td>이름 :</td><td><input type="text" name="name" id="name" ></td>
			</tr>
			<tr>
					<td>성별 :</td> 
					<td>
					<input type="radio" name="sex" value="M" >남자
					<input type="radio" name="sex" value="F" >여자
					</td>
			</tr>
			<tr>
					<td>생일 : </td><td><input type="text" name="birth" id="birth"  placeholder="YYYY-MM-DD" ></td>
			</tr>
			
			<tr>
					<td>E-MAIL : </td><td><input type="email" name="email" id="email" placeholder="abc@domain.com"></td>
			</tr>
			<tr>
					<td>거주지 : </td>
					<td>
						<select name="loc" id="loc" >
								<option value="">지역선택</option>
								<option value="서울/경기">서울/경기</option>
								<option value="강원도">강원도</option>
								<option value="충청도">충청도</option>
								<option value="경상도">경상도</option>
								<option value="전라도">전라도</option>
								<option value="제주도">제주도</option>
						</select>
					</td>
			</tr>
	
			<tr>
			<td colspan="2" align="center">
			<input type="button" value="가입하기" id="sBtn"align="center">	
			</tr>
		
			</table>
			</form>

		</div>
   <div id="footer">
      <jsp:include page="../common/footer.jsp" />
   </div>
</body>
</html>