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

<script >
	$(function(){//select 박스의 데이터 값을 받아와서 다시 넣어주는 함수 
		var loc ='${PVO.loc}';
		$("#loc").val(loc);
});

function checkPw(){

		var inputd=$("#nowpw").val(); //폼 요소의 데이터를 받아서...
		 var isid=$("#id").val(); 
		$.ajax({
			  data :{ pw : inputd, id : isid },//id폼에 입력된 그 데이터를 서버에 전송하기 위해 준비 
			  url : "../Login/pwOverlap.do",
			  dataType : 'json',
			  type : 'post',
			  success : function(data){//요청에 성공
			  var isPw= data.result;	//이 값이 1 이면 아이디와 비번이 일치한다.   
			  if(isPw == 1){
			  	document.getElementById("ispw").innerHTML="비밀번호가 일치합니다. "; 
				 	$("#newpw01").focus();
			  	}else{
				document.getElementById("ispw").innerHTML="비밀번호가 틀립니다."; 
			  	}
			  	  },
			  	 error : function(){ //요청에 실패
			  		 alert("오류뜨네"); 
			  	 }

		  });//ajax 종료 
	
	}//checkPw() 함수 종료 
	
	function newPwCheck(){
		var nowPw=$("#nowpw").val(); 
		var newPw01=$("#newpw01").val(); 
		var newPw02=$("#newpw02").val(); 
		
		if(newPw01.length <8){
			document.getElementById("newpw001").innerHTML="비밀번호는 8자 이상 등록하십시오."; 
		}
		else if(newPw01.length >=8){
			document.getElementById("newpw001").innerHTML="사용가능한 비밀번호입니다."; 
		}
		if(newPw01 == nowPw){
			document.getElementById("newpw001").innerHTML="기존의 비밀번호와 동일합니다."; 
			$("#newpw01").val(""); 
			return; 
		}

	}
	
	function newPwCheckCheck(){
		var newPw01=$("#newpw01").val(); 
		var newPw02=$("#newpw02").val(); 
		if(newPw01 == newPw02){
			document.getElementById("newpw002").innerHTML="새 비밀번호 확인";
		}else{
			document.getElementById("newpw002").innerHTML="새 비밀번호가 다릅니다.";
		}
	}
	
	$(document).ready(function(){
		
		
		$("#mBtn").click(function(){
			
			alert("정보수정이 완료되었습니다."); 
			
			$("#Mfrm").submit(); 
			
		}); 
	}); 

</script>

<body style="margin:0 auto;">
   <div id="header">
      <jsp:include page="../common/header.jsp" />
   </div>
      <div class="container">
		<div id="main">
			<div class="row mt-4 mb-4">
				<div class="col-lg-5 mx-auto">
				<form method="post" action="../Login/modifyProc.do" id="Mfrm">
				<input type="hidden" name="no" value="${PVO.no}">
			<table class="table  table-striped table-bordered mt-4">
			<tr>
					<td>아이디 :</td>
					<td> <input type="text"  name="id"  id="id" value="${PVO.id }" class="form-control form-control-sm" readOnly>
			</tr>
			
			<tr>
					<td>이름 변경</td><td><input type="text" name="name" id="name"  class="form-control form-control-sm" value="${PVO.name}" ></td>
			</tr>
			<tr>
				<td rowspan="3">비밀번호 변경 </td><td><input type="password" name="nowpw" id="nowpw" class="form-control form-control-sm" oninput="checkPw()" placeholder="사용중인 비밀번호"><span id="ispw" style="color:red"></sapn></td>
			</tr>
			<tr><td><input type="password" name="newpw01" id="newpw01" class="form-control form-control-sm" placeholder="새 비밀번호" oninput="newPwCheck()"><span id="newpw001" style="color:red"></sapn></td></tr>
			<tr><td><input type="password" name="newpw02" id="newpw02" class="form-control form-control-sm" placeholder="새 비밀번호 확인"oninput="newPwCheckCheck()"><span id="newpw002" style="color:red"></td></tr>
			<tr>
					<td>성별 :</td> 
					<td>
					<c:if test="${PVO.sex eq  'M'}">
					<input type="radio" id="sex" name="sex" value="M"  checked="checked" >남자
					<input type="radio" id="sex"name="sex" value="F"onclick="return false" >여자
					</c:if>
					<c:if test="${PVO.sex eq  'F'}">
					<input type="radio" id="sex" name="sex" value="M" onclick="return false">남자
					<input type="radio" id="sex"name="sex" value="F"  checked="checked" >여자
					</c:if>
					
					</td>
			</tr>
			<tr>
					<td>생일 : </td><td><input type="text" name="birth" id="birth" class="form-control form-control-sm"  placeholder="YYYY-MM-DD" value="${PVO.birth}" readOnly></td>
			</tr>
			
			<tr>
					<td>E-MAIL 변경 </td><td><input type="email" name="email" id="email" class="form-control form-control-sm"  placeholder="abc@domain.com" value="${PVO.email}"></td>
			</tr>
			<tr>
					<td>거주지 변경 </td>
					<td>
						<select name="loc" id="loc" value="${PVO.loc}">
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
			<input type="button" value="수정하기" id="mBtn"align="center" class="btn btn-info btn-block">	
			</tr>
		
			</table>
			</form>
				</div>
			</div>
		</div>
   <div id="footer">
      <jsp:include page="../common/footer.jsp" />
   </div>
</body>
</html>