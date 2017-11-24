$(document).ready(function(){
	// 모든 입소자가 상대를 선택하지 않았을 때 나타나는 문구
	if(allClear != 0) {
		$('#arrowsDiv').prepend("<h3 id='choiceClear'>아직 " + allClear + "명이 상대를 선택하지 않았습니다.</h3>");
	}

	// 작대기를 보낸 사람들(?번째)의 목록
	var doneArrows = [];
	
	// 점의 y 좌표
	var lineY = [70, 225, 385, 540, 695];
	
	// 사진 클릭시 사랑의 작대기 그리기
	$('figure img, figcaption').click(function(){
		//몇번째를 선택한건지 확인
		clickWho = $("figure").index($(this).parent());
		if(doneArrows.indexOf(clickWho) == -1) {
		//if(!doneArrows.contains(clickWho)) {
			// 선택한 사람을 실행시킨 사람들 목록에 추가
			doneArrows.push(clickWho);
			// 클릭한 사람이 선택한 상대의 순서를 알아내기
			lno = $(".lno").eq(clickWho).val();
			// 선을 그을 좌표를 설정하기
			$('line').eq(clickWho).children('.y2anm').attr('to', lineY[lno]);
			// 선그리기 애니메이션을 실행하기
			$('line').eq(clickWho).children()[0].beginElement();
			$('line').eq(clickWho).children()[1].beginElement();
		}
	});
	
	// 사랑의 작대기 완료시 결과 정리 창 띄우기
	$('#main').click(function(){
		if(doneArrows.length == (tCount+1)) {
			alertify.alert(sumText);
		}
		if(doneArrows.length == tCount) {
			doneArrows.push(10);
		}
	});
});