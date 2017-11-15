$(document).ready(function() {
	//	==============  달력표시  ===================
	var tevent = {};
	var months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"];
	var date = new Date();
	$('#calendar').fullCalendar({
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,agendaWeek,agendaDay'
		},
		defaultDate : /*'2017-11-08'*/date.getTime(),
		editable : false,
		eventLimit : true, // allow "more" link when too many events
		/*events : tEvent,*/
		eventClick : function(event) {
			alert("이벤트 클릭");
			//	월을 숫자형태로 바꾸위해 영문으로된 월을 추출
			var inDay = event.start.toString().split(" ");
			//	1번째 인덱스에서 영문 월을 추출해서 대문자로 변환
			var month = inDay[1].toUpperCase();
			for(var i=0; i < months.length; i++) {
				if(month == months[i]) {
					$("#inDay").val(inDay[3]+"-"+(i+1)+"-"+inDay[2]);
				}
			}
		}
	
	});
	//	==============  달력표시  ===================
	
	//	달력이 만들어지고 나서 날짜를 클릭하면 모달창을 띄운다.
	$(".fc-day").attr("onclick", "modalView(this)");
	//	이전, 다음, today, month 버튼의 클래스명을 담은 배열
	var cName = ["fc-prev-button", "fc-next-button", "fc-today-button", "fc-month-button"];
	//	today, month, 이전, 다음 버튼을 클릭하면 달력이 다시 만들어지므로
	//	onclick 이벤트가 사라지므로 다시 넣어준다.
	$("button").click(function(){
		var btns = $("button");
		outer:
		for (var i = 0; i < btns.length; i++) {
			//	버튼들의 클래스명을 가져온다.
			var btn = $(btns[i]).attr("class");
			for (var j = 0; j < cName.length; j++) {
				//	버튼의 클래스명에 이전, 다음, today, month 버튼의 클래스명을 포함하고 있을 때 
				if(btn.indexOf(cName[j]) != -1) {
					// 해당 클래스명이 존재하는 버튼이면 onclick 이벤트를 넣어주고 모든 for문을 종료한다.
					$(".fc-day").attr("onclick", "modalView(this)");
					break outer;
				}
			}
		}
	});	//	버튼 클릭이벤트 종료
	
	
	
});	// document 종료
	

//	달력이 다시 만들어 질 경우 날짜를 클릭하면 모달창을 띄우기 위한 함수
function modalView(target) {
	//	날짜 클릭 시 모달창 출력
	$(target).attr("data-toggle", "modal");
	$(target).attr("data-target", "#squarespaceModal");
	//	날짜클릭 시 그 날짜를 모달창 상세보기에 이벤트 시작일을 자동으로 입력
	$("#startEvent").val($(target).data("date"));
}
	
