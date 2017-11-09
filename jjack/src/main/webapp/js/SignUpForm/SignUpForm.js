$(document).ready(function(){
 
	$("#sBtn").click(function(){
		var id=$("#id").val();
		var pw=$("#pw").val();
		var cpw=$("#cpw").val();
		var name=$("#name").val();
		var sex=$(':input[name=sex]:radio:checked'); //val() 을 붙이기보다는 이 구문 이 자체가 데이터이다. 
		var birth=$("#birth").val();
		var email=$("#email").val();
		var loc=$("#loc").val();
			
	
		if(id==""){
			alert("아이디를 입력하십시오");
			$("#id").focus(); 
			return; 	
		}
		
		
		
		
		if(pw==""){
			alert("비밀번호를 입력하십시오");
			$("#pw").focus(); 
			return; 	
		}
		
		if(cpw==""){
			alert("비밀번호를 확인하십시오");
			$("#cpw").focus(); 
			return; 	
		}
		
		if(pw !=cpw){
			alert("비밀번호가 다릅니다."); 
			$("#cpw").focus(); 
			$("#cpw").val("");//천재
			return; 
		}
		
		if(name==""){
			alert("이름을 입력하십시오");
			$("#name").focus(); 
			return; 	
		}
		
		
		
		
		//var sex=$(':input[name=sex]:radio:checked'); 
		//$(':radio[name="sex"]:checked');
		if(sex.length ==0){ //즉 선택하지 않으면 value의 데이터가 0이 되니까!
			alert("성별을 선택하십시오");
			return; 	
		}
	
		
		
		if(birth=="" ){
			alert("생일을 입력하십시오");
			$("#birth").focus(); 
			return; 	
		}
		
		if(email==""){
			alert("이메일을 입력하십시오");
			$("#email").focus(); 
			return; 	
		}
		
		if(loc==""){
			alert("지역을 입력하십시오");
			$("#loc").focus(); 
			return; 	
		}
		
		$("#Sfrm").submit(); 
	});// $("#sBtn").click(function() 함수 종료 

	
		//생일 폼에 달력뜨게끔 해주는 코드 
		$("#birth").datepicker({
			dateFormat: 'yy-mm-dd', //텍스트 필드에 입력되는 날짜 형식 
			prevText: '이전 달',
			nextText:'다음 달',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			 dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
			 changeMonth:true,
			 changeYear:true, 
			 showMonthAfterYear:true, //월, 년 순의 셀렉트 박스를 년, 월 순으로 바꿔준다. 
			 yearRange: 'c-100:c'
				
			});//	$("#birth").datepicker() 함수 종료 

		

	
		//중복검사 함수 		
		//버튼을 누르면 -> 폼에 저장한 데이터를 가지고 와서 -> 질의문을 검색하고 -> 존재하면 1을 반환시키고 존재하지 않으면 0을 반환시킨다. 
		$("#oBtn").click(function(){
	
		window.open("http://www.naver.com",width=30,height=30,left=0,top=0,); 
		});
		
	
	
		
	
	
	
});//제이쿼리 종료 