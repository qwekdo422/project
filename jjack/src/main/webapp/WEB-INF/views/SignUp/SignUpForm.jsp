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

	  var inputd=$("#id").val(); //폼 요소의 데이터를 받아서...

	    if(inputd.length < 6){		
				document.getElementById("isid").innerHTML="아이디는 6글자 이상 입력하십시오";
				$('#pw').prop('readonly', true); //아이디가 6글자 미만이면 패스워드 폼을 누르지 못하게 막음

				return; 
	    }else{
	    	
			$('#pw').prop('readonly', false);//아이디를 만들 수 있는 목적이 충족되었으므로 readOnly를 풀었다.

	    }
	    
	  $.ajax({
		  data : { id : inputd },//id폼에 입력된 그 데이터를 서버에 전송하기 위해 준비 
		  url : "../SignUp/Overlap.do",
		  type : 'post',
		  success : function(data){//요청에 성공
		  var isId= data.result; //이 값이 1 이면 DB에 그 아이디가 있다는 의미이다.  
		  if(isId == 1){
		  	document.getElementById("isid").innerHTML="아이디가 중복입니다."; 
		  	$("#id").focus();
			$('#pw').prop('readonly', true); //아이디를 만들 수 없는 조건이므로 password폼을 닫아주었다. 
		  }else{
		  	document.getElementById("isid").innerHTML="사용가능한 아이디입니다."; 
		  	}
		  	  },
		  	 error : function(){ //요청에 실패
		  		 alert("오류뜨네"); 
		  	 }

	  });//ajax 종료 
	  
}//checkId() 함수 종료 




function pwCheck(){
	var pw=$("#pw").val(); 
	if(pw.length <8){
		document.getElementById("newpw001").innerHTML="비밀번호는 8자 이상 등록하십시오.";
	}
	else if(pw.length >=8){
		document.getElementById("newpw001").innerHTML="사용가능한 비밀번호입니다."; 
	}

} // pwCheck() 함수 종료 



function pwCheckCheck(){
	
	var pw=$("#pw").val(); 
	var cpw=$("#cpw").val(); 
	if(pw==cpw){
		document.getElementById("newpw002").innerHTML="비밀번호 확인"; 
	}else{
		document.getElementById("newpw002").innerHTML="비밀번호가 다릅니다. "; 		
	}
	
}// pwCheckCheck()함수 종료 

	</script>
</head>	
<body style="margin:0 auto;">
   <div id="header">
      <jsp:include page="../common/header.jsp" />
   </div>
      <div class="container">

		<div id="main">
			<div class="row mt-4 mb-4">
				<div class="col-lg-5 mx-auto">
					<form method="post" action="../SignUp/SignUpProc.do" id="Sfrm">
						<table class="table  table-striped table-bordered mt-4">
						<tr>
								<td align="center" width="30%">아이디 :</td>
								<td> <input type="text"  name="id"  id="id"  class="form-control form-control-sm"  oninput="checkId()"><span id="isid" style="color:red"></span></td>
						</tr>
						<tr>
								<td align="center">비밀번호  </td><td><input type="password" name="pw" id="pw" class="form-control form-control-sm"  oninput="pwCheck()"><span id="newpw001" style="color:red"></span></td>
						</tr>
						<tr>
								<td align="center">비밀번호 확인 </td><td><input type="password" name="cpw" id="cpw"  class="form-control form-control-sm"  oninput="pwCheckCheck()"><span id="newpw002" style="color:red"></span></td>
						</tr>
						<tr>
								<td align="center">이름 </td><td><input type="text" name="name" id="name" class="form-control form-control-sm" ></td>
						</tr>
						<tr>
								<td align="center">성별 </td> 
								<td>
								<input type="radio" name="sex" value="M" >남자
								<input type="radio" name="sex" value="F" >여자
								</td>
						</tr>
						<tr>
								<td align="center">생일 </td><td><input type="text" name="birth" id="birth"  placeholder="YYYY-MM-DD" class="form-control form-control-sm"  ></td>
						</tr>
						
						<tr>
								<td align="center">E-MAIL  </td><td><input type="email" name="email" id="email" placeholder="abc@domain.com" class="form-control form-control-sm" ></td>
						</tr>
						<tr>
								<td align="center">거주지  </td>
								<td>
									<select name="loc" id="loc"  class="form-control form-control" >
											<option value="">지역선택</option>
											<option value="수도권">수도권</option>
											<option value="강원도">강원도</option>
											<option value="충청도">충청도</option>
											<option value="경상도">경상도</option>
											<option value="전라도">전라도</option>
											<option value="제주도">제주도</option>
									</select>
								</td>
						</tr>
						</table>
						<input type="button" value="가입하기" id="sBtn" align="center" class="btn btn-info btn-block">	
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