$(document).ready(function(){

	if(pwfail == 0){
		alertify.alert("아이디와 비밀번호가 유효하지 않습니다.");
		
	}
	
	
	//로그인 무결성 검사 처리 함수
	$logIn = function(){
		
		var id=$("#id").val(); 
		var pw=$("#pw").val(); 
		
		if(id==""){
			alertify.alert("아이디를 입력하십시오"); 
			$("#id").focus(); 
			return; 
		}

		if(pw==""){
			alertify.alert("비밀번호를 입력하십시오"); 
		
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