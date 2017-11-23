$(document).ready(function(){
	// 점의 y 좌표
	var lineY = [70, 225, 385, 540, 695];
	
	// 사진 클릭시 사랑의 작대기 그리기
	$('figure img, figcaption').click(function(){
		//몇번째를 선택한건지 확인
		clickWho = $("figure").index($(this).parent());
		// 클릭한 사람이 선택한 상대의 순서를 알아내기
		lno = $(".lno").eq(clickWho).val();
		
	});
	
	
	
	
	
	
	
	
});
