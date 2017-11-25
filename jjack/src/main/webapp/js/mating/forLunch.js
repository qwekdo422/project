$(document).ready(function(){
	// 좌표
	var lineY = [70, 225, 385, 540, 695];
	var lineX1 = [64, 151, 238, 325, 412];
	var lineX2 = [107, 194, 282, 369, 456];
	
	// 사다리 가로선 그리기
	for(var i = 0 ; i < ladderSize; i++) {
		//${'svg'}.append("");
	}

	// 사다리 세로선 위치를 저장할 변수
	var rowNo = [[], [], [], []];

	// 사다리의 분기점을 저장할 변수
	var branchP = [];
	var rowAbc = ['a', 'b', 'c', 'd', 'e'];
	
	// 사다리 만들기
	var makeLadder = function() {
		for(var i =0; i < 4; i++) {
			// 기존 위치 삭제
			rowNo[i].length=0;
			// 기존 사다리 세로선 삭제
			for(var l=0; l<5;l++) {
				// 현재 위치를 알아내 이미 선이 만들어졌을 경우 초기화
				var y1c = Number($(".ldVrt").eq(i*5+l).attr("y1"));
				var y2c = Number($(".ldVrt").eq(i*5+l).attr("y2"));
				//alert(y1c + ", " + y2c);
				if(y1c != y2c) {
					$(".ldVrt").eq(i*5+l).attr("y2", y2c-155);
				}
			}
			
			// 사다리 세로선을 만들 위치를 랜덤으로 생성해 배열로 저장
			var j=0;
			while( j < 5) {
				var no = Math.floor(Math.random() * 5);
				if(rowNo[i].indexOf(no) == -1) {
					rowNo[i].push(no);
					
					// 분기점도 추가
					var bp = "";
					if(i%2 == 0) {	// 홀수번째 줄일 때
						bp = rowAbc[i] + (2*no+1);
						branchP.push(bp);
						// 아랫줄의 분기점도 추가
						bp = rowAbc[i+1] + (2*no+1);
						branchP.push(bp);
					} else {	// 짝수번째 줄일때
						bp = rowAbc[i] + (2*no+2);
						branchP.push(bp);
						// 아랫줄의 분기점도 추가
						bp = rowAbc[i+1] + (2*no+2);
						branchP.push(bp);
					}
					
				}
				j++;
				if(rowNo[i].length<3 && j==5) {
					j--;
				}
			}	// while문 종료
			
			// 위에서 생성한 위치에 기반해 사다리 만들기
			for(var k=0; k<rowNo[i].length; k++) {
				var y2v = Number($(".ldVrt").eq(i*5+rowNo[i][k]).attr("y2"));
				$(".ldVrt").eq(i*5+rowNo[i][k]).attr("y2", y2v+155);
			}
		}
	}
	
	
	// 처음 페이지 로딩시 사다리 생성
	makeLadder();
	
	
	$("#changeLadder").click(function(){
		makeLadder();
	});
	
	
	
	
	
	
	
	// 사진 클릭시 사랑의 작대기 그리기
	$('figure img, figcaption').click(function(){
		//몇번째를 선택한건지 확인
		clickWho = $("figure").index($(this).parent());
		// 클릭한 사람이 선택한 상대의 순서를 알아내기
		lno = $(".lno").eq(clickWho).val();
		
	});
	
	
	
	
	
	
	
	
});
