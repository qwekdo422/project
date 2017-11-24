$(document).ready(function(){
	
	//로그인 무결성 검사 처리 함수
	$logIn = function(){
		
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
	} 
	
	// 로그인 버튼 클릭시 로그인
	$("#lBtn").click(function(){
		$logIn();
	});
	
	// 비밀번호창에서 엔터쳤을때 로그인. 안됨
	$("#pw").keypress(function(event){
        var keycode = (event.keyCode ? event.keyCode : event.which);
        if(keycode == '13'){
			$logIn();
		}
	});

});