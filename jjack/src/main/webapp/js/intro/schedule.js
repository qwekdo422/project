$(document).ready(function(){
			
	// 일정그림 보여주기 부트스트랩 방식
 	$('.nav-tabs a').on('click', function (e) {
 		e.preventDefault();	// 클릭시 화면 위로 가는걸 방지
 		$(this).tab('show');
	});
 	
});
	