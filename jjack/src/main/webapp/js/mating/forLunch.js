$(document).ready(function(){
	// 선긋기 색깔 지정
	var goLineColor = ['#fe5f5f', 'LightSalmon', 'LightGreen ', 'LightSkyBlue', 'Plum'];
	
	// 패스긋기를 한번이라도 했으면 1
	var goPath = 0;
	
	// 점심 파트너를 저장할 배열
	var lunchP = [];
	
	// 사다리 가로선 그리기
	for(var i = 0 ; i < ladderSize; i++) {
		//${'svg'}.append("");
	}

	// 선긋기용 시작점 색 표시
	for(var i=0; i<5; i++) {
		$('.startPoint').eq(i).css('fill', goLineColor[i]);
	}
	
	// 사다리 세로선 위치를 저장할 변수
	var rowNo = [[], [], [], []];

	// 사다리의 분기점을 저장할 변수
	var branchP = [];
	var rowAbc = ['a', 'b', 'c', 'd', 'e'];
	
	// 사다리 만들기
	var makeLadder = function() {
		// 기존 분기점 삭제
		branchP.length=0;
		
		for(var i =0; i < 4; i++) {
			// 기존 위치 삭제
			rowNo[i].length=0;
			// 기존 사다리 세로선 삭제
			for(var l=0; l<5;l++) {
				// 현재 위치를 알아내 이미 선이 만들어졌을 경우 초기화
				var y1c = Number($(".ldVrt").eq(i*5+l).attr("y1"));
				var y2c = Number($(".ldVrt").eq(i*5+l).attr("y2"));
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
	
	// 사다리 변경 클릭시 사다리 생성
	$("#changeLadder").click(function(){
		if(goPath==1) {
			alertify.alert("게임을 진행하는 도중에는 사다리를 변경할 수 없습니다");
			return;
		}
		makeLadder();
	});
	
	var updateLP = function(e){
		$.ajax({
		      url: "../mating/updateLP.do",
		      method: "post",
		      data: {"g0":e[0], "g1":e[1]},
		      success: function(data) {
		      },
		      error:function(){
		    	  alert("에러!");
		      }
		  });
	}
	
	
	// 클릭한 사다리 경로 구성하기 함수
	var makePath = function(e){
		var goLinePath = [];
		var y = rowAbc[e];
		// 선택한 주체의 gno를 저장
		var lunchP = [];
		var wgno = $('.wgno').eq(e).val();
		lunchP.push(wgno);
		var xy;
		goLinePath.push(lineX[0] + ',' + lineY[rowAbc.indexOf(y)]);
		// lineY = [70, 225, 385, 540, 695];
		// lineX = [20, 64, 107, 151, 194, 238, 282, 325, 369, 412, 456, 500];
		// rowAbc = ['a', 'b', 'c', 'd', 'e'];
		for(var x=1; x<12; x++) {	// 한칸 전진
			// 현재 위치를 확인
			xy = y + x;
			// 현재 위치가 branchP에 있는지 확인
			if(branchP.indexOf(xy) != -1) {		// 현재 위치가 분기점이라면
				// 현재 위치를 저장하고
				goLinePath.push(lineX[x] + ',' + lineY[rowAbc.indexOf(y)]);
				if((rowAbc.indexOf(y)%2==1 && x%2==0) || (rowAbc.indexOf(y)%2==0 && x%2==1)){
					// 짝수번째 행의 짝수번째 열이거나 홀수번째 행의 홀수번째 열이라면 아래로
					y = rowAbc[rowAbc.indexOf(y)+1];
				} else {
					// 짝수번째 행의 홀수번째 열이거나 홀수번째 행의 짝수번째 열이라면 위로
					y = rowAbc[rowAbc.indexOf(y)-1];
				}
				// 행의 위치를 변환한 후 저장
				goLinePath.push(lineX[x] + ',' + lineY[rowAbc.indexOf(y)]);
			}
		}
		goLinePath.push(lineX[11] + ',' + lineY[rowAbc.indexOf(y)]);
		
		// 현재 y의 위치가 점심파트너
		var mIndex = rowAbc.indexOf(y);
		var mgno = $('.mgno').eq(mIndex).val();
		// 배열에 gno를 입력
		lunchP.push(mgno);
		// AJAX로 업데이트
		updateLP(lunchP);

		return goLinePath.join(' '); 
	}
	
	
	// 선 그리기 함수
	// 참조 : https://codepen.io/hari_shanx/pen/RPZqqM
	var offset = [0, 0, 0, 0, 0];
    function polylineToPath(clickWho, linePath) {
    	var lid = '#l' + clickWho;
    	//var polylines = document.querySelectorAll('.goLine');
    	//var polyline = polylines[clickWho];
    	var polyline = document.querySelector(lid);
        var svgNS = polyline.ownerSVGElement.namespaceURI;
        var path = document.createElementNS(svgNS, 'path');
        var coords = linePath;
        //var coords = polyline.getAttribute('points');
        path.setAttribute('d', 'M' + coords);
        var pname = 'p' + clickWho;
        path.setAttribute('id', pname);
        path.setAttribute('style', 'stroke:' + goLineColor[clickWho] + ';');
        var len = path.getTotalLength();
        path.style.strokeDashoffset = len;
        path.style.strokeDasharray = len + ',' + len;
        
        polyline.parentNode.appendChild(path);
        polyline.remove();
        //polyline.parentNode.replaceChild(path, polyline);
        animate(len, clickWho);
    }
    var	anim = [];
    function animate(len, clickWho) {
        if (!offset[clickWho]) offset[clickWho] = len;
        var pid = '#p' + clickWho
        var path = document.querySelector(pid);
        offset[clickWho] -= 5.5;
        path.style.strokeDashoffset = offset[clickWho];
        if (offset[clickWho] <= 0) 
            window.cancelAnimationFrame(anim[clickWho]);
        else anim[clickWho] = window.requestAnimationFrame(function(){
            animate(len, clickWho);
        });
    }
		
	// 사진 클릭시 사다리 그리기
	$('#women figure img, #women figcaption').click(function(){
		// 사다리를 한번이라도 그었는지 체크 (flag)
		goPath=1;
		//몇번째를 선택한건지 확인
		var clickWho = $("figure").index($(this).parent());
		// 해당되는 선의 경로를 파악하기
		var linePath = makePath(clickWho);
		// 경로에 따라 선을 그리기
		polylineToPath(clickWho, linePath);
	});
	
	
	
	
	
});
