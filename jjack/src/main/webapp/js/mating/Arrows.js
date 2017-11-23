$(document).ready(function(){
	// 모든 입소자가 상대를 선택하지 않았을 때 나타나는 문구
	if(allClear != 0) {
		$('#arrowsDiv').prepend("<h3 id='choiceClear'>아직 " + allClear + "명이 상대를 선택하지 않았습니다.</h3>");
	}

	// 점의 y 좌표
	var lineY = [70, 225, 385, 540, 695];
	
	// 사진 클릭시 사랑의 작대기 그리기
	$('figure img, figcaption').click(function(){
		//몇번째를 선택한건지 확인
		clickWho = $("figure").index($(this).parent());
		// 클릭한 사람이 선택한 상대의 순서를 알아내기
		lno = $(".lno").eq(clickWho).val();
		// 선을 그을 좌표를 설정하기
		$('line').eq(clickWho).children('.y2anm').attr('to', lineY[lno]);
		// 선그리기 애니메이션을 실행하기
		var anis= $('line').eq(clickWho).children();
		drawLine(anis);
	});
	
});