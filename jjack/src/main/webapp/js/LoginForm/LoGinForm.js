$(document).ready(function(){
	
	//로그인 무결성 검사 처리 
	$("#lBtn").click(function(){
	
		var id=$("#id").val(); 
		var pw=$("#pw").val(); 
		
		if(id==""){
			alert("아이디를 입력하십시오"); 
			$("#id").focus(); 
			return; 
		}

		if(pw==""){
			alert("비밀번호를 입력하십시오"); 
		
			return ; 
		}

		$("#lfrm").submit(); 
	});

});